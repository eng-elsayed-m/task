part of '../movies_page.dart';

void showSearch(BuildContext context) {
  Timer? timer;
  final ctrl = ScrollController();
  String query = '';
  showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) => BlocProvider(
            create: (context) => sl<MovieBloc>(),
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                final list = context.read<MovieBloc>().movieList;
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Material(
                        borderRadius: BorderRadius.circular(18),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Search',
                              icon: const BackButton(),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.w)),
                          onChanged: (value) {
                            if (timer != null) {
                              timer!.cancel();
                            }
                            timer = Timer(
                              const Duration(seconds: 2),
                              () {
                                query = value;
                                context.read<MovieBloc>().add(MovieFetchEvent(
                                    pageKey: value, search: true));
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: MasonryGridView(
                        controller: ctrl
                          ..addListener(() {
                            if (ctrl.position.pixels ==
                                ctrl.position.maxScrollExtent) {
                              final state = context.read<MovieBloc>().state;
                              if (state is MovieLoaded) {
                                context.read<MovieBloc>().add(
                                    MovieNextPageEvent(
                                        page: state.page + 1,
                                        pageKey: query,
                                        search: true));
                              }
                            }
                          }),
                        physics: const ScrollPhysics(
                            parent: ClampingScrollPhysics()),
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: [
                          if (list != null)
                            ...list.results!
                                .map((e) => MovieCard(movie: e))
                                .toList()
                                .reversed
                                .toList(),
                          if (state is MovieLoading)
                            ...List.generate(
                                6,
                                (index) => Shimmer.fromColors(
                                      baseColor: Colors.grey.shade400,
                                      highlightColor: Colors.red,
                                      enabled: true,
                                      child: Image.asset(
                                          AppImages.moviePlaceHolder),
                                    )),
                        ],
                      ),
                    ),
                    if (state is MovieError) ...[
                      Material(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.message),
                        ],
                      )),
                    ]
                  ],
                );
              },
            ),
          ));
}
