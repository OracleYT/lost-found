//     final Item = ItemFromJson(jsonString);

import 'dart:convert';

List<Item> ItemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String ItemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Item({
    this.id,
    this.description,
    this.image,
    this.title,
    this.price,
    this.rating,
  });

  int id;
  String title;
  String description;
  String price;
  String image;
  Map<String, dynamic> rating;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] ?? 0,
        description: json["description"] ?? "",
        title: json["title"] ?? "",
        image: json['image'] ?? "",
        price: json['price'].toString() ?? '0.0',
        rating: json['rating'] ?? {},
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "title": title,
        'image': image,
        'price': price,
        "rating": rating,
      };
}
