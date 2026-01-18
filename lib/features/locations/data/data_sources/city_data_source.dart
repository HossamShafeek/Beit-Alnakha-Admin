import 'package:beit_alnakha_admin/core/api/api_services.dart';
import 'package:beit_alnakha_admin/core/api/end_points.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/city_details_model.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/city_model.dart';
import 'package:beit_alnakha_admin/features/locations/param/city_param.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class CityDataSource {
  Future<CityModel> getCity(CityParam param);
  Future<CityDetailsModel> getCityById(String id);
  Future<CityDetailsModel> editCity(CityDetailsModel city);
  Future<Unit> deleteCity(String id);
}

@LazySingleton(as: CityDataSource)
class CityDataSourceImpl implements CityDataSource {
  final ApiServices apiServices;
  CityDataSourceImpl({required this.apiServices});

  @override
  Future<CityModel> getCity(CityParam param) async {
    final response = await apiServices.get(
      endPoint: EndPoints.cities,
      queryParameters: param.toJson(),
    );
    return CityModel.fromJson(response.data);
  }

  @override
  Future<CityDetailsModel> getCityById(String id) async {
    final response = await apiServices.get(endPoint: "${EndPoints.cities}/$id");
    return CityDetailsModel.fromJson(response.data);
  }

  @override
  Future<CityDetailsModel> editCity(CityDetailsModel city) async {
    final response = await apiServices.patch(
      endPoint: EndPoints.cities,
      data: city.toJson(),
    );
    return CityDetailsModel.fromJson(response.data);
  }

  @override
  Future<Unit> deleteCity(String id) async {
    await apiServices.delete(endPoint: "${EndPoints.cities}/$id");
    return (unit);
  }
}
