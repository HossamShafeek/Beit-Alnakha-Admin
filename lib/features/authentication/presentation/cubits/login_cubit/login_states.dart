import 'package:beit_alnakha_admin/features/authentication/data/models/authentication_model/authentication_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final AuthenticationModel authenticationModel;

  LoginSuccessState(this.authenticationModel);
}

class LoginFailureState extends LoginStates {
  final String error;

  LoginFailureState(this.error);
}

class LoginChangePasswordVisibilityState extends LoginStates {}

class CheckFieldsIsEmptyState extends LoginStates {}
