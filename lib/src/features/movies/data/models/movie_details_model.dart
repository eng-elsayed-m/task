part of '../data.dart';

class MovieDetailsModel extends ResultsEntity {
  const MovieDetailsModel({
    super.overview,
    super.voteCount,
    super.genres,
    super.backdropPath,
    super.id,
    super.posterPath,
    super.title,
    super.voteAverage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backdrop_path': backdropPath,
      'genres': genres!.map((x) => (x as GenresModel).toMap()).toList(),
      'id': id,
      'overview': overview,
      'poster_path': posterPath,
      'title': title,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory MovieDetailsModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailsModel(
      backdropPath:
          map['backdrop_path'] != null ? map['backdrop_path'] as String : null,
      genres: map['genres'] != null
          ? List<GenresEntity>.from(
              (map['genres'] as List).map<GenresModel?>(
                (x) => GenresModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      id: map['id'] != null ? map['id'] as int : null,
      overview: map['overview'] != null ? map['overview'] as String : null,
      posterPath:
          map['poster_path'] != null ? map['poster_path'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      voteAverage:
          map['vote_average'] != null ? map['vote_average'] as double : null,
      voteCount: map['vote_count'] != null ? map['vote_count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailsModel.fromJson(String source) =>
      MovieDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class GenresModel extends GenresEntity {
  const GenresModel({super.id, super.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory GenresModel.fromMap(Map<String, dynamic> map) {
    return GenresModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenresModel.fromJson(String source) =>
      GenresModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
