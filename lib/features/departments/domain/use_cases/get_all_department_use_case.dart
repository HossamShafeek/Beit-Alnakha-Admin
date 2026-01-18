import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/departments/data/models/department_model.dart';
import 'package:beit_alnakha_admin/features/departments/domain/repo/department_repo.dart';
import 'package:beit_alnakha_admin/features/departments/param/department_filter_param_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetAllDepartmentUseCase
    extends UseCase<DepartmentModel, DepartmentFilterParamModel> {
  final DepartmentRepo departmentRepo;
  GetAllDepartmentUseCase({required this.departmentRepo});

  @override
  Future<Either<Failure, DepartmentModel>> call(
    DepartmentFilterParamModel params,
  ) {
    return departmentRepo.getDepartments(params);
  }
}
