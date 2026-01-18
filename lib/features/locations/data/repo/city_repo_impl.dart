import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/features/locations/data/data_sources/city_data_source.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/city_details_model.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/city_model.dart';
import 'package:beit_alnakha_admin/features/locations/domain/repo/city_repo.dart';
import 'package:beit_alnakha_admin/features/locations/param/city_param.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CityRepoImpl implements CityRepo {
  final CityDataSource cityDataSource;
  CityRepoImpl({required this.cityDataSource});

  @override
  Future<Either<Failure, CityModel>> getCity(CityParam param) async {
    try {
      final response = await cityDataSource.getCity(param);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CityDetailsModel>> getCityById(String id) async {
    try {
      final response = await cityDataSource.getCityById(id);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CityDetailsModel>> editCity(
    CityDetailsModel city,
  ) async {
    try {
      final response = await cityDataSource.editCity(city);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCity(String id) async {
    try {
      final response = await cityDataSource.deleteCity(id);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
