part of 'favorites_view.dart';

class FavoritesListWidget extends StatelessWidget {
  const FavoritesListWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final list = context.watch<FavoritesBloc>().favorites;
    return BlocBuilder<FavoritesBloc, FavoriteState>(
      builder: (context, state) {
        return MasonryGridView(
          physics: const ScrollPhysics(parent: ClampingScrollPhysics()),
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: [
            if (list != null)
              ...list
                  .map((e) => MovieCard(
                        movie: e,
                      ))
                  .toList()
                  .reversed
                  .toList(),
            if (state is FavoriteLoading)
              ...List.generate(
                  6,
                  (index) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.red,
                        enabled: true,
                        child: Image.asset(AppImages.moviePlaceHolder),
                      )),
            if (state is FavoriteError) ...[
              const Text('Loading'),
              const Text('Error'),
            ]
          ],
        );
      },
    );
  }
}
