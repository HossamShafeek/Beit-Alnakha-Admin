import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/departments/data/models/deparment_details_model.dart';
import 'package:beit_alnakha_admin/features/departments/domain/repo/department_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetSingleDepartmentUseCase
    extends UseCase<DepartmentDetailsModel, String> {
  final DepartmentRepo departmentRepo;
  GetSingleDepartmentUseCase({required this.departmentRepo});

  @override
  Future<Either<Failure, DepartmentDetailsModel>> call(String params) {
    return departmentRepo.getDepartmentsById(params);
  }
}
