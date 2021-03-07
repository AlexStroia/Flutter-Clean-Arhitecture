import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arhitecture/core/usecases/usecase.dart';
import 'package:flutter_clean_arhitecture/feature/movie/domain/usecase/fetch_movies.dart';
import 'package:flutter_clean_arhitecture/feature/movie/presentation/bloc/bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final FetchMoviesUseCase useCase;

  MoviesBloc(this.useCase)
      : super(EmptyState());

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    if (event is GetMoviesEvent) {
      yield LoadingState();
      final response = await useCase(NoParams());
      yield response.fold((failure) => Error("An error has occured"), (
          movies) => LoadedState(movies));
    }
  }
}
