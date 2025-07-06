import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = dotenv.env['API_KEY'] ?? '';
  final String _baseUrl = dotenv.env['BASE_URL'] ?? '';
  final String _language = dotenv.env['LANGUAGE'] ?? 'en-US';

  MoviesProvider() {
    print('MoviesProvider iniatilize');

    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/discover/movie', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);
    final discoverMovieResponse=DiscoverMovieResponse.fromJson(response.body);

    print(discoverMovieResponse.results[0].title);

  }
}
