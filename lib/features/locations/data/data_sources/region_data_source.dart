import 'package:beit_alnakha_admin/core/api/api_services.dart';
import 'package:beit_alnakha_admin/core/api/end_points.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/region_details_model.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/region_model.dart';
import 'package:beit_alnakha_admin/features/locations/param/region_param.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class RegionDataSource {
  Future<RegionModel> getRegion(RegionParam param);
  Future<RegionDetailsModel> getRegionById(String id);
  Future<RegionDetailsModel> editRegion(RegionDetailsModel region);
  Future<Unit> deleteRegion(String id);
}

@LazySingleton(as: RegionDataSource)
class RegionDataSourceImpl implements RegionDataSource {
  final ApiServices apiServices;
  RegionDataSourceImpl({required this.apiServices});

  @override
  Future<RegionModel> getRegion(RegionParam param) async {
    final response = await apiServices.get(
      endPoint: EndPoints.regions,
      queryParameters: param.toJson(),
    );
    return RegionModel.fromJson(response.data);
  }

  @override
  Future<RegionDetailsModel> getRegionById(String id) async {
    final response = await apiServices.get(
      endPoint: "${EndPoints.regions}/$id",
    );
    return RegionDetailsModel.fromJson(response.data);
  }

  @override
  Future<RegionDetailsModel> editRegion(RegionDetailsModel region) async {
    final response = await apiServices.patch(
      endPoint: "${EndPoints.regions}/${region.id}",
      data: region.toJson(),
    );
    return RegionDetailsModel.fromJson(response.data);
  }

  @override
  Future<Unit> deleteRegion(String id) async {
    await apiServices.delete(endPoint: "${EndPoints.regions}/$id");
    return (unit);
  }
}
