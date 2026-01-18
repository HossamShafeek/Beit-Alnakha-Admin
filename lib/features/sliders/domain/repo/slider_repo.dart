import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/features/sliders/data/models/slider_details_model.dart';
import 'package:beit_alnakha_admin/features/sliders/data/models/slider_model.dart';
import 'package:beit_alnakha_admin/features/sliders/param/slider_param.dart';
import 'package:dartz/dartz.dart';

abstract class SliderRepo {
  Future<Either<Failure, SliderModel>> getSliders(SliderParam param);
  Future<Either<Failure, SliderDetailsModel>> getSliderById(String id);
  Future<Either<Failure, SliderDetailsModel>> editSlider(
    SliderDetailsModel slider,
  );
  Future<Either<Failure, SliderDetailsModel>> createSlider(
    SliderDetailsModel slider,
  );
  Future<Either<Failure, Unit>> deleteSlider(String id);
}
