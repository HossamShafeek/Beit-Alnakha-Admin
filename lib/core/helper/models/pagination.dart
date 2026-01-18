class PaginationModel {
  final PaginationResultModel paginationResult;
  final int results;

  PaginationModel({required this.paginationResult, required this.results});

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      paginationResult: PaginationResultModel.fromJson(
        json["paginationResult"] ?? json['pagination'] ?? {},
      ),
      results: json["results"] ?? 0,
    );
  }
}

class PaginationResultModel {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  PaginationResultModel({this.currentPage, this.numberOfPages, this.limit});

  factory PaginationResultModel.fromJson(Map<String, dynamic> json) {
    return PaginationResultModel(
      currentPage: json["currentPage"] ?? 0,
      numberOfPages: json["numberOfPages"] ?? 0,
      limit: json["limit"] ?? 0,
    );
  }
}
