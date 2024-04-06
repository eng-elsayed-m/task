part of '../data.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MoviesRemoteSrc remoteSrc;

  MovieRepositoryImpl(this.remoteSrc);
  @override
  Future<Either<Failure, NowPlayingModel>> getMovies(
      {MovieParam? param}) async {
    try {
      final section = await remoteSrc.fetchMovies(param!);
      return Right(section);
    } on ServerException catch (ex) {
      return Left(ServerFailure(ex.message));
    } on OfflineException {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, ResultsEntity>> getMovieDetails(int param) async {
    try {
      final section = await remoteSrc.fetchMovieDatils(param);
      return Right(section);
    } on ServerException catch (ex) {
      return Left(ServerFailure(ex.message));
    } on OfflineException {
      return Left(OfflineFailure());
    }
  }
}
