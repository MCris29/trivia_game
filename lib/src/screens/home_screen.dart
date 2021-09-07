import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_game/src/providers/movies_provider.dart';
import 'package:trivia_game/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // CardSwiper(movies: moviesProvider.onDisplayMovies),
            MovieSlider(
              categoryTitle: 'Categorías',
              movies: moviesProvider.popularMovies,
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            // MovieSlider(
            //   categoryTitle: 'Mejor Calificadas',
            //   movies: moviesProvider.topRateMovies,
            //   onNextPage: () => moviesProvider.getRateTopMovies(),
            // ),
            // MovieSlider(
            //   categoryTitle: 'Próximos Lanzamientos',
            //   movies: moviesProvider.upcomingMovies,
            //   onNextPage: () => moviesProvider.getUpcomingMovies(),
            // ),
          ],
        ),
      ),
    );
  }
}
