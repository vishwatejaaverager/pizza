import 'dart:convert';
import 'package:pizza/models/pizza_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String url = "https://625bbd9d50128c570206e502.mockapi.io/api/v1/pizza/1";

  Future<PizzaModel> getInfo() async {
    http.Response res = await http.get(Uri.parse(url));
    PizzaModel pizzaModel = PizzaModel();

    try {
      if (res.statusCode == 200) {
        print("sucess bruh");
        return PizzaModel.fromJson(
          json.decode(res.body) as Map<String, dynamic>,
        );
      } else {
        print("gone");
        return PizzaModel();
      }
    } catch (e) {
      print(e);
      return PizzaModel();
    }
    //  return <Pizza>[];
  }
}
