import '../../core/ui/messages/messages_mixin.dart';
import '../../models/message_model.dart';
import '../../services/login/login_service.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with MessagesMixin {
  final LoginService _loginService;
  final _message = Rxn<MessageModel>();

  LoginController({required LoginService loginService})
      : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  Future<void> login() async {
    try {
      await _loginService.login().asyncLoader();
      _message(
        MessageModel.info(
          title: 'Login',
          message: 'Login Realizado com sucesso',
        ),
      );
    } catch (e) {
      _message(
        MessageModel.error(title: 'Error', message: 'Erro ao realizar o login'),
      );
    }
  }
}
