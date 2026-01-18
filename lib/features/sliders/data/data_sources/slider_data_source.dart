import 'package:beit_alnakha_admin/core/api/api_services.dart';
import 'package:beit_alnakha_admin/core/api/end_points.dart';
import 'package:beit_alnakha_admin/features/sliders/data/models/slider_details_model.dart';
import 'package:beit_alnakha_admin/features/sliders/data/models/slider_model.dart';
import 'package:beit_alnakha_admin/features/sliders/param/slider_param.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class SliderDataSource {
  Future<SliderModel> getSliders(SliderParam param);
  Future<SliderDetailsModel> getSliderById(String id);
  Future<SliderDetailsModel> editSlider(SliderDetailsModel slider);
  Future<SliderDetailsModel> createSlider(SliderDetailsModel slider);
  Future<Unit> deleteSlider(String id);
}

@LazySingleton(as: SliderDataSource)
class SliderDataSourceImpl implements SliderDataSource {
  final ApiServices apiServices;
  SliderDataSourceImpl({required this.apiServices});

  @override
  Future<SliderModel> getSliders(SliderParam param) async {
    final response = await apiServices.get(
      endPoint: EndPoints.sliders,
      queryParameters: param.toJson(),
    );
    return SliderModel.fromJson(response.data);
  }

  @override
  Future<SliderDetailsModel> getSliderById(String id) async {
    final response = await apiServices.get(
      endPoint: "${EndPoints.sliders}/$id",
    );
    return SliderDetailsModel.fromJson(response.data);
  }

  @override
  Future<SliderDetailsModel> editSlider(SliderDetailsModel slider) async {
    final response = await apiServices.patch(
      endPoint: EndPoints.sliders,
      data: slider.toJson(),
    );
    return SliderDetailsModel.fromJson(response.data);
  }

  @override
  Future<SliderDetailsModel> createSlider(SliderDetailsModel slider) async {
    final response = await apiServices.post(
      endPoint: EndPoints.sliders,
      data: slider.toJson(),
    );
    return SliderDetailsModel.fromJson(response.data);
  }

  @override
  Future<Unit> deleteSlider(String id) async {
    await apiServices.delete(endPoint: "${EndPoints.sliders}/$id");
    return (unit);
  }
}
