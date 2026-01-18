import 'package:beit_alnakha_admin/core/helper/models/pagination.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/region_details_model.dart';

class RegionModel {
  final List<RegionDetailsModel> regions;
  final PaginationModel? pagination;

  RegionModel({required this.regions, this.pagination});

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
    regions: List<RegionDetailsModel>.from(
      (json['regions'] as List<dynamic>).map(
        (x) => RegionDetailsModel.fromJson(x),
      ),
    ),
    pagination: json['pagination'] != null
        ? PaginationModel.fromJson(json['pagination'])
        : null,
  );
}
