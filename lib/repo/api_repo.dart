import "dart:convert";
import "dart:developer";

import "package:flutter_application_1/utils/app_urls.dart";
import "package:http/http.dart" as URL;

class ApiRepo {
  Future<List<Map<String, dynamic>>?> getchats(String number) async {
    try {
      log("our valu eis $number");
      List<Map<String, dynamic>>? data;

      var result = await URL.get(Uri.parse("${AppUrls.getApi}?id=$number"));

      if (result.statusCode == 200 || result.statusCode == 201) {
        final List<dynamic> decodList = jsonDecode(result.body);

        data = decodList.cast<Map<String, dynamic>>();

        log(data.toString());
        return data;
      } else {
        log("error");
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
