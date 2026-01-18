import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/sliders/data/models/slider_details_model.dart';
import 'package:beit_alnakha_admin/features/sliders/domain/repo/slider_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetSliderByIdUseCase extends UseCase<SliderDetailsModel, String> {
  final SliderRepo sliderRepo;
  GetSliderByIdUseCase({required this.sliderRepo});

  @override
  Future<Either<Failure, SliderDetailsModel>> call(String param) async {
    return await sliderRepo.getSliderById(param);
  }
}
