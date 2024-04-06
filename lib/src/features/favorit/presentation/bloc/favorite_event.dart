part of 'favorite_bloc.dart';

abstract class FavoritEvent extends Equatable {
  const FavoritEvent();
  @override
  List<Object> get props => [];
}

class GetFavoritsEvent extends FavoritEvent {
  const GetFavoritsEvent();
  @override
  List<Object> get props => [];
}

class ToggleFavoritEvent extends FavoritEvent {
  final FavoriteModel favorit;
  const ToggleFavoritEvent(this.favorit);

  @override
  List<Object> get props => [favorit];
}
