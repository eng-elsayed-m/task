import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/core/usecases/usecase.dart';
import 'package:task/src/features/favorit/data/data.dart';
import 'package:task/src/features/favorit/domain/domain.dart';
import 'package:equatable/equatable.dart';
//parts
part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoritesBloc extends Bloc<FavoritEvent, FavoriteState> {
  final GetFavoriteUC getFavoritesUC;
  final ToggleFavoritUC toggleFavorite;
  FavoritesBloc({required this.toggleFavorite, required this.getFavoritesUC})
      : super(FavoriteInitial()) {
    on<GetFavoritsEvent>(_getMovies);
    on<ToggleFavoritEvent>(_toggleFavorite);
  }
  List<FavoriteModel>? favorites;
  FutureOr<void> _getMovies(
      GetFavoritsEvent event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    final sections = await getFavoritesUC.call(NoParams());

    emit(sections.fold((failure) => FavoriteError(message: failure.toString()),
        (fav) {
      favorites = fav;
      return FavoriteLoaded(favorits: fav);
    }));
  }

  FutureOr<void> _toggleFavorite(
      ToggleFavoritEvent event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    final sections = await toggleFavorite.call(event.favorit);

    emit(sections.fold((failure) => FavoriteError(message: failure.toString()),
        (fav) {
      favorites = fav;
      return FavoriteLoaded(favorits: fav);
    }));
  }
}
