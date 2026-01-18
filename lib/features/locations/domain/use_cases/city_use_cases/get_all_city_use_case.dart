import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/locations/data/models/city_model.dart';
import 'package:beit_alnakha_admin/features/locations/domain/repo/city_repo.dart';
import 'package:beit_alnakha_admin/features/locations/param/city_param.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetAllCityUseCase extends UseCase<CityModel, CityParam> {
  final CityRepo cityRepo;
  GetAllCityUseCase({required this.cityRepo});

  @override
  Future<Either<Failure, CityModel>> call(CityParam param) async {
    return await cityRepo.getCity(param);
  }
}
