class RegionParam {
  final int? page;
  final int? limit;
  final String? search;

  RegionParam({this.page, this.limit, this.search});

  Map<String, dynamic> toJson() => {
    if (page != null) 'page': page,
    if (limit != null) 'limit': limit,
    if (search != null && search!.isNotEmpty) 'search': search,
  };
}
