import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/features/authentication/data/data_source/authentication_local_data_source.dart';
import 'package:beit_alnakha_admin/features/authentication/data/data_source/authentication_remote_data_source.dart';
import 'package:beit_alnakha_admin/features/authentication/data/models/authentication_model/authentication_model.dart';
import 'package:beit_alnakha_admin/features/authentication/domain/repository/authentication_repository.dart';
import 'package:beit_alnakha_admin/features/authentication/params/login_params.dart';

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;
  final AuthenticationLocalDataSource authenticationLocalDataSource;

  AuthenticationRepositoryImplementation({
    required this.authenticationRemoteDataSource,
    required this.authenticationLocalDataSource,
  });

  @override
  Future<Either<Failure, AuthenticationModel>> login({
    required LoginParams loginParams,
  }) async {
    try {
      AuthenticationModel authenticationModel =
          await authenticationRemoteDataSource.login(loginParams: loginParams);
      await authenticationLocalDataSource.saveUserData(authenticationModel);
      return Right(authenticationModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
