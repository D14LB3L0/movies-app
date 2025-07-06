import 'dart:convert';

import 'package:movies/models/models.dart';

class SearchMoviesResponse {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  SearchMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchMoviesResponse.fromJson(String str) =>
      SearchMoviesResponse.fromMap(json.decode(str));

  factory SearchMoviesResponse.fromMap(Map<String, dynamic> json) =>
      SearchMoviesResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
