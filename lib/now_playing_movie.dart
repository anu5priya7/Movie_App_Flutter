import 'package:flutter/material.dart';
import 'package:movie_app/decription.dart';

class NowPlayingMovies extends StatelessWidget {
  final List nowplaying;

  const NowPlayingMovies({Key? key, required this.nowplaying})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 500,
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: nowplaying.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: nowplaying[index]['title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' + nowplaying[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' + nowplaying[index]['poster_path'],
                          description: nowplaying[index]['overview'],
                          vote: nowplaying[index]['vote_average'].toString(),
                          launch_on: nowplaying[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 30.0),
                    width: double.infinity, // Take the available width
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 130,
                          height: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      nowplaying[index]['poster_path']),
                            ),
                          ),
                        ),
                        SizedBox(
                            width:
                            10), // Add some spacing between the image and text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 5.0, left: 5.0, bottom: 50.0),
                                child: Text(
                                  nowplaying[index]['title'] != null
                                      ? nowplaying[index]['title']
                                      : 'Loading',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 40.0),
                                child: Text(
                                  nowplaying[index]['overview'] != null
                                      ? nowplaying[index]['overview']
                                      : 'Loading',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
