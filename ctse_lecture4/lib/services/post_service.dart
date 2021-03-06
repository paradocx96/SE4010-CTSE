import 'package:http/http.dart';
import 'dart:convert';

import '../data/post.dart';

class PostService {
  const PostService();

  Future<List<Post>?> getDataFromAPI() async {
    final response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body).map<Post>((data) {
        return Post.fromJSON(data);
      }).toList();
    }
    return null;
  }
}
