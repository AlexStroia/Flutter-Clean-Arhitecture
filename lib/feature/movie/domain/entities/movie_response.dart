import 'package:equatable/equatable.dart';
import 'package:flutter_clean_arhitecture/feature/movie/domain/entities/movie.dart';

class MovieResponse extends Equatable {

  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MovieResponse(this.page,this.results,this.totalPages,this.totalResults);

  @override
  List<Object> get props => [this.results,this.page,this.totalResults,this.totalPages];

}