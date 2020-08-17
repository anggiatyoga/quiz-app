import 'package:extraextrovert/resources/user_model.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<UserModel>> getUser() async {
    try {
      final response =
          await http.get("http://192.168.0.11/mysql_config/get_all.php");
      if (200 == response.statusCode) {
        print('services => success');
        List<UserModel> list = userModelFromJson(response.body);
        return list;
      } else {
        print('services => lost');
        throw Exception('Failed to load');
      }
    } catch (e) {
      print('error (e) => ${e.toString()}');
    }
  }
}
