import 'dart:convert';
import 'package:pizza/models/pizza_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String url = "https://625bbd9d50128c570206e502.mockapi.io/api/v1/pizza/1";

  Future<List<PizzaModel>> getInfo() async {
    http.Response res = await http.get(Uri.parse(url));

    try {
      if (res.statusCode == 200) {
        print("sucess bruh");

        //final s = json.decode(res.body).cast<Map<String, dynamic>>();

        final Map<String, dynamic> parsed = json.decode(res.body);

        List<PizzaModel> s = List<PizzaModel>.from(
            parsed["crusts"].map((x) => PizzaModel.fromJson(x)));

        
        


        return s;
      } else {
        print("gone");
        return <PizzaModel>[];
      }
    } catch (e) {
      print(e);
      return <PizzaModel>[];
    }
    //  return <Pizza>[];
  }
}
