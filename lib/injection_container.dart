import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/datasource/movie_local_source.dart';
import 'package:flutter_clean_arhitecture/feature/movie/data/datasource/movie_remote_source.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerFactory(() => MovieRemoteSource(sl()));
  sl.registerFactory(() => MovieLocalSource());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
}
