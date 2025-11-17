import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/features/authentication/data/models/authentication_model/authentication_model.dart';
import 'package:beit_alnakha_admin/features/authentication/domain/use_cases/login_use_case.dart';
import 'package:beit_alnakha_admin/features/authentication/params/login_params.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/cubits/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  final LoginUseCase loginUseCase;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(LoginChangePasswordVisibilityState());
  }

  AuthenticationModel? authenticationModel;

  Future<void> login() async {
    emit(LoginLoadingState());
    Either<Failure, AuthenticationModel> result;
    result = await loginUseCase.call(
      LoginParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold(
      (failure) {
        emit(LoginFailureState(failure.error));
      },
      (authenticationModel) async {
        this.authenticationModel = authenticationModel;
        emit(LoginSuccessState(authenticationModel));
      },
    );
  }
}
