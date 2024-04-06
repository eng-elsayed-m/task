part of '../data.dart';

class FavoriteModel extends ResultsEntity {
  const FavoriteModel(
      {super.id, super.posterPath, super.title, super.voteAverage});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': this.id,
      'poster_path': posterPath,
      'title': title,
      'vote_average': voteAverage,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'] != null ? map['id'] as int : null,
      posterPath:
          map['poster_path'] != null ? map['poster_path'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      voteAverage:
          map['vote_average'] != null ? map['vote_average'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromJson(String source) =>
      FavoriteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
