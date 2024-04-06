part of '../domain.dart';

class GetFavoriteUC extends UseCase<List<FavoriteModel>, NoParams> {
  final FavoriteRepository repository;
  GetFavoriteUC(this.repository);
  @override
  Future<Either<Failure, List<FavoriteModel>>> call(NoParams params) async {
    return await repository.getFavorites();
  }
}
