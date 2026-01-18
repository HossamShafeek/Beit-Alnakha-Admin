class DepartmentFilterParamModel {
  final String? searchKeyWord;
  final int? page;
  final int? limit;
  final bool? isActive;
  final bool? isDescending;

  DepartmentFilterParamModel({
    this.searchKeyWord,
    this.page,
    this.limit,
    this.isActive,
    this.isDescending,
  });
  Map<String, dynamic> toJson() {
    return {
      if (searchKeyWord != null && (searchKeyWord?.isNotEmpty ?? true))
        'search': searchKeyWord,
      if (page != null) 'page': page,
      if (limit != null) 'limit': limit,
      if (isActive != null) 'filter': isActive,
      if (isDescending != null)
        'sort': (isDescending ?? true) ? "createdAt" : "-createdAt",
    };
  }
}
