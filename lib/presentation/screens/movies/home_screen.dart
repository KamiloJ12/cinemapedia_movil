import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia_movil/presentation/providers/providers.dart';
import 'package:cinemapedia_movil/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-scren';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: 0),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  ConsumerState<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlidesShowProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(delegate: SliverChildBuilderDelegate((context, index) {
        return Column(children: [
          MoviesSlideshow(movies: slideShowMovies),
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'En cines',
            subTitle: 'Lunes 4',
            loadNextPage: () => ref.read(nowPlayingMoviesProvider),
          ),
        ]);
      }))
    ]);
  }
}
