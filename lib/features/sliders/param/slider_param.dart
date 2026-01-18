class SliderParam {
  final int? page;
  final int? limit;
  final String? search;

  SliderParam({this.page, this.limit, this.search});

  Map<String, dynamic> toJson() => {
    'page': page,
    'limit': limit,
    'search': search,
  };
}
