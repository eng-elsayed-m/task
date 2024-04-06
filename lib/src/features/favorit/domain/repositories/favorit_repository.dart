part of '../domain.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<FavoriteModel>>> getFavorites();
  Future<Either<Failure, List<FavoriteModel>>> toggleFavorite(
      FavoriteModel param);
}
