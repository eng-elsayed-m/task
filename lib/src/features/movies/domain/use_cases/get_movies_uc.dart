part of '../domain.dart';

class GetMoviesUC extends UseCase<NowPlayingEntity, MovieParam> {
  final MovieRepository repository;
  GetMoviesUC(this.repository);
  @override
  Future<Either<Failure, NowPlayingEntity>> call(MovieParam params) async {
    return await repository.getMovies(param: params);
  }
}
