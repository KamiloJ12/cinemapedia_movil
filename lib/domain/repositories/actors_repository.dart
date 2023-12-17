import 'package:cinemapedia_movil/domain/entities/actor.dart';


abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie( String movieId );
}