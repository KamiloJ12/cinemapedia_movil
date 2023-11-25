import 'package:cinemapedia_movil/config/constants/environment.dart';
import 'package:cinemapedia_movil/infrastructure/mappers/movie_mappers.dart';
import 'package:cinemapedia_movil/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

import 'package:cinemapedia_movil/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_movil/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
      .where((moviedb) => moviedb.posterPath != 'no-poster')
      .map(
        (moviedb) => MovieMapper.movieDBToEntity(moviedb)
      ).toList();
    return movies;
  }
}
