import 'package:beit_alnakha_admin/core/helper/models/pagination.dart';
import 'package:beit_alnakha_admin/features/sliders/data/models/slider_details_model.dart';

class SliderModel {
  final List<SliderDetailsModel> sliders;
  final PaginationModel? pagination;

  SliderModel({this.sliders = const [], this.pagination});

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    sliders: List<SliderDetailsModel>.from(
      (json['sliders'] as List).map((x) => SliderDetailsModel.fromJson(x)),
    ),
    pagination: json['pagination'] != null
        ? PaginationModel.fromJson(json['pagination'])
        : null,
  );
}
