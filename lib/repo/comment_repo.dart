import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_1/model/comment_model.dart';
import 'package:flutter_application_1/utils/app_urls.dart';
import 'package:http/http.dart' as http;

class CommentRepo {
  Future<List<CommentModel>?> getComentModel(String number) async {
    try {
      log("our value is $number");
      List<Map<String, dynamic>>? data;

      var result = await http.get(Uri.parse("${AppUrls.UrlApi}"));
      if (result.statusCode == 200 || result.statusCode == 201) {
        final List<dynamic> decodList = jsonDecode(result.body);

        data = decodList.cast<Map<String, dynamic>>();

        log(data.toString());
        return data.map((e) => CommentModel.fromMap(e)).toList();
      } else {
        log("error");
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
