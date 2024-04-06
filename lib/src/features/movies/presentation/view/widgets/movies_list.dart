part of '../movies_page.dart';

class MovieListWidget extends StatefulWidget {
  final String pageKey;
  final bool search;
  const MovieListWidget(
      {super.key, required this.pageKey, this.search = false});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    context.read<MovieBloc>().add(MovieFetchEvent(pageKey: widget.pageKey));
    _scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final state = context.read<MovieBloc>().state;
      if (state is MovieLoaded) {
        if (state.page == state.movieList.totalPages) return;
        context.read<MovieBloc>().add(
            MovieNextPageEvent(page: state.page + 1, pageKey: widget.pageKey));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final list = context.watch<MovieBloc>().movieList;
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return MasonryGridView(
          controller: _scrollController,
          physics: const ScrollPhysics(parent: ClampingScrollPhysics()),
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          cacheExtent: 1.2,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: [
            if (list != null)
              ...list.results!
                  .map((e) => MovieCard(
                        movie: e,
                      ))
                  .toList()
                  .reversed
                  .toList(),
            if (state is MovieLoading)
              ...List.generate(6, (index) => const MovieShimmerCard()),
            if (state is MovieError) ...[
              const Text('Loading'),
              const Text('Error'),
            ]
          ],
        );
      },
    );
  }
}
