import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class MoviesEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetMoviesEvent extends MoviesEvent {
}