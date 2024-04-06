part of 'movies_page.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<MovieBloc>()..add(MovieDetailsFetchEvent(movieId)),
        ),
        BlocProvider(
          create: (context) =>
              sl<FavoritesBloc>()..add(const GetFavoritsEvent()),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieDetailsLoaded) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: size.height * .7,
                    pinned: true,
                    backgroundColor: Colors.transparent,
                    elevation: 5,
                    actions: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.theme.scaffoldBackgroundColor
                              .withOpacity(.7),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () => context.read<FavoritesBloc>().add(
                              ToggleFavoritEvent(FavoriteModel(
                                  id: state.movie.id,
                                  posterPath: state.movie.posterPath,
                                  title: state.movie.title,
                                  voteAverage: state.movie.voteAverage))),
                          child: Padding(
                              padding: EdgeInsets.all(5.w),
                              child: AnimatedSwitch(
                                  child: context
                                                  .watch<FavoritesBloc>()
                                                  .favorites !=
                                              null &&
                                          context
                                              .watch<FavoritesBloc>()
                                              .favorites!
                                              .any((element) =>
                                                  element.id == state.movie.id)
                                      ? Icon(
                                          Icons.favorite,
                                          color: context
                                              .theme.colorScheme.secondary,
                                        )
                                      : Icon(
                                          Icons.favorite_border_outlined,
                                          color: context
                                              .theme.colorScheme.secondary,
                                        ))),
                        ),
                      )
                    ],
                    flexibleSpace: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(50.w, 12),
                            bottomRight: Radius.elliptical(50.w, 12)),
                      ),
                      child: EntranceFader(
                        child: Hero(
                          tag: movieId,
                          child: FadeInImage.assetNetwork(
                            placeholder: AppImages.moviePlaceHolder,
                            alignment: Alignment.center,
                            fadeInCurve: Curves.easeInOutSine,
                            image:
                                AppUrls.image + (state.movie.posterPath ?? ''),
                            width: double.infinity,
                            fit: BoxFit.cover,
                            imageErrorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error_outline_outlined),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    sliver: SliverList.list(children: [
                      18.h.ph,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              state.movie.title!,
                              maxLines: 2,
                              style: context.textTheme.headlineMedium!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.w),
                            child: Text(
                              '⭐️ ${(state.movie.voteAverage ?? 0).toStringAsFixed(1)}${state.movie.voteCount}',
                              style: context.textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      12.h.ph,
                      Wrap(
                        spacing: 8.w,
                        children: [
                          ...state.movie.genres!
                              .map((e) => Chip(label: Text(e.name!)))
                              .toList()
                        ],
                      ),
                      18.h.ph,
                      Text(
                        'Overview',
                        style: context.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      12.h.ph,
                      Text(
                        state.movie.overview!,
                        style: context.textTheme.titleMedium,
                      ),
                    ]),
                  ),
                  const SliverFillRemaining()
                ],
              );
            } else if (state is MovieError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const MovieDetailShimmer();
            }
          },
        ),
      ),
    );
  }
}
