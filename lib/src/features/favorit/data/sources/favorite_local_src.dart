part of '../data.dart';

abstract class FavoritLocalSrc {
  Future<List<FavoriteModel>> fetchFavorits();
  Future<List<FavoriteModel>> toggleFavorit(FavoriteModel id);
}

class FavoriteLocalSrcImpl implements FavoritLocalSrc {
  final Database db;
  FavoriteLocalSrcImpl(this.db);
  @override
  Future<List<FavoriteModel>> fetchFavorits() async {
    final List<Map<String, dynamic>> maps = await db.query('favorites');
    return List.generate(maps.length, (i) {
      return FavoriteModel(
        id: maps[i]['id'],
        title: maps[i]['title'],
        posterPath: maps[i]['poster_path'],
        voteAverage: maps[i]['vote_average'],
      );
    });
  }

  @override
  Future<List<FavoriteModel>> toggleFavorit(FavoriteModel movie) async {
    final List<Map<String, dynamic>> result = await db.query(
      'favorites',
      where: 'id = ?',
      whereArgs: [movie.id],
    );

    if (result.isNotEmpty) {
      await db.delete(
        'favorites',
        where: 'id = ?',
        whereArgs: [movie.id],
      ).catchError((error) => throw error);
    } else {
      await db
          .insert(
            'favorites',
            movie.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          )
          .catchError((error) => throw error);
    }
    final List<Map<String, dynamic>> maps =
        await db.query('favorites').catchError((error) => throw error);
    return maps
        .map((e) => FavoriteModel(
              id: e['id'],
              title: e['title'],
              posterPath: e['poster_path'],
              voteAverage: e['vote_average'],
            ))
        .toList();
  }
}
