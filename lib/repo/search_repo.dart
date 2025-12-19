
import 'dart:convert';

import 'package:flutter_application_1/model/searching_model.dart';
import 'package:flutter_application_1/model/upcoming_model.dart';
import 'package:http/http.dart' as http;
class SearchRepo {
  Future<SearchingModel?> getsearchData() async{
    try{
      final response3= await http.get(Uri.parse("https://api.themoviedb.org/3/search/movie?query=abc"),
      headers: {
        "Authorization": " Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiODY2MmI2OWNmYTU2YTA4MDhhYTVlMTkxODFmYTE4NSIsIm5iZiI6MTc2NTc4NjQ4OS42MzMsInN1YiI6IjY5M2ZjMzc5ODcyYzFmNDZlYjk5ZjdhOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DdsKw-8_feSF2Yyz4_-nWecsOWVzAvDW3pAFRWQ8Fe0 "
      }
        
      );
         if (response3.statusCode == 200 || response3.statusCode == 201) {

        final data = jsonDecode(response3.body) as Map<String, dynamic>;
        return SearchingModel.fromJson(data);
      }
    } catch (e) {
      rethrow;
    }
    return null;
       }
 }

 