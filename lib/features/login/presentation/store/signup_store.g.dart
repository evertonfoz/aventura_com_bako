// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStore, Store {
  Computed<bool> _$isNameFilledComputed;

  @override
  bool get isNameFilled =>
      (_$isNameFilledComputed ??= Computed<bool>(() => super.isNameFilled,
              name: '_SignUpStore.isNameFilled'))
          .value;
  Computed<bool> _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_SignUpStore.isEmailValid'))
          .value;
  Computed<bool> _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_SignUpStore.isPasswordValid'))
          .value;
  Computed<bool> _$isMatchPasswordComputed;

  @override
  bool get isMatchPassword =>
      (_$isMatchPasswordComputed ??= Computed<bool>(() => super.isMatchPassword,
              name: '_SignUpStore.isMatchPassword'))
          .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignUpStore.isFormValid'))
          .value;

  final _$avatarAtom = Atom(name: '_SignUpStore.avatar');

  @override
  Image get avatar {
    _$avatarAtom.reportRead();
    return super.avatar;
  }

  @override
  set avatar(Image value) {
    _$avatarAtom.reportWrite(value, super.avatar, () {
      super.avatar = value;
    });
  }

  final _$nameAtom = Atom(name: '_SignUpStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignUpStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignUpStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmedPasswordAtom = Atom(name: '_SignUpStore.confirmedPassword');

  @override
  String get confirmedPassword {
    _$confirmedPasswordAtom.reportRead();
    return super.confirmedPassword;
  }

  @override
  set confirmedPassword(String value) {
    _$confirmedPasswordAtom.reportWrite(value, super.confirmedPassword, () {
      super.confirmedPassword = value;
    });
  }

  final _$getGaleryImageAsyncAction =
      AsyncAction('_SignUpStore.getGaleryImage');

  @override
  Future<void> getGaleryImage() {
    return _$getGaleryImageAsyncAction.run(() => super.getGaleryImage());
  }

  final _$_SignUpStoreActionController = ActionController(name: '_SignUpStore');

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmedPassword(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setConfirmedPassword');
    try {
      return super.setConfirmedPassword(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
avatar: ${avatar},
name: ${name},
email: ${email},
password: ${password},
confirmedPassword: ${confirmedPassword},
isNameFilled: ${isNameFilled},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isMatchPassword: ${isMatchPassword},
isFormValid: ${isFormValid}
    ''';
  }
}
