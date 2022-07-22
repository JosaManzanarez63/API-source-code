import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:movies/providers/popular_provider.dart';
import 'package:movies/screens/widgets/background.dart';
import 'package:movies/screens/widgets/card_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    final popularProvider = Provider.of<PopularProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){
              
            }, 
            icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
          child: Column(
            children: [
              const Text(''),
              const Text('Upcoming Movies', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
              )),
              CardSwiper(movies: moviesProvider.dataMovies),
              const Text('Popular Movies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
              )),
              CardSwiper(movies: popularProvider.dataMovies),
              ],
            ),
          ),
        ]
      ),
    );
  }
}