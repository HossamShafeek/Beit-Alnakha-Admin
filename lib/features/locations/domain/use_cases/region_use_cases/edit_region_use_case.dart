import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/region_details_model.dart';
import 'package:beit_alnakha_admin/features/locations/domain/repo/region_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class EditRegionUseCase
    extends UseCase<RegionDetailsModel, RegionDetailsModel> {
  final RegionRepo regionRepo;
  EditRegionUseCase({required this.regionRepo});

  @override
  Future<Either<Failure, RegionDetailsModel>> call(
    RegionDetailsModel param,
  ) async {
    return await regionRepo.editRegion(param);
  }
}
