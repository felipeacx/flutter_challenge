import 'package:flutter/material.dart';
import 'package:flutter_challenge/config/api.dart';
import 'package:flutter_challenge/screens/movies/model/movie_info.dart';
import 'package:flutter_challenge/screens/movies/ui/widgets/popup.dart';
import 'package:flutter_challenge/utils/responsive.dart';
import 'package:flutter_challenge/utils/theme.dart';
import 'package:flutter_challenge/utils/titles.dart';
//Format numbers with thousand separators
import 'package:intl/intl.dart';

Widget moviesList(BuildContext context, Movie movie) {
  //Widget to capture the tap of the user
  return InkWell(
    onTap: () {
      //show the pop up with hero animation and more information
      showPopUp(context, movie);
    },
    child: Container(
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      //Column with basic información show in the home page
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Hero(
              tag: movie.title,
              child: Image.network("$apiImage${movie.poster_path}",
                  frameBuilder: (context, child, frame, _) {
                if (frame == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return child;
              }),
            ),
          ),
          Center(
              child: Text("Calificación: ${movie.vote_average.toString()}/10")),
        ],
      ),
    ),
  );
}
