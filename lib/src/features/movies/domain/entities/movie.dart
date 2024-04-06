import 'package:equatable/equatable.dart';

class NowPlayingEntity extends Equatable {
  final int? page;
  final List<ResultsEntity>? results;
  final int? totalPages;
  final int? totalResults;

  const NowPlayingEntity(
      {this.page, this.results, this.totalPages, this.totalResults});

  @override
  List<Object?> get props {
    return [
      page,
      results,
      totalPages,
      totalResults,
    ];
  }
}

class ResultsEntity extends Equatable {
  final String? backdropPath;
  final int? id;
  final String? posterPath;
  final String? title;
  final double? voteAverage;
  final int? voteCount;
  final List<GenresEntity>? genres;
  final String? overview;
  const ResultsEntity(
      {this.backdropPath,
      this.id,
      this.posterPath,
      this.title,
      this.voteAverage,
      this.genres,
      this.overview,
      this.voteCount});

  @override
  List<Object?> get props {
    return [
      backdropPath,
      id,
      posterPath,
      title,
      voteAverage,
      voteCount,
      overview,
      genres
    ];
  }
}

class GenresEntity extends Equatable {
  final int? id;
  final String? name;

  const GenresEntity({this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}
