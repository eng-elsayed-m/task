import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task/src/core/consts/app_image.dart';
import 'package:task/src/core/consts/consts.dart';
import 'package:task/src/core/utiles/animated_switche.dart';
import 'package:task/src/core/utiles/entrance_fader.dart';
import 'package:task/src/core/utiles/extentions.dart';
import 'package:task/src/core/utiles/nav.dart';
import 'package:task/src/features/favorit/data/data.dart';
import 'package:task/src/features/favorit/presentation/bloc/favorite_bloc.dart';
import 'package:task/src/features/favorit/presentation/favorites_view/favorites_view.dart';
import 'package:task/src/features/movies/domain/entities/movie.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:task/src/features/movies/presentation/bloc/bloc.dart';
import 'package:task/src/injector.dart';
part 'widgets/movies_list.dart';
part 'widgets/movie_card.dart';
part 'details_page.dart';
part 'widgets/cart_bg.dart';
part 'widgets/search.dart';
part 'widgets/movie_card_shimmer.dart';
part 'widgets/details_shimmer.dart';

class MoviesPage extends StatelessWidget {
  static const routeName = '/movies-page';
  const MoviesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Movies Home'),
            bottom: const TabBar.secondary(
              labelPadding: EdgeInsets.all(8),
              tabs: [
                Text('Now Playing'),
                Text('Top Rated'),
                Text('Favorites'),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context);
                  },
                  icon: const Icon(Icons.search)),
            ],
          ),
          body: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<MovieBloc>(),
              ),
              BlocProvider(
                create: (context) =>
                    sl<FavoritesBloc>()..add(const GetFavoritsEvent()),
              ),
            ],
            child: const TabBarView(children: [
              MovieListWidget(pageKey: 'now_playing'),
              MovieListWidget(pageKey: 'top_rated'),
              FavoritesListWidget()
            ]),
          )),
    );
  }
}
