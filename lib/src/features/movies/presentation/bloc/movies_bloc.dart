part of 'bloc.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMoviesUC getMoviesUC;
  final GetDetailsUC getDetailsUC;
  MovieBloc({required this.getMoviesUC, required this.getDetailsUC})
      : super(MovieInitial()) {
    on<MovieFetchEvent>(_getMovies);
    on<MovieNextPageEvent>(_getMovieNextPage);

    on<MovieDetailsFetchEvent>(_getDetails);
  }
  NowPlayingEntity? movieList;
  FutureOr<void> _getMovies(
      MovieFetchEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    final sections = await getMoviesUC.call(
        MovieParam(page: 1, pageKey: event.pageKey, search: event.search));
    emit(sections.fold((failure) => MovieError(message: failure.toString()),
        (movies) {
      movieList = movies;
      return MovieLoaded(movieList: movieList!, page: movies.page!);
    }));
  }

  FutureOr<void> _getMovieNextPage(
      MovieNextPageEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    final sections = await getMoviesUC.call(MovieParam(
        page: event.page, pageKey: event.pageKey, search: event.search));

    emit(sections.fold((failure) => MovieError(message: failure.toString()),
        (movies) {
      final newMovies = movies;
      if (movieList != null) {
        newMovies.results!.addAll(movieList!.results!);
        movieList = newMovies;
      } else {
        movieList = newMovies;
      }
      // print(newMovies.results!.length.toString() + 'tttt');
      return MovieLoaded(movieList: movieList!, page: newMovies.page!);
    }));
  }

  FutureOr<void> _getDetails(
      MovieDetailsFetchEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    final sections = await getDetailsUC.call(event.id);

    emit(sections.fold((failure) => MovieError(message: failure.toString()),
        (movie) {
      return MovieDetailsLoaded(movie: movie);
    }));
  }
}
