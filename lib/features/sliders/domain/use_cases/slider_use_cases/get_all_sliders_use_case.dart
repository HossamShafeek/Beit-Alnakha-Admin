import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/sliders/data/models/slider_model.dart';
import 'package:beit_alnakha_admin/features/sliders/domain/repo/slider_repo.dart';
import 'package:beit_alnakha_admin/features/sliders/param/slider_param.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetAllSlidersUseCase extends UseCase<SliderModel, SliderParam> {
  final SliderRepo sliderRepo;
  GetAllSlidersUseCase({required this.sliderRepo});

  @override
  Future<Either<Failure, SliderModel>> call(SliderParam param) async {
    return await sliderRepo.getSliders(param);
  }
}
