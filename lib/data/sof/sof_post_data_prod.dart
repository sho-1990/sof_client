import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sof_app/data/exception/fetch_data_exception.dart';
import 'package:sof_app/data/sof/sof_post_data.dart';

class ProdSofPostsRepository implements SofPostsRepository {

  var url = "https://sof-client.herokuapp.com/posts";

  @override
  Future<List<Post>> fetchPosts() async {
    http.Response response = await http.get(url);
    final Map responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw FetchDataException(
          message: "An error occurred: [Status Code : $statusCode]"
      );
    }

    List<Post> items = List();
    responseBody.forEach((k, v) {
      if (k == "items") {
        v.forEach((vv) {
          items.add(Post.fromMap(vv));
        });
      }
    });
    return items;
  }

  _onTimeout() {
    throw FetchDataException(
      message: "Timeout Occurred"
    );
  }
}