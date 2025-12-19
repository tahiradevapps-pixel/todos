import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/nowplaying-model.dart';
import 'package:flutter_application_1/model/searching_model.dart';
import 'package:flutter_application_1/model/upcoming_model.dart';
import 'package:flutter_application_1/repo/movies_repo.dart';
import 'package:flutter_application_1/repo/search_repo.dart';
import 'package:flutter_application_1/repo/upcomovie_repo.dart';

class UpcomeToprateMovies extends StatefulWidget {
  UpcomeToprateMovies({super.key});
       

  @override
  State<UpcomeToprateMovies> createState() => _UpcomeToprateMoviesState();
}

class _UpcomeToprateMoviesState extends State<UpcomeToprateMovies> {
  UpcomingModel? upcomingModel;
  Future<UpcomingModel?> getmovies() async {
    upcomingModel = await MovieRepo().getUpComingData();
    return upcomingModel;
  }

  NowplayingModel? nowplayingModel;
  Future<NowplayingModel?> getdata() async {
    nowplayingModel = await nowplayMovie().getplayingData();
    return nowplayingModel;
  }

  SearchingModel? searchingModel;
  Future<SearchingModel?> getsearching() async {
    searchingModel = await SearchRepo().getsearchData();
    return searchingModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Text(
          "Movies",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final reuslt = await MovieRepo().getUpComingData();
                  log("our view reuslt is $reuslt");
                },
                child: Text("Upcoming"),
              ),
              SizedBox(
                height: 200,

                child: FutureBuilder(
                  future: getmovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (!snapshot.hasData) {
                      return Text("Don't found any data");
                    }
                    final data = snapshot.data?.results;
                    return ListView.builder(
                      shrinkWrap: true,

                      itemCount: data?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final result = data?[index];
                        return SizedBox(
                          height: 170,
                          width: 100,
                          child: Row(
                            children: [
                              Image.network(
                                "https://image.tmdb.org/t/p/w185/${result?.posterPath}",
                                width: 100,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Text(
                                  result?.originalTitle ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  final reuslt2 = await nowplayMovie().getplayingData();
                  log("our view reuslt is $reuslt2");
                },
                child: Text("nowplaying"),
              ),
              SizedBox(
                height: 200,

                child: FutureBuilder(
                  future: getdata(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (!snapshot.hasData) {
                      return Text("Don't found any data");
                    }
                    final data2 = snapshot.data?.results;
                    return ListView.builder(
                      shrinkWrap: true,

                      itemCount: data2?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final result2 = data2?[index];
                        return SizedBox(
                          height: 170,
                          width: 100,
                          child: Row(
                            children: [
                              Image.network(
                                "https://image.tmdb.org/t/p/w185/${result2?.posterPath}",
                                width: 100,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Text(
                                  result2?.originalTitle ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  final reuslt3 = await nowplayMovie().getplayingData();
                  log("our view reuslt is $reuslt3");
                },
                child: Text("searching"),
              ),
              SizedBox(
                height: 200,

                child: FutureBuilder(
                  future: getsearching(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (!snapshot.hasData) {
                      return Text("Don't found any data");
                    }
                    final data3 = snapshot.data?.results;
                    return ListView.builder(
                      shrinkWrap: true,

                      itemCount: data3?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final result3 = data3?[index];
                        return SizedBox(
                          height: 170,
                          width: 100,
                          child: Row(
                            children: [
                              Image.network(
                                "https://image.tmdb.org/t/p/w185/${result3?.posterPath}",
                                width: 100,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Text(
                                  result3?.originalTitle ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
