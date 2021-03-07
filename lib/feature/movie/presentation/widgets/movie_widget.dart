import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arhitecture/feature/movie/domain/entities/movie.dart';

class MovieWidget extends StatelessWidget {
  final Function(int id) onMovieClick;

  final List<Movie> movies;

  MovieWidget(this.movies, this.onMovieClick);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (2 / 1),
        children: movies
            .map((data) =>
            GestureDetector(
                onTap: () {
                  onMovieClick(data.id);
                },
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Center(
                      child: Wrap(
                        children: [
                          Image.network(
                            "https://image.tmdb.org/${data.posterPath}",
                            height: 54,
                            width: 54,
                          ),
                          Text(data.title),
                          Text(data.overview)
                        ],
                      ),
                    ))))
            .toList());
  }
}
