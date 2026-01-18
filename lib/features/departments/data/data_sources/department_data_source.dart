import 'package:beit_alnakha_admin/core/api/api_services.dart';
import 'package:beit_alnakha_admin/core/api/end_points.dart';
import 'package:beit_alnakha_admin/features/departments/data/models/deparment_details_model.dart';
import 'package:beit_alnakha_admin/features/departments/data/models/department_model.dart';
import 'package:beit_alnakha_admin/features/departments/param/department_filter_param_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class DepartmentDataSource {
  Future<DepartmentModel> getDepartments(DepartmentFilterParamModel params);
  Future<DepartmentDetailsModel> getDepartmentsById(String id);
  Future<DepartmentDetailsModel> editDepartment(DepartmentDetailsModel params);
  Future<Unit> deleteDepartment(String id);
}

@LazySingleton(as: DepartmentDataSource)
class DepartmentDataSourceImpl implements DepartmentDataSource {
  final ApiServices apiServices;
  DepartmentDataSourceImpl({required this.apiServices});
  @override
  Future<DepartmentModel> getDepartments(
    DepartmentFilterParamModel params,
  ) async {
    final Response response = await apiServices.get(
      endPoint: EndPoints.getDepartments,
      queryParameters: params.toJson(),
    );
    return DepartmentModel.fromJson(response.data);
  }

  @override
  Future<DepartmentDetailsModel> getDepartmentsById(String id) async {
    final Response response = await apiServices.get(
      endPoint: "${EndPoints.getDepartments}/$id",
    );
    return DepartmentDetailsModel.fromJson(response.data);
  }

  @override
  Future<DepartmentDetailsModel> editDepartment(
    DepartmentDetailsModel params,
  ) async {
    final Response response = await apiServices.patch(
      endPoint: EndPoints.getDepartments,
      data: params.toJson(),
    );
    return DepartmentDetailsModel.fromJson(response.data);
  }

  @override
  Future<Unit> deleteDepartment(String id) async {
    await apiServices.delete(endPoint: "${EndPoints.getDepartments}/$id");
    return unit;
  }
}
