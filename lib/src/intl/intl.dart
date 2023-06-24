import 'package:flutter/cupertino.dart';

abstract class Intl implements DefaultWidgetsLocalizations {
  String get appName;
  
  String get home => "Home";
  String couldNotCompleteTheRequest =
      "Não foi possível completar a solicitação, por favor, tente novamente!";
  String confirmationLogoutMessage = "Deseja realmente fazer o logout?";

  String get login_failed =>
      "Não foi possível efetuar o login com os dados informados!";

  String get loginSuccessful => "Login realizado com sucesso.";

  String get userAccountCreatedMessage => "Sua conta foi criada com sucesso";

  String get duplicatedEmail => "O email informado não está mais disponível.";

  String get email => "E-mail";

  String get newRegister => "Cadastre-se";

  String get name => "Nome";

  String get password => "Senha";

  String get doLogin => "Login";

  String get signIn => "Cadastrar";

  String get verifyTheInternetConnection =>
      "Não foi possível completar a solicitação, verifique sua conexão com a internet.";

  String get noResultFound => "Nenhuma informação a ser mostrada por aqui";

  String get profile => "Perfil";

  String get loading => "Carregando...";

  String get cancel => "Cancelar";

  String get cpfCnpj => "CPF/CNPJ";

  String get cellphone => "Celular";

  String get phoneNumber => "Telefone";

  String get save => "Salvar";

  String get search => "Pesquisar";

  String get textContinue => "Continuar";

  String get weakPasswordMessage =>
      "A senha deve conter ao menos, um caractere especial  exemplo @, uma letra maiuscula e uma minuscula e número";

  String get yes => "Sim";
}

