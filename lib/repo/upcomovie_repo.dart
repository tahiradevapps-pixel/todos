import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/nowplaying-model.dart';
import 'package:flutter_application_1/model/upcoming_model.dart';
import 'package:http/http.dart' as http;

class nowplayMovie {
  Future<NowplayingModel?> getplayingData() async {
    try {
      final response2 = await http.get(
        Uri.parse("https://api.themoviedb.org/3/movie/now_playing"),
        headers: {
          'Authorization':
              "Bearer  eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiODY2MmI2OWNmYTU2YTA4MDhhYTVlMTkxODFmYTE4NSIsIm5iZiI6MTc2NTc4NjQ4OS42MzMsInN1YiI6IjY5M2ZjMzc5ODcyYzFmNDZlYjk5ZjdhOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DdsKw-8_feSF2Yyz4_-nWecsOWVzAvDW3pAFRWQ8Fe0",
        },
      );
    
      if (response2.statusCode == 200 || response2.statusCode == 201) {

        final data = jsonDecode(response2.body) as Map<String, dynamic>;
        return NowplayingModel.fromJson(data);
      }
    } catch (e) {
      rethrow;
      
    }
    return null;
  }
}
