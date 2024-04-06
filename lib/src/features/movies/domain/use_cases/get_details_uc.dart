part of '../domain.dart';

class GetDetailsUC extends UseCase<ResultsEntity, int> {
  final MovieRepository repository;
  GetDetailsUC(this.repository);
  @override
  Future<Either<Failure, ResultsEntity>> call(int params) async {
    return await repository.getMovieDetails(params);
  }
}
