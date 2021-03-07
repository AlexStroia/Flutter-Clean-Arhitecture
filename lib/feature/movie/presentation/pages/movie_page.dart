import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arhitecture/feature/movie/presentation/bloc/bloc.dart';
import 'package:flutter_clean_arhitecture/feature/movie/presentation/bloc/movies_bloc.dart';
import 'package:flutter_clean_arhitecture/feature/movie/presentation/widgets/empty_widget.dart';
import 'package:flutter_clean_arhitecture/feature/movie/presentation/widgets/loading_widget.dart';
import 'package:flutter_clean_arhitecture/feature/movie/presentation/widgets/movie_widget.dart';

import '../../../../injection_container.dart';

class MoviePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoviePage();
  }
}

class _MoviePage extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Clean Architecture"),
        ),
        body: buildBody(context));
  }

  BlocProvider<MoviesBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MoviesBloc>(),
      child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return LoadingWidget();
                  } else if (state is LoadedState) {
                    return MovieWidget(state.movies, (id) => {});
                  } else if (state is EmptyState) {
                    fetchMovies();
                    return EmptyWidget();
                  }
                  return EmptyWidget();
                },
              ),
              SizedBox(
                height: 10,
              )
            ]),
          )),
    );
  }

  void fetchMovies() {
    BlocProvider.of<MoviesBloc>(context).add(GetMoviesEvent());
  }
}
