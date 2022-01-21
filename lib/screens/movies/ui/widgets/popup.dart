import 'package:flutter/material.dart';
import 'package:flutter_challenge/config/api.dart';
import 'package:flutter_challenge/screens/movies/model/movie_info.dart';
import 'package:flutter_challenge/utils/formatter.dart';

//Pop up to show the most detailed information of the movie
showPopUp(BuildContext context, Movie movie) {
  Navigator.push(
      context,
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                movie.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Hero(
                      tag: movie.title,
                      child: Image.network("$apiImage${movie.poster_path}",
                          frameBuilder: (context, child, frame, _) {
                        if (frame == null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return child;
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Calificación: ${movie.vote_average.toString()}/10"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Total de votos: ${formatNumber(movie.vote_count)}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text("Fecha de lanzamiento: ${movie.release_date}"),
                    ),
                    const Text(
                      "Descripción general:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(movie.overview)
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('Aceptar'),
                  onPressed: Navigator.of(context).pop,
                ),
              ],
            );
          }));
}
