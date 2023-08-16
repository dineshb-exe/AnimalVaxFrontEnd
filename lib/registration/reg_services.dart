import 'package:animal_vax/registration/reg_model.dart';
import 'package:http/http.dart';

class OwnerServices{
  Future<void> register(Owner o1) async{
    print("${o1.name},${o1.address},${o1.password},${o1.email},${o1.phone},${o1.pet_id}");
    final response = await post(
      Uri.parse("https://tnpetvac.onrender.com/owners/create/"),
      body: o1.toJSON()
    );
    print("HI DA, ${response}");
  }
}