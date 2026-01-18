import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/sliders/domain/repo/slider_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RemoveSliderUseCase extends UseCase<Unit, String> {
  final SliderRepo sliderRepo;
  RemoveSliderUseCase({required this.sliderRepo});

  @override
  Future<Either<Failure, Unit>> call(String param) async {
    return await sliderRepo.deleteSlider(param);
  }
}
