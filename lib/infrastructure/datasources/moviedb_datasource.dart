import 'package:cinemapedia_movil/config/constants/environment.dart';
import 'package:cinemapedia_movil/domain/entities/video.dart';
import 'package:cinemapedia_movil/infrastructure/mappers/movie_mapper.dart';
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

  @override
  Future<Movie> getMovieById(String id) {
    // TODO: implement getMovieById
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    // TODO: implement getPopular
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId) {
    // TODO: implement getSimilarMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    // TODO: implement getTopRated
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    // TODO: implement getUpcoming
    throw UnimplementedError();
  }

  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) {
    // TODO: implement getYoutubeVideosById
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
}
