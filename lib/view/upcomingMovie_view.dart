import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/upcoming_model.dart';
import 'package:flutter_application_1/repo/movies_repo.dart';

class UpComingMovieView extends StatefulWidget {
  const UpComingMovieView({super.key});

  @override
  State<UpComingMovieView> createState() => _UpComingMovieViewState();
}

class _UpComingMovieViewState extends State<UpComingMovieView> {
  UpcomingModel? upcomingModel;

  Future<UpcomingModel?> getMOvies() async {
    upcomingModel = await MovieRepo().getUpComingData();
    return upcomingModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upcoming Movie")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final reuslt = await MovieRepo().getUpComingData();
                log("our view reuslt is $reuslt");
              },
              child: Text("clilable"),
            ),

            FutureBuilder(
              future: getMOvies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (!snapshot.hasData) {
                  return Text("no data found");
                }
                final data = snapshot.data?.results;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    final reuslt = data?[index];
                    return Column(
                      children: [
                        Image.network(
                          "https://image.tmdb.org/t/p/w185/${reuslt?.posterPath}",
                        ),
                        Text(reuslt?.title ?? ''),
                        Text(reuslt?.originalTitle ?? ''),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
