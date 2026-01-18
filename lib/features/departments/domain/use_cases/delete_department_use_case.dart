import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/departments/domain/repo/department_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteDepartmentUseCase extends UseCase<Unit, String> {
  final DepartmentRepo departmentRepo;
  DeleteDepartmentUseCase({required this.departmentRepo});

  @override
  Future<Either<Failure, Unit>> call(String params) {
    return departmentRepo.deleteDepartment(params);
  }
}
