import 'package:beit_alnakha_admin/core/errors/failures.dart';
import 'package:beit_alnakha_admin/core/use_case/use_case.dart';
import 'package:beit_alnakha_admin/features/locations/domain/repo/city_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RemoveCityUseCase extends UseCase<Unit, String> {
  final CityRepo cityRepo;
  RemoveCityUseCase({required this.cityRepo});

  @override
  Future<Either<Failure, Unit>> call(String param) async {
    return await cityRepo.deleteCity(param);
  }
}
