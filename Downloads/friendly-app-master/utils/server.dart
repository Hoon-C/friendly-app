import 'package:http/http.dart' as http;

class Server {
  final String url = "https://jsonplaceholder.typicode.com/posts/1";

  Future<http.Response> fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('HTTP Connect Error');
    }
  }
}
