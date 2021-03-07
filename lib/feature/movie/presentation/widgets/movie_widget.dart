import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arhitecture/feature/movie/domain/entities/movie.dart';

class MovieWidget extends StatelessWidget {
  final Function(int id) onMovieClick;

  final List<Movie> movies;

  MovieWidget(this.movies, this.onMovieClick);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (2 / 1),
            children: movies
                .map((data) => GestureDetector(
                    onTap: () {
                      onMovieClick(data.id);
                    },
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Center(
                          child: Wrap(
                            children: [
                              Container(
                                  child: Image.network(
                                "https://image.tmdb.org/${data.posterPath}",
                                height: 10,
                                width: 10,
                              )),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text(data.title ?? "No title")),
                            ],
                          ),
                        ))))
                .toList()));
  }
}
