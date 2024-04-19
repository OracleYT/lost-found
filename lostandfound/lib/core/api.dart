import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lostandfound/models/item.dart';

class ApiEndpoints {
  static Future<List<Item>> getItems() async {
    String url = 'https://fakestoreapi.com/products';

    var res = await http.get(Uri.parse(url));
    List<Item> data = ItemFromJson(res.body);
    return data;
  }
}
