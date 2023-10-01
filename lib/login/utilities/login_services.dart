import 'package:animal_vax/login/login_model.dart';
import 'package:http/http.dart';

class LoginServices{
  Future<Map<String,dynamic>> credentialCheck(PreLogin l1) async{
    final response = await post(
        Uri.parse("https://tnpetvac.onrender.com/ownerAuth/"),
        body: l1.toJSON()
    );
    if(response.statusCode==200) {
      return {
        'status': "Success",
        'data': response.body,
      };
    } else {
      return {
        'status': "Failure",
        'message': "Invalid Credentials",
      };
    }
  }
}