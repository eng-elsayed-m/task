part of '../domain.dart';

class ToggleFavoritUC extends UseCase<List<FavoriteModel>, FavoriteModel> {
  final FavoriteRepository repository;
  ToggleFavoritUC(this.repository);
  @override
  Future<Either<Failure, List<FavoriteModel>>> call(
      FavoriteModel params) async {
    return await repository.toggleFavorite(params);
  }
}
