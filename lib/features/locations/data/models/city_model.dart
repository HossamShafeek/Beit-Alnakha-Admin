import 'package:beit_alnakha_admin/core/helper/models/pagination.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/city_details_model.dart';

class CityModel {
  final List<CityDetailsModel> cities;
  final PaginationModel? pagination;

  CityModel({this.cities = const [], this.pagination});

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    cities: List<CityDetailsModel>.from(
      (json['cities'] as List).map((x) => CityDetailsModel.fromJson(x)),
    ),
    pagination: json['pagination'] != null
        ? PaginationModel.fromJson(json['pagination'])
        : null,
  );
}
