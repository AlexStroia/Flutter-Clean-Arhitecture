import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/datasource/movie_local_source.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/datasource/movie_remote_source.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/repository/movie_repository.dart';
import 'package:flutter_clean_arhitecture/feature/movie/domain/usecase/fetch_movies.dart';
import 'package:flutter_clean_arhitecture/feature/movie/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => MoviesBloc(sl()),
  );
  sl.registerFactory<FetchMoviesUseCase>(() => FetchMoviesUseCase(sl()));
  sl.registerFactory<MovieRemoteSource>(() => MovieRemoteSource(sl()));
  sl.registerFactory<MovieLocalSource>(() => MovieLocalSource());
  sl.registerLazySingleton<MovieRepository>(() => MovieRepository(sl(), sl(), sl()));

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
}
