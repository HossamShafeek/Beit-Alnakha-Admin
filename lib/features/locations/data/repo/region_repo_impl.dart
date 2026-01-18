import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/features/locations/data/data_sources/region_data_source.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/region_details_model.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/region_model.dart';
import 'package:beit_alnakha_admin/features/locations/domain/repo/region_repo.dart';
import 'package:beit_alnakha_admin/features/locations/param/region_param.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RegionRepoImpl implements RegionRepo {
  final RegionDataSource regionDataSource;
  RegionRepoImpl({required this.regionDataSource});

  @override
  Future<Either<Failure, RegionModel>> getRegion(RegionParam param) async {
    try {
      final response = await regionDataSource.getRegion(param);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegionDetailsModel>> getRegionById(String id) async {
    try {
      final response = await regionDataSource.getRegionById(id);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegionDetailsModel>> editRegion(
    RegionDetailsModel region,
  ) async {
    try {
      final response = await regionDataSource.editRegion(region);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteRegion(String id) async {
    try {
      final response = await regionDataSource.deleteRegion(id);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
