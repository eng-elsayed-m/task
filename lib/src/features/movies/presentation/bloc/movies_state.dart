part of 'bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieDetailsLoaded extends MovieState {
  final ResultsEntity movie;

  const MovieDetailsLoaded({required this.movie});

  @override
  List<Object> get props => [movie];
}

class MovieLoaded extends MovieState {
  final int page;
  final NowPlayingEntity movieList;

  const MovieLoaded({required this.movieList, this.page = 1});

  @override
  List<Object> get props => [movieList, page];
}

class MovieError extends MovieState {
  final String message;

  const MovieError({required this.message});

  @override
  List<Object> get props => [message];
}
