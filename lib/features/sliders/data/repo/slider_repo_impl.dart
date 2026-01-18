import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/features/sliders/data/data_sources/slider_data_source.dart';
import 'package:beit_alnakha_admin/features/sliders/data/models/slider_details_model.dart';
import 'package:beit_alnakha_admin/features/sliders/data/models/slider_model.dart';
import 'package:beit_alnakha_admin/features/sliders/domain/repo/slider_repo.dart';
import 'package:beit_alnakha_admin/features/sliders/param/slider_param.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SliderRepo)
class SliderRepoImpl implements SliderRepo {
  final SliderDataSource sliderDataSource;
  SliderRepoImpl({required this.sliderDataSource});

  @override
  Future<Either<Failure, SliderModel>> getSliders(SliderParam param) async {
    try {
      final response = await sliderDataSource.getSliders(param);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SliderDetailsModel>> getSliderById(String id) async {
    try {
      final response = await sliderDataSource.getSliderById(id);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SliderDetailsModel>> editSlider(
    SliderDetailsModel slider,
  ) async {
    try {
      final response = await sliderDataSource.editSlider(slider);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SliderDetailsModel>> createSlider(
    SliderDetailsModel slider,
  ) async {
    try {
      final response = await sliderDataSource.createSlider(slider);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteSlider(String id) async {
    try {
      await sliderDataSource.deleteSlider(id);
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
