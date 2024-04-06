part of '../data.dart';

class NowPlayingModel extends NowPlayingEntity {
  const NowPlayingModel(
      {super.page, super.results, super.totalPages, super.totalResults});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'results': results?.map((x) => (x as MovieModel).toMap()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory NowPlayingModel.fromMap(Map<String, dynamic> map) {
    return NowPlayingModel(
      page: map['page'] != null ? map['page'] as int : null,
      results: map['results'] != null
          ? List<ResultsEntity>.from(
              (map['results'] as List).map<MovieModel?>(
                (x) => MovieModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      totalPages: map['total_pages'] != null ? map['total_pages'] as int : null,
      totalResults:
          map['total_results'] != null ? map['total_results'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NowPlayingModel.fromJson(String source) =>
      NowPlayingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MovieModel extends ResultsEntity {
  const MovieModel(
      {super.backdropPath,
      super.id,
      super.posterPath,
      super.title,
      super.voteAverage});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backdrop_path': backdropPath,
      'id': this.id,
      'poster_path': posterPath,
      'title': title,
      'vote_average': voteAverage,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      backdropPath:
          map['backdrop_path'] != null ? map['backdrop_path'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      posterPath:
          map['poster_path'] != null ? map['poster_path'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      voteAverage:
          map['vote_average'] != null ? map['vote_average'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
