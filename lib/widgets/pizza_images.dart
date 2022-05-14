import 'package:flutter/material.dart';

class pizzaImages extends StatelessWidget {
  const pizzaImages({
    Key? key,
    required this.image,
    required this.index
  }) : super(key: key);

  final List<String> image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 5,bottom: 10),
      width: 200,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
          image: DecorationImage(
              image: AssetImage("images/" + image[index]), fit: BoxFit.cover)),
    );
  }
}