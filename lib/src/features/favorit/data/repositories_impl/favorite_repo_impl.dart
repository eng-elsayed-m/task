part of '../data.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoritLocalSrc remoteSrc;

  FavoriteRepositoryImpl(this.remoteSrc);
  @override
  Future<Either<Failure, List<FavoriteModel>>> getFavorites() async {
    try {
      final section = await remoteSrc.fetchFavorits();
      return Right(section);
    } on ServerException catch (ex) {
      return Left(ServerFailure(ex.message));
    } on OfflineException {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<FavoriteModel>>> toggleFavorite(
      FavoriteModel param) async {
    try {
      final section = await remoteSrc.toggleFavorit(param);
      return Right(section);
    } on ServerException catch (ex) {
      return Left(ServerFailure(ex.message));
    } on OfflineException {
      return Left(OfflineFailure());
    }
  }
}
