import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/region_details_model.dart';
import 'package:beit_alnakha_admin/features/locations/domain/repo/region_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetSingleRegionUseCase extends UseCase<RegionDetailsModel, String> {
  final RegionRepo regionRepo;
  GetSingleRegionUseCase({required this.regionRepo});

  @override
  Future<Either<Failure, RegionDetailsModel>> call(String param) async {
    return await regionRepo.getRegionById(param);
  }
}
