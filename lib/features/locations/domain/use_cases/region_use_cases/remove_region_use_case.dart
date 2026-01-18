import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/locations/domain/repo/region_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RemoveRegionUseCase extends UseCase<Unit, String> {
  final RegionRepo regionRepo;
  RemoveRegionUseCase({required this.regionRepo});

  @override
  Future<Either<Failure, Unit>> call(String param) async {
    return await regionRepo.deleteRegion(param);
  }
}
