part of '../domain.dart';

class MovieParam extends Equatable {
  final int page;
  final String pageKey;
  final bool search;

  const MovieParam(
      {required this.page, required this.pageKey, this.search = false});

  @override
  List<Object> get props => [page, pageKey];
}
