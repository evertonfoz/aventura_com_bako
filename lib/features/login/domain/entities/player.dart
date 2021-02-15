import 'package:flutter/foundation.dart';

class Player {
  final String id;
  final String name;
  final String email;
  final String imgURL;
  final int points;
  final int exp;

  Player(
      {@required this.id,
      @required this.name,
      @required this.email,
      @required this.imgURL,
      this.points,
      this.exp});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Player &&
        o.id == id &&
        o.name == name &&
        o.email == email &&
        o.imgURL == imgURL &&
        o.points == points &&
        o.exp == exp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        imgURL.hashCode ^
        points.hashCode ^
        exp.hashCode;
  }
}
