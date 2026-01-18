import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/region_model.dart';
import 'package:beit_alnakha_admin/features/locations/domain/repo/region_repo.dart';
import 'package:beit_alnakha_admin/features/locations/param/region_param.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetAllRegionUseCase extends UseCase<RegionModel, RegionParam> {
  final RegionRepo regionRepo;
  GetAllRegionUseCase({required this.regionRepo});

  @override
  Future<Either<Failure, RegionModel>> call(RegionParam param) async {
    return await regionRepo.getRegion(param);
  }
}
