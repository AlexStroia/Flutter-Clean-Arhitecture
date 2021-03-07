import 'package:flutter_clean_arhitecture/feature/movie/domain/entities/movie.dart';
import 'package:meta/meta.dart';

class MovieModel extends Movie {
  MovieModel(
      {@required int voteCount,
      @required String originalLanguage,
      @required String originalTitle,
      @required String posterPath,
      @required String title,
      @required bool video,
      @required double voteAverage,
      @required int id,
      @required String overview,
      @required double popularity,
      @required String mediaType})
      : super(voteCount, originalLanguage, originalTitle, posterPath, title,
            video, voteAverage, id, overview, popularity, mediaType);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(voteCount : json['vote_count'],
    originalLanguage :json['original_language'],
    originalTitle : json['original_title'],
    posterPath : json['poster_path'],
    title : json['title'],
    video : json['video'],
    voteAverage : json['vote_average'],
    id : json['id'],
    overview : json['overview'],
    popularity : json['popularity'],
    mediaType : json['media_type']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vote_count'] = this.voteCount;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['id'] = this.id;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
