import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/cubit/app_cubit_states.dart';
import 'package:pizza/cubit/app_cubits.dart';

import '../widgets/pizza_images.dart';

class PizzaHome extends StatefulWidget {
  const PizzaHome({Key? key}) : super(key: key);

  @override
  State<PizzaHome> createState() => _PizzaHomeState();
}

class _PizzaHomeState extends State<PizzaHome> {
  bool handtoss_regular = true;
  bool handtoss_medium = false;
  bool handtoss_large = false;
  bool cheese_medium = false;
  bool cheese_larger = false;

  var image = [
    "cheese_burst_l.jpg",
    "cheese_burst_m.png",
    "hand_tossed_l.jpg",
    "hand_tossed_m.jpg"
  ];
  var pizzas = [
    "cheese burst large",
    "cheese burst medium",
    "hand tossed large",
    "hand tossed medium"
  ];

  static List<int> pizza_count = [0, 0, 0, 0];
  static List<double> pizza_prizes = [250, 100, 150, 200];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("pizza App"),
      ),
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.pizaz_info;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, left: 10),
                  child: Text(
                    "Pizzas",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Container(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: info.length,
                            itemBuilder: (context, index) {
                              List pizza_sizes = info[index]
                                      .sizes
                                      ?.map((e) => e.name)
                                      .toList() ??
                                  [];
                              List pizza_prizes = info[index]
                                      .sizes
                                      ?.map((e) => e.price)
                                      .toList() ??
                                  [];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  pizzaImages(
                                    image: image,
                                    index: index,
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 120,
                                        width: 200,
                                        margin: EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            pizzaName(index, info),
                                            orderCount(index),
                                            Container(
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    
                                                  ]
                                                  ),
                                            ),

                                          ],
                                        )),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Add to cart"),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }

  pizzaName(int index, var info) {
    return Container(
        margin: EdgeInsets.only(left: 15, top: 5),
        child: Text(
          info[index].name.toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }

  orderCount(int index) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          //margin: EdgeInsets.only(bottom: 12),
          child: IconButton(
            icon: Icon(
              Icons.remove_circle_outlined,
              color: Colors.blueGrey,
            ),
            onPressed: pizza_count[index] == 0
                ? null
                : () {
                    return setState(() {
                      pizza_count[index]--;
                    });
                  },
          ),
        ),
        Text(
          pizza_count[index].toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          child: IconButton(
            icon: Icon(
              Icons.add_circle_outlined,
              color: Colors.blueGrey,
            ),
            onPressed: () {
              return setState(() {
                pizza_count[index]++;
              });
            },
          ),
        )
      ]),
    );
  }

  pizzaPrizes(String s) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10),
      child: Text(
        "₹ " + s,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
