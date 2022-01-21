import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/config/api.dart';
import 'package:flutter_challenge/screens/movies/model/movie_info.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  //Page to get on the api
  var page = 1;
  //Query sent to api
  final queryParameters = {
    'api_key': '0d677b16a44d2b5a79edf325bc1ee9b7',
    'language': 'es-CO',
    'sort_by': 'popularity.desc',
    'page': '1',
  };

  //Get the first page of movies with the required filters
  Future<List<Movie>> discoverMovies() async {
    //Set default page 1 if change for moreMovies method
    page = 1;
    queryParameters["page"] = page.toString();
    //Empty list
    final List<Movie> movies = [];
    //Get info through the API
    final uri = Uri.https(api, '/3/discover/movie', queryParameters);
    final resp = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    final decodedData = json.decode(resp.body);
    //Convert json info to object list
    List datos = decodedData['results'];
    for (var comp in datos) {
      final moviesTemp = Movie.fromJson(comp);
      movies.add(moviesTemp);
    }
    return movies;
  }

  //Get the next page with the required filters (Except the page of course)
  Future<List<Movie>> discoverMoreMovies() async {
    addPage();
    //Change page
    queryParameters["page"] = page.toString();
    //Empty list
    final List<Movie> movies = [];
    //Get info through the API
    final uri = Uri.https(api, '/3/discover/movie', queryParameters);
    final resp = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    final decodedData = json.decode(resp.body);
    //Convert json info to object list
    List datos = decodedData['results'];
    for (var comp in datos) {
      final moviesTemp = Movie.fromJson(comp);
      movies.add(moviesTemp);
    }
    return movies;
  }

  //Update the information with the required filters
  Future<List<Movie>> updateMoreMovies() async {
    //Change page
    queryParameters["page"] = page.toString();
    //Empty list
    final List<Movie> movies = [];
    //Get info through the API
    final uri = Uri.https(api, '/3/discover/movie', queryParameters);
    final resp = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    final decodedData = json.decode(resp.body);
    //Convert json info to object list
    List datos = decodedData['results'];
    for (var comp in datos) {
      final moviesTemp = Movie.fromJson(comp);
      movies.add(moviesTemp);
    }
    return movies;
  }

  //Get actual page of the query
  getActualPage() {
    return page;
  }

  //Add 1 to the page of the query
  addPage() {
    page++;
  }
}
