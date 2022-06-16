import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/constants.dart';
import 'package:movies/controller/movieController.dart';

class MovieDescription extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Obx(
        () {
          return movieController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.pink.shade200,
                  ),
                )
              : SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  '$bgURL${movieController.movie.value.bgURL}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: size.width,
                          padding: EdgeInsets.all(25),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text(
                                  "${movieController.movie.value.title}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      '${movieController.movie.value.releaseYear}',
                                      // '15+',
                                      '${movieController.movie.value.runtime} min'
                                    ]
                                        .map((e) => Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 20, 0),
                                              child: Text(
                                                '$e',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ))
                                        .toList()),
                              ),
                              Wrap(
                                children: movieController.movie.value.category
                                    .map((e) => Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 10, 0),
                                          child: Chip(
                                            label: Text(
                                              '$e',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            backgroundColor:
                                                Colors.pink.shade200,
                                          ),
                                        ))
                                    .toList(),
                              ),
                              SizedBox(height: 18),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Overview',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                      '${movieController.movie.value.overview}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                ],
                              ),
                              SizedBox(height: 18),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cast & Crew',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  SizedBox(height: 10),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: movieController.movie.value.cast
                                          .map((e) => Container(
                                                width: size.width / 4,
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage: e.profileURL ==
                                                              null
                                                          ? NetworkImage(
                                                              'https://pbs.twimg.com/profile_images/1438096529185779715/nnw1HiOv_400x400.png')
                                                          : NetworkImage(
                                                              '$posterURL${e.profileURL}'),
                                                      radius: 40,
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      '${e.name}',
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      '${e.character}',
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption,
                                                    ),
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                  Divider(),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: movieController.movie.value.crew
                                          .map((e) => Container(
                                                width: size.width / 4,
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage: e.profileURL ==
                                                              null
                                                          ? NetworkImage(
                                                              'https://pbs.twimg.com/profile_images/1438096529185779715/nnw1HiOv_400x400.png')
                                                          : NetworkImage(
                                                              '$posterURL${e.profileURL}'),
                                                      radius: 40,
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      '${e.name}',
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      '${e.job}',
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption,
                                                    ),
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  )
                                ],
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
    );
  }
}
