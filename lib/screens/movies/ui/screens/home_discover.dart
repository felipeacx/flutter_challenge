import 'package:flutter/material.dart';
//Import internal functions and widgets
import 'package:flutter_challenge/screens/movies/model/movie_info.dart';
import 'package:flutter_challenge/screens/movies/repository/movie_repository.dart';
import 'package:flutter_challenge/screens/movies/ui/widgets/home_page.dart';
import 'package:flutter_challenge/utils/theme.dart';
import 'package:flutter_challenge/utils/titles.dart';
//Library to show toast messages, similar to Android Toast
import 'package:fluttertoast/fluttertoast.dart';

class HomeDiscover extends StatefulWidget {
  static const routeName = "/discover_movies";

  const HomeDiscover({Key? key}) : super(key: key);
  @override
  _HomeDiscoverState createState() => _HomeDiscoverState();
}

class _HomeDiscoverState extends State<HomeDiscover> {
  //Provider to fetch data
  final moviesProvider = MovieRepository();
  //Variable to save movies
  var movies;
  //Init movies list
  @override
  void initState() {
    super.initState();
    //Get movies list when init app
    movies = moviesProvider.discoverMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Don't show developer icon in the app bar
        automaticallyImplyLeading: false,
        //Application title
        title: Text(homeTitle),
        //App bar button actions
        actions: [
          //Button to return home
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.amber,
            ),
            onPressed: () {
              setState(() {
                movies = moviesProvider.discoverMovies();
              });
            },
          ),
          //Button to show next page
          IconButton(
            icon: const Icon(
              Icons.add_circle,
              color: Colors.amber,
            ),
            onPressed: () {
              setState(() {
                movies = moviesProvider.discoverMoreMovies();
              });
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // Get actual render page
            var actualPage = moviesProvider.getActualPage();
            // If page is 1 render first page
            if (actualPage == 1) {
              //Update the list when user clicks the floating button
              movies = moviesProvider.discoverMovies();
              Fluttertoast.showToast(msg: "Lista actualizada.");
              // else render the actual page
            } else {
              //Update the list when user clicks the floating button
              movies = moviesProvider.updateMoreMovies();
              Fluttertoast.showToast(msg: "Lista actualizada.");
            }
          });
        },
        child: const Icon(Icons.refresh),
        backgroundColor: secondaryColor,
      ),
      //Future builder that show all the fetch movies from the api
      body: FutureBuilder(
          future: movies,
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            //Show circular progress if has no data
            if (snapshot.hasData) {
              final movies = snapshot.data;
              //Show text 'No se han descubierto películas' if is list is empty
              if (movies!.isEmpty) {
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                      child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Text(
                          'No se han descubierto películas',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: grayColor,
                          ),
                        ),
                        const SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ],
                    ),
                  )),
                );
                // show gridview with movies list on 2 columns
              } else {
                return GridView.count(
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: List.generate(
                      movies.length,
                      (i) => moviesList(context, movies[i]),
                    ));
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
