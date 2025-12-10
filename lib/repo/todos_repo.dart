import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_1/utils/app_urls.dart';
import 'package:http/http.dart' as abdullah;

class TodosRepo {
  Future<List<Map<String, dynamic>>?> getTodoNotes() async {
    try {
      List<Map<String, dynamic>>? result;

      var response = await abdullah.get(Uri.parse(AppUrls.getTodos));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> decodedList = jsonDecode(response.body);
        result = decodedList.cast<Map<String, dynamic>>();
        log(result.toString());
        return result;
      } else {
        log("error");
      }
      return result;
    } catch (e) {
      log(e.toString());

      rethrow;
    }
  }
}
