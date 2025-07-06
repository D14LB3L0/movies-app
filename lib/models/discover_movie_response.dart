import 'dart:convert';

import 'models.dart';


class DiscoverMovieResponse {
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    DiscoverMovieResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory DiscoverMovieResponse.fromJson(String str) => DiscoverMovieResponse.fromMap(json.decode(str));

    factory DiscoverMovieResponse.fromMap(Map<String, dynamic> json) => DiscoverMovieResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

}



