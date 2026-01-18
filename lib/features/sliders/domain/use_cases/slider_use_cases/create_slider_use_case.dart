import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/sliders/data/models/slider_details_model.dart';
import 'package:beit_alnakha_admin/features/sliders/domain/repo/slider_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CreateSliderUseCase
    extends UseCase<SliderDetailsModel, SliderDetailsModel> {
  final SliderRepo sliderRepo;
  CreateSliderUseCase({required this.sliderRepo});

  @override
  Future<Either<Failure, SliderDetailsModel>> call(
    SliderDetailsModel param,
  ) async {
    return await sliderRepo.createSlider(param);
  }
}
