import 'package:flutter_clean_arhitecture/core/error/exceptions.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/model/movie_model.dart';
import 'package:flutter_clean_arhitecture/feature/movie/domain/entities/movie.dart';

class MovieLocalSource {
  List<MovieModel> movies = List<Movie>.empty();

  void cacheMovie(List<MovieModel> movies) {
    movies.addAll(movies);
  }

  Future<List<MovieModel>> loadCachedMovies() {
    if (movies.isNotEmpty) {
      return Future.value(movies);
    } else {
      throw CacheException();
    }
  }
}
