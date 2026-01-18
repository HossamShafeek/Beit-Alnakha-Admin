import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/region_details_model.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/region_model.dart';
import 'package:beit_alnakha_admin/features/locations/param/region_param.dart';
import 'package:dartz/dartz.dart';

abstract class RegionRepo {
  Future<Either<Failure, RegionModel>> getRegion(RegionParam param);
  Future<Either<Failure, RegionDetailsModel>> getRegionById(String id);
  Future<Either<Failure, RegionDetailsModel>> editRegion(
    RegionDetailsModel region,
  );
  Future<Either<Failure, Unit>> deleteRegion(String id);
}
