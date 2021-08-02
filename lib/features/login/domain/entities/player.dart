import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PlayerEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final Image avatar;
  final int points;
  final int exp;
  final String token;

  PlayerEntity(
      {@required this.id,
      @required this.name,
      @required this.email,
      @required this.avatar,
      @required this.token,
      this.points,
      this.exp});

  @override
  List<Object> get props => [id, name, email, avatar, points, exp, token];
}
