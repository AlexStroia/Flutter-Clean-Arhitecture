import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/model/movie_model.dart';
import 'package:flutter_clean_arhitecture/feature/movie/domain/entities/movie.dart';
import 'package:flutter_clean_arhitecture/feature/movie/domain/entities/movie_response.dart';
import 'package:meta/meta.dart';

class MovieResponseModel extends MovieResponse {
  MovieResponseModel(
      {@required int page,
      @required List<Movie> results,
      @required int totalPages,
      @required int totalResults})
      : super(page, results, totalPages, totalResults);

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) {
    var results = new List<MovieModel>();
    print("JSon is ${json['results']}");
   json['results'].forEach((v) => results.add(MovieModel.fromJson(v)));
    return MovieResponseModel(
        page: json['page'],
        results: results,
        totalPages: json['total_pages'],
        totalResults: json['total_results']);
  }
}
