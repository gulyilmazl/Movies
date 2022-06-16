import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/constants.dart';
import 'package:movies/controller/movieController.dart';

import 'detailPage.dart';

class Home extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Obx(
        () {
          return movieController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.pink.shade200,
                ))
              : Stack(
                  children: [
                    Container(
                      height: size.height,
                      width: size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "$bgURL${movieController.selectedMovie.value.bgURL}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 50.0),
                      height: size.height,
                      width: size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: FractionalOffset.bottomCenter,
                            end: FractionalOffset.topCenter,
                            colors: [
                              Colors.black87,
                              Colors.black26,
                            ],
                            stops: [
                              0.4,
                              1.0
                            ]),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: size.width,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: CarouselSlider.builder(
                                      options: CarouselOptions(
                                        autoPlay: false,
                                        viewportFraction: 0.7,
                                        height: size.height,
                                        enlargeCenterPage: true,
                                        onPageChanged: (i, _) {
                                          movieController.selectedMovies(i);
                                        },
                                      ),
                                      itemCount:
                                          movieController.trendingMovies.length,
                                      itemBuilder: (BuildContext context,
                                          int index, int realIndex) {
                                        return InkWell(
                                          onTap: () {
                                            movieController.getMovieDetail(
                                                movieController
                                                    .selectedMovie.value.id);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        MovieDescription()));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.pink.shade200,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "$posterURL${movieController.trendingMovies[index].posterURL}"),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: size.width / 2,
                            height: 2,
                            decoration: BoxDecoration(
                                color: Colors.pink.shade200,
                                borderRadius: BorderRadius.circular(100.0)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                              width: size.width,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          color: Colors.pink.shade200,
                                        ),
                                        child: Text(
                                          "${movieController.selectedMovie.value.rating}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: movieController
                                        .selectedMovie.value.category
                                        .map((e) => Text(
                                              e.category,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 100),
                                    child: Text(
                                      "${movieController.selectedMovie.value.title}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
