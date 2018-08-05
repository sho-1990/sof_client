import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sof_app/data/exception/fetch_data_exception.dart';
import 'package:sof_app/data/sof/sof_answer_data.dart';

class ProdSofAnswersRepository implements SofAnswersRepository {

  var url = "https://sof-client.herokuapp.com/answers";

  @override
  Future<List<Answer>> fetchAnswers() async {
    http.Response response = await http.get(url);
    final Map responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw FetchDataException(
        message: "An error occurred: [Status Code : $statusCode]"
      );
    }

    List<Answer> items = List();
    responseBody.forEach((k, v) {
      if (k == "items") {
        v.forEach((vv) {
          items.add(Answer.fromMap(vv));
        });
      }
    });
    return items;
  }

}