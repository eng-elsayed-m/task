part of '../domain.dart';

abstract class MovieRepository {
  Future<Either<Failure, NowPlayingEntity>> getMovies({MovieParam? param});
  Future<Either<Failure, ResultsEntity>> getMovieDetails(int param);
}
