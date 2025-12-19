import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_1/model/upcoming_model.dart';
import 'package:http/http.dart' as http;

class MovieRepo {
  Future<UpcomingModel?> getUpComingData() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/upcoming'),
        headers: {
          'Authorization':

              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiODY2MmI2OWNmYTU2YTA4MDhhYTVlMTkxODFmYTE4NSIsIm5iZiI6MTc2NTc4NjQ4OS42MzMsInN1YiI6IjY5M2ZjMzc5ODcyYzFmNDZlYjk5ZjdhOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DdsKw-8_feSF2Yyz4_-nWecsOWVzAvDW3pAFRWQ8Fe0",
        },
      );
      // log("our response is ${response.body}"s);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return UpcomingModel.fromJson(data);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
