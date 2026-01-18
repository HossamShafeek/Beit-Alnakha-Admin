import 'package:beit_alnakha_admin/core/helper/models/pagination.dart';
import 'package:beit_alnakha_admin/features/departments/data/models/deparment_details_model.dart';

class DepartmentModel {
  final List<DepartmentDetailsModel> departments;
  final PaginationModel? pagination;
  DepartmentModel({this.departments = const [], this.pagination});
  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      departments: List<DepartmentDetailsModel>.from(
        (json['departments'] as List).map(
          (x) => DepartmentDetailsModel.fromJson(x),
        ),
      ),
      pagination: json['pagination'] != null
          ? PaginationModel.fromJson(json['pagination'])
          : null,
    );
  }
}
