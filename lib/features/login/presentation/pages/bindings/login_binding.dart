import 'package:aventura_com_bako/features/login/data/datasources/auth_datasource.dart';
import 'package:aventura_com_bako/features/login/data/repositories/auth_repository_implementation.dart';
import 'package:aventura_com_bako/features/login/domain/usecases/email_login_usecase.dart';
import 'package:aventura_com_bako/features/login/presentation/pages/controllers/login_screen_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    final AuthDatasourceImplementation datasource =
        AuthDatasourceImplementation(firebaseAuth: FirebaseAuth.instance);
    final AuthRepositoryImplementation repository =
        AuthRepositoryImplementation(datasource);
    Get.lazyPut<EmailLoginUsecase>(() => EmailLoginUsecase(repository));
    Get.put<LoginScreenController>(LoginScreenController());
  }
}
