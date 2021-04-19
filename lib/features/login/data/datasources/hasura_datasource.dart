import 'dart:convert';

import 'package:aventura_com_bako/features/login/domain/entities/player.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HasuraDatasource {
  Future<QueryResult> call(
      {QueryOptions queryOptions,
      MutationOptions mutationOptions,
      @required AuthLink authLink}) {
    HttpLink url =
        HttpLink('https://hasura-bako-utfpr-test.herokuapp.com/v1/graphql');
    Link link = authLink.concat(url);

    GraphQLClient client = GraphQLClient(link: link, cache: GraphQLCache());

    if (queryOptions != null) {
      return client.query(queryOptions);
    } else {
      return client.mutate(mutationOptions);
    }
  }

  Future<PlayerEntity> complementInformation(PlayerEntity user) async {
    AuthLink token = AuthLink(
      getToken: () async => 'Bearer ${user.token}',
    );

    String uid = user.id;
    String query = r'''
    query ComplementInformations($uid:String!) {
  users(where: {user_id: {_eq: $uid}}) {
    imgByte
    exp
    points
  }
}
''';

    QueryOptions options = QueryOptions(
      document: gql(query),
      variables: <String, dynamic>{'uid': uid},
    );
    await this.call(authLink: token, queryOptions: options).then((result) {

      Image avatar =
          Image.memory(base64Decode(result.data['users'][0]['imgByte']));

      return PlayerEntity(
          id: user.id,
          name: user.name,
          email: user.email,
          avatar: avatar,
          token: user.token);
    });
  }

  Future<bool> uploadAvatar(
      {@required String avatarBase64,
      @required String token,
      @required String userId}) async {
    AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $token',
    );
    String mutation =
        '''mutation uploadPicture(\$img: String!, \$uid: String!) {
  update_users(where: {user_id: {_eq: \$uid}}, _set: {imgByte: \$img}) {
    returning {
      user_id
      imgByte
    }
  }
}
''';

    MutationOptions options = MutationOptions(
        document: gql(mutation),
        variables: <String, dynamic>{'uid': userId, 'img': avatarBase64});

    await this.call(authLink: authLink, mutationOptions: options);

    return true;
  }
}
