import 'package:flutter/material.dart';

class PizzaHome extends StatefulWidget {
  const PizzaHome({Key? key}) : super(key: key);

  @override
  State<PizzaHome> createState() => _PizzaHomeState();
}

class _PizzaHomeState extends State<PizzaHome> {
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
  static List<double> pizza_prizes = [250,100,150,200];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("pizza App"),
      ),
      body: Column(
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
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                  image: DecorationImage(
                                      image:
                                          AssetImage("images/" + image[index]),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                                height: 120,
                                width: 200,
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 15),
                                        child: Text(
                                          pizzas[index],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 12),
                                              child: IconButton(
                                                icon: Icon(
                                                    Icons.minimize_rounded),
                                                onPressed: () {
                                                  if (index == 0) {
                                                    setState(() {
                                                      if (pizza_count[0] == 0) {
                                                        pizza_count[0] = 0;
                                                      } else {
                                                        pizza_count[0]--;
                                                      }
                                                    });
                                                  }

                                                  if (index == 1) {
                                                    setState(() {
                                                      if (pizza_count[1] == 0) {
                                                        pizza_count[1] = 0;
                                                      } else {
                                                        pizza_count[1]--;
                                                      }
                                                    });
                                                  }
                                                  if (index == 2) {
                                                    setState(() {
                                                      if (pizza_count[2] == 0) {
                                                        pizza_count[2] = 0;
                                                      } else {
                                                        pizza_count[2]--;
                                                      }
                                                    });
                                                  }
                                                  if (index == 3) {
                                                    setState(() {
                                                      if (pizza_count[3] == 0) {
                                                        pizza_count[3] = 0;
                                                      } else {
                                                        pizza_count[3]--;
                                                      }
                                                    });
                                                  }
                                                },
                                              ),
                                            ),
                                            Text(
                                              pizza_count[index].toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              child: IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: () {
                                                  if (index == 0) {
                                                    setState(() {
                                                      pizza_count[0]++;
                                                    });
                                                  }
                                                  if (index == 1) {
                                                    setState(() {
                                                      pizza_count[1]++;
                                                    });
                                                  }
                                                  if (index == 2) {
                                                    setState(() {
                                                      pizza_count[2]++;
                                                    });
                                                  }
                                                  if (index == 3) {
                                                    setState(() {
                                                      pizza_count[3]++;
                                                    });
                                                  }
                                                },
                                              ),
                                            )
                                          ]),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text("₹ "+pizza_prizes[index].toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,fontSize: 15),
                                      
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        );
                      }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
