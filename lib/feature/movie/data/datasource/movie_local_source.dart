import 'dart:convert';

import 'package:flutter_clean_arhitecture/core/error/exceptions.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/model/movie_model.dart';

class MovieLocalSource {
  List<MovieModel> movies = List<MovieModel>.empty();

  void cacheMovie(List<MovieModel> remoteMovies) {
    movies = List<MovieModel>.from(remoteMovies);
  }

  Future<List<MovieModel>> loadCachedMovies() {
    if (movies.isNotEmpty) {
      return Future.value(movies);
    } else {
      throw CacheException();
    }
  }
}
