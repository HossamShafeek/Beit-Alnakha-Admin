import 'package:dartz/dartz.dart';
import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/features/authentication/data/models/authentication_model/authentication_model.dart';
import 'package:beit_alnakha_admin/features/authentication/params/login_params.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticationModel>> login({
    required LoginParams loginParams,
  });
}
