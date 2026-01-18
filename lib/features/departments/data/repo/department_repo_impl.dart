import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/features/departments/data/data_sources/department_data_source.dart';
import 'package:beit_alnakha_admin/features/departments/data/models/deparment_details_model.dart';
import 'package:beit_alnakha_admin/features/departments/data/models/department_model.dart';
import 'package:beit_alnakha_admin/features/departments/domain/repo/department_repo.dart';
import 'package:beit_alnakha_admin/features/departments/param/department_filter_param_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DepartmentRepoImpl implements DepartmentRepo {
  final DepartmentDataSource departmentDataSource;
  DepartmentRepoImpl({required this.departmentDataSource});

  @override
  Future<Either<Failure, DepartmentModel>> getDepartments(
    DepartmentFilterParamModel params,
  ) async {
    try {
      final result = await departmentDataSource.getDepartments(params);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DepartmentDetailsModel>> getDepartmentsById(
    String id,
  ) async {
    try {
      final result = await departmentDataSource.getDepartmentsById(id);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DepartmentDetailsModel>> editDepartment(
    DepartmentDetailsModel params,
  ) async {
    try {
      final result = await departmentDataSource.editDepartment(params);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteDepartment(String id) async {
    try {
      await departmentDataSource.deleteDepartment(id);
      return Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
