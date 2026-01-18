import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/features/departments/data/models/deparment_details_model.dart';
import 'package:beit_alnakha_admin/features/departments/data/models/department_model.dart';
import 'package:beit_alnakha_admin/features/departments/param/department_filter_param_model.dart';
import 'package:dartz/dartz.dart';

abstract class DepartmentRepo {
  Future<Either<Failure, DepartmentModel>> getDepartments(
    DepartmentFilterParamModel params,
  );
  Future<Either<Failure, DepartmentDetailsModel>> getDepartmentsById(String id);
  Future<Either<Failure, DepartmentDetailsModel>> editDepartment(
    DepartmentDetailsModel params,
  );
  Future<Either<Failure, Unit>> deleteDepartment(String id);
}
