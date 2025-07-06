import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:movies/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies in theaters'),
        actions: [
          IconButton(icon: const Icon(Icons.search_outlined), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Principal cards
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            SizedBox(height: 60), 

            // Movies slider
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Popular movies!',
              onNextPage: ()=> moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
