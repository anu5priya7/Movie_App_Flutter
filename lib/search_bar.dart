import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:movie_app/now_playing_movie.dart';
import 'package:movie_app/popular_movie.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List nowplayingmovie = [];
  List popularmovie = [];
  // List topratedmovie = [];

  String apikey = '342a9c100e3ffb405ca00db731a87186';
  final readaccessstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNDJhOWMxMDBlM2ZmYjQwNWNhMDBkYjczMWE4NzE4NiIsInN1YiI6IjY1NjZiYWFlYTM0OTExMDBjNDY2ZjVlZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7BahL00IOi_rOZupEveJk9raeM8kiCt94ZiBr93D_yI';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccessstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    //Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    // Map  topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    Map popularmovieresult = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map nowplayingresult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();

    setState(() {
      popularmovie = popularmovieresult['results'];
      nowplayingmovie = nowplayingresult['results'];
    });
    print(popularmovie);
    print(nowplayingmovie);
  }


  TextEditingController? _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,

        title: Container(
         // margin: EdgeInsets.only(top: 50,bottom: 50),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            controller: _textEditingController,

            decoration: InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search'
            ),
          ),
        ),


      ),







      body: ListView(
        children: [
          NowPlayingMovies(nowplaying: nowplayingmovie),
          PopularMovies(popular: popularmovie),
        ],
      ),
    );
  }
}
