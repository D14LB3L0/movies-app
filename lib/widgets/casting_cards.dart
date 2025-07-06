import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapShot) {
        if (!snapShot.hasData) {
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }

        final List<Cast> cast = snapShot.data!;

        return Container(
          margin: EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) => _CastCard(actor: cast[index]),
            itemCount: cast.length,
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {

  final Cast actor;

  const _CastCard({required this.actor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('${actor.fullProfilePath}'),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 5),
          SizedBox(
            height: 40,
            child: Text(
              actor.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
