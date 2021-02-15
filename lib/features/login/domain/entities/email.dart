import 'package:flutter/foundation.dart';

/// Armazena o [Email]
/// 
/// Caso não seja um email válido, joga um [InvalidEmailFailure].
class Email {
  final String value;

  factory Email(String input) {
    assert(input != null);
    return Email._(
      validateEmail(input),
    );
  }

  const Email._(this.value);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Email && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Email($value)';
}

/// valida o [Email] usando expressões regulares
String validateEmail(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return input;
  } else {
    throw InvalidEmailFailure(invalidEmail: input);
  }
}

class InvalidEmailFailure {
  final String invalidEmail;

  InvalidEmailFailure({@required this.invalidEmail});
}
