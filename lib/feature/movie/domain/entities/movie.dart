import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int voteCount;
  final String originalLanguage;
  final String originalTitle;
  final String posterPath;
  final String title;
  final bool video;
  final double voteAverage;
  final int id;
  final String overview;
  final double popularity;
  final String mediaType;

  Movie(
      this.voteCount,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.title,
      this.video,
      this.voteAverage,
      this.id,
      this.overview,
      this.popularity,
      this.mediaType);

  @override
  List<Object> get props => [
        this.voteCount,
        this.originalLanguage,
        this.originalTitle,
        this.posterPath,
        this.title,
        this.video,
        this.voteAverage,
        this.id,
        this.overview,
        this.popularity,
        this.mediaType
      ];
}
