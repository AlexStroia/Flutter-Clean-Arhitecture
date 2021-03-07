import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_arhitecture/feature/movie/domain/entities/movie.dart';

@immutable
abstract class MoviesState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class EmptyState extends MoviesState {}

class LoadingState extends MoviesState {}

class LoadedState extends MoviesState {
  final List<Movie> movies;

  LoadedState(this.movies);
}

class Error extends MoviesState {
  final String errorMessage;

  Error(this.errorMessage);
}