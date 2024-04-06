part of 'bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class MovieFetchEvent extends MovieEvent {
  final String pageKey;
  final bool search;
  const MovieFetchEvent({required this.pageKey, this.search = false});

  @override
  List<Object> get props => [pageKey, search];
}

class MovieNextPageEvent extends MovieEvent {
  final int page;
  final String pageKey;
  final bool search;
  const MovieNextPageEvent(
      {this.page = 1, required this.pageKey, this.search = false});

  @override
  List<Object> get props => [page, pageKey, search];
}

class MovieDetailsFetchEvent extends MovieEvent {
  final int id;

  const MovieDetailsFetchEvent(this.id);

  @override
  List<Object> get props => [id];
}
