import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/city_details_model.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/city_model.dart';
import 'package:beit_alnakha_admin/features/locations/param/city_param.dart';
import 'package:dartz/dartz.dart';

abstract class CityRepo {
  Future<Either<Failure, CityModel>> getCity(CityParam param);
  Future<Either<Failure, CityDetailsModel>> getCityById(String id);
  Future<Either<Failure, CityDetailsModel>> editCity(CityDetailsModel city);
  Future<Either<Failure, Unit>> deleteCity(String id);
}
