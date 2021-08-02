import 'package:aventura_com_bako/features/login/domain/entities/player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlayerModel extends PlayerEntity {
  final String id;
  final String name;
  final String email;
  final Image avatar;
  final String token;

  PlayerModel(
      {@required this.id,
      @required this.name,
      @required this.email,
      @required this.avatar,
      this.token});

}
