import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/authentication/data/models/authentication_model/authentication_model.dart';
import 'package:beit_alnakha_admin/features/authentication/domain/repository/authentication_repository.dart';
import 'package:beit_alnakha_admin/features/authentication/params/login_params.dart';

@LazySingleton()
class LoginUseCase extends UseCase<AuthenticationModel, LoginParams> {
  final AuthenticationRepository authenticationRepository;

  LoginUseCase({required this.authenticationRepository});

  @override
  Future<Either<Failure, AuthenticationModel>> call(LoginParams params) {
    return authenticationRepository.login(loginParams: params);
  }
}
