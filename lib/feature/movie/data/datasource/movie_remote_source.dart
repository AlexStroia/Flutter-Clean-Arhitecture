import 'dart:convert';

import 'package:flutter_clean_arhitecture/feature/constants.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/model/movie_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';

class MovieRemoteSource {
  final http.Client client;

  MovieRemoteSource(this.client);

  Future<List<MovieModel>> fetchMovies() async {
    final response = await client.get(
      Uri.parse("${Uri.parse(BASE_URL)}/3/trending/all/day?api_key=$API_KEY}"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return ((jsonDecode(response.body)) as List)
          .map((e) => MovieModel.fromJson(e));
    } else {
      throw ServerException();
    }
  }
}
