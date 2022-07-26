import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//https://api.themoviedb.org/3/movie/now_playing?api_key=<<api_key>>&language=en-US&page=1

//https://api.themoviedb.org/3/movie/upcoming?api_key=d6d05f7fdb5edb4bce4bcd5add5c0ac1&language=en-US&page=1
class MoviesProvider extends ChangeNotifier{
  final String _apiKey ='d6d05f7fdb5edb4bce4bcd5add5c0ac1';
  final String _baseUrl= 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<dynamic> dataMovies = [];

MoviesProvider(){
  this.getMovies();
}

getMovies() async{
  var url =
      Uri.https(_baseUrl, '3/movie/upcoming', 
      {'api_key': _apiKey,'language': _language,'page': '1'});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    final Map<String,dynamic> jsonResponse = json.decode(response.body);
    print(jsonResponse);

    dataMovies = jsonResponse['results'];
    notifyListeners();
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
}