import 'package:flutter/foundation.dart';

class Password {
  final String value;

  Password._(this.value);

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Password && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Password(value: $value)';

  static bool isValidPassword(String input) {
    if (input.length >= 6) {
      return true;
    } else {
      return false;
    }
  }
}

String validatePassword(String input) {
  if (input.length >= 6) {
    return input;
  } else {
    throw WeakPasswordFailure(weakPass: input);
  }
}

class WeakPasswordFailure {
  final String weakPass;

  WeakPasswordFailure({@required this.weakPass});
}
