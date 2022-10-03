import 'package:http/http.dart' as http;

class AuthRepository {

  Future<String?> login(String username,String password) async {
      print('attempting login${username} and password $password');
    // await Future.delayed(Duration(seconds: 3));
    // print('logged in');
    // throw Exception('failed log in');


    final response = await http.get(Uri.parse('https://api.covid19api.com/summary'));

    print("responsedata${response.body}");

    String response_data = '{"status": "1","msg": "data found","data": [{"username": "soni 1","id": "1","age": "23"}, {"username": "soni 2","id": "2","age": "24"},{"username": "soni 3","id": "3","age": "25"}, {"username": "soni 4","id": "4","age": "26"}]}';


    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //return Album.fromJson(jsonDecode(response.body));

       //throw Exception('Success fully call api');
      print('Success fully call api');
      return "success";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //throw Exception('Failed to load album');
      return "fail";
    }
  }
}
