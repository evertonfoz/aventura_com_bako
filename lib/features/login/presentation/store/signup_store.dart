import 'package:aventura_com_bako/features/login/domain/entities/email.dart';
import 'package:aventura_com_bako/features/login/domain/entities/password.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  @observable
  Image avatar;

  @action
  Future<void> getGaleryImage() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 30);
    if (pickedImage != null) {
      avatar = Image.memory(await pickedImage.readAsBytes());
    }
  }

  @observable
  String name = "";

  @action
  void setName(String value) => name = value;

  @computed
  bool get isNameFilled => name.isNotEmpty;

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get isEmailValid => Email.isValidEmail(email);

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isPasswordValid => Password.isValidPassword(password);

  @observable
  String confirmedPassword = "";

  @action
  void setConfirmedPassword(String value) => confirmedPassword = value;

  @computed
  bool get isMatchPassword => password == confirmedPassword;

  @computed
  bool get isFormValid =>
      isEmailValid && isPasswordValid && isMatchPassword && isNameFilled;
}
