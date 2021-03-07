import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arhitecture/core/error/failures.dart';
import 'package:flutter_clean_arhitecture/core/usecases/usecase.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/repository/movie_repository.dart';
import 'package:flutter_clean_arhitecture/feature/movie/domain/entities/movie.dart';

class FetchMoviesUseCase extends UseCase<List<Movie>, NoParams> {
  final MovieRepository repository;

  FetchMoviesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await repository.fetchMovies();
  }
}
