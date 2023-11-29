import 'package:flutter/material.dart';
import 'package:movie_app/decription.dart';

class PopularMovies extends StatelessWidget {
  final List popular;

  const PopularMovies({Key? key, required this.popular}) : super(key: key);

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
              itemCount: popular.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Handle tap action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: popular[index]['title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' + popular[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' + popular[index]['poster_path'],
                          description: popular[index]['overview'],
                          vote: popular[index]['vote_average'].toString(),
                          launch_on: popular[index]['release_date'],
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
                                      popular[index]['poster_path']),
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
                                  popular[index]['title'] != null
                                      ? popular[index]['title']
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
                                  popular[index]['overview'] != null
                                      ? popular[index]['overview']
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
