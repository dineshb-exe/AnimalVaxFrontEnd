import 'package:animal_vax/registration/models/doc_reg_model.dart';
import 'package:animal_vax/registration/models/reg_model.dart';
import 'package:http/http.dart';

class OwnerServices{
  Future<void> register(Owner o1) async{
    final response = await post(
      Uri.parse("https://tnpetvac.onrender.com/owners/create/"),
      body: o1.toJSON()
    );
    print("HI DA, ${response}");
  }
}

class DoctorServices {
  Future<void> register(Doctor d1) async{
    print("${d1.name},${d1.address},${d1.password},${d1.email},${d1.phone}");
    final response = await post(
        Uri.parse("https://tnpetvac.onrender.com/doctors/create/"),
        body: d1.toJson()
    );
    print("HI DA, ${response}");
  }
}