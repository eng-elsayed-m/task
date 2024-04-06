part of '../movies_page.dart';

class MovieCard extends StatelessWidget {
  final ResultsEntity movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    List<FavoriteModel>? favList = context.watch<FavoritesBloc>().favorites;
    return GestureDetector(
      onTap: () {
        NV.nextScreen(
            context,
            MovieDetailsScreen(
              movieId: movie.id!,
            ));
      },
      child: Material(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Hero(
                  tag: movie.id!,
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                    child: FadeInImage.assetNetwork(
                      placeholder: AppImages.moviePlaceHolder,
                      placeholderFit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error_outline_rounded),
                      image: AppUrls.image + (movie.posterPath ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: EntranceFader(
                    offset: const Offset(0, 10),
                    child: Material(
                      color:
                          context.theme.scaffoldBackgroundColor.withOpacity(.7),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 3),
                        child: Text(
                          movie.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleMedium!,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.theme.scaffoldBackgroundColor
                              .withOpacity(.7),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.w),
                          child: Text(
                            (movie.voteAverage ?? 0).toStringAsFixed(1),
                            style: context.textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.theme.scaffoldBackgroundColor
                              .withOpacity(.7),
                        ),
                        child: InkWell(
                          onTap: () => context.read<FavoritesBloc>().add(
                              ToggleFavoritEvent(FavoriteModel(
                                  id: movie.id,
                                  posterPath: movie.posterPath,
                                  title: movie.title,
                                  voteAverage: movie.voteAverage))),
                          child: Padding(
                              padding: EdgeInsets.all(5.w),
                              child: AnimatedSwitch(
                                  child: favList != null &&
                                          favList.any((element) =>
                                              element.id == movie.id)
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
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
