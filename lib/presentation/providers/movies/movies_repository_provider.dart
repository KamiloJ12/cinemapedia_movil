import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia_movil/infrastructure/datasource/moviedb_datasource.dart';
import 'package:cinemapedia_movil/infrastructure/repositories/movies_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {
  return MoviesRepositoryImpl(MoviedbDatasource());
});
