import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/city_details_model.dart';
import 'package:beit_alnakha_admin/features/locations/domain/repo/city_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class EditCityUseCase extends UseCase<CityDetailsModel, CityDetailsModel> {
  final CityRepo cityRepo;
  EditCityUseCase({required this.cityRepo});

  @override
  Future<Either<Failure, CityDetailsModel>> call(CityDetailsModel param) async {
    return await cityRepo.editCity(param);
  }
}
