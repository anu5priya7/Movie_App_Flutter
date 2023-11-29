

import 'package:flutter/material.dart';
import 'package:movie_app/util/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description({
    Key? key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_on,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              bannerurl,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            bottom: 0,
            left: 25,
            right: 25,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              color: Colors.black87,
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Empty space to push rating to the top right
                        SizedBox(),
                        Text(
                          '⭐ Rating - ' + vote,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      name != null ? name : 'Not Loaded',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Releasing On - ' + launch_on,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    Text(
                      description,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
