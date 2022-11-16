import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/search/search_delegate.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("peliculas en cine"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              //el showsearch
              showSearch(context: context, delegate: MovieSearchDelegate());
            },
            icon: Icon(Icons.search_outlined),
          ),
        ],
      ),
      //el singlechild me sirve para poder renderizar los elementos que sobrepasen la pantalla y asi no generen problemas
      body: SingleChildScrollView(
        child: Column(
          children: [
            //!TARJETAS PRINCIPALES
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //!slider de peliculas
            MovieSlider(
              //le mandamos las peliculas
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
