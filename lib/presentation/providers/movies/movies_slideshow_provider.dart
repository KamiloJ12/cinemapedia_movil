import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia_movil/domain/entities/movie.dart';
import 'package:cinemapedia_movil/presentation/providers/movies/movies_provider.dart';

final moviesSlidesShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowPlayingMovies.isEmpty) return [];
  return nowPlayingMovies.sublist(0, 6);
});
