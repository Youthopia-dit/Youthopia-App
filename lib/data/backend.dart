import 'package:http/http.dart' as http;

class Api {
  final String baseUrl = 'youthopiabackend.azurewebsites.net';

  Future<void> login() async {}

  Future<void> signup() async {}

  Future<void> getEventDetails() async {
    final Url = Uri.https(baseUrl, '/event/geteventdetails');
    final response = await http.get(Url);
    print(response.body);
  }
}
