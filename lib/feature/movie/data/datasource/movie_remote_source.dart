import 'dart:convert';

import 'package:flutter_clean_arhitecture/feature/constants.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/model/movie_model.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/model/movie_response_model.dart';
import 'package:flutter_clean_arhitecture/feature/movie/domain/entities/movie_response.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';

class MovieRemoteSource {
  final http.Client client;

  MovieRemoteSource(this.client);

  Future<MovieResponse> fetchMovies() async {
    final response = await client.get(
      Uri.parse("${Uri.parse(BASE_URL)}/3/trending/all/day?api_key=$API_KEY"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print("Remote movies are ${response.body}");
    if (response.statusCode == 200) {
      return MovieResponseModel.fromJson(jsonDecode(response.body));
      // return ((jsonDecode(response.body)) as List)
      //     .map((e) => MovieModel.fromJson(e));
    } else {
      throw ServerException();
    }
  }
}
