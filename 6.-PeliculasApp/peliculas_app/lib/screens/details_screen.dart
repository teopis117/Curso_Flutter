import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/model.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    print(movie.title);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie),
          //sliverlist es una lista de slivers
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndTitle(movie),
            _OverView(movie),
            _OverView(movie),
            _OverView(movie),
            _OverView(movie),
            _OverView(movie),
            _OverView(movie),
            CastingCards(movie.id),
          ])),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          child: Text(
            movie.title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('lib/assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('lib/assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
                width: 110,
              ),
            ),
          ),
          SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: TextTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: TextTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_outline,
                      size: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${movie.voteAverage}',
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  final Movie movie;
  const _OverView(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
