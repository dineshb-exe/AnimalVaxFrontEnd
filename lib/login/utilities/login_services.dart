import 'package:animal_vax/login/login_model.dart';
import 'package:http/http.dart';

class LoginServices{
  Future<Map<String,dynamic>> credentialCheck(PreLogin l1) async{
    try {
      final response = await post(
          Uri.parse("https://tnpetvac.onrender.com/ownerAuth/"),
          body: l1.toJSON()
      );
      return {
        'status': "Success",
        'data': response.body,
      };
    }
    catch (e) {
      return {
        'status': "Failure",
        'message': e,
      };
    }
  }
}