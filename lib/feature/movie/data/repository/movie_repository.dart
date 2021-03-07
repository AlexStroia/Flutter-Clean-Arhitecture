import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arhitecture/core/error/exceptions.dart';
import 'package:flutter_clean_arhitecture/core/error/failures.dart';
import 'package:flutter_clean_arhitecture/core/network/network_info.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/datasource/movie_local_source.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/datasource/movie_remote_source.dart';
import 'package:flutter_clean_arhitecture/feature/movie/domain/entities/movie.dart';

class MovieRepository {
  final MovieRemoteSource remoteSource;
  final MovieLocalSource localSource;
  final NetworkInfo networkInfo;

  MovieRepository(this.remoteSource, this.localSource, this.networkInfo);

  Future<Either<Failure, List<Movie>>> fetchMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMovies = await remoteSource.fetchMovies();
        localSource.cacheMovie(remoteMovies);
        return Right(remoteMovies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cachedMovies = await localSource.loadCachedMovies();
        return Right(cachedMovies);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
