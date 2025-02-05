import 'package:flutter/material.dart';
import 'package:untitled4/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Fix: Use List<Map<String, String>> to correctly store category names and images
  List<Map<String, String>> images = [
    {"Coffee": "assets/imgs/1.jpg"},
    {"Latte": "assets/imgs/2.jpg"},
    {"Mocha": "assets/imgs/3.jpg"},
    {"Tea": "assets/imgs/4.jpg"},
  ];
  List items = [
    {
      "image" : "assets/imgs/1.jpg",
      "title" : "Coffee",
      "description" : "description 1 and .....",
      "price" : "350\$"
    },
    {
      "image" : "assets/imgs/2.jpg",
      "title" : "Latte",
      "description" : "description 2 and .....",
      "price" : "300\$"
    },
    {
      "image" : "assets/imgs/3.jpg",
      "title" : "Mocha",
      "description" : "description 3 and .....",
      "price" : "400\$"
    },
    {
      "image" : "assets/imgs/4.jpg",
      "title" : "Tea",
      "description" : "description 4 and .....",
      "price" : "450\$"
    },

  ];
  int selected_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected_index,
        iconSize: 40,
          onTap: (val){
          setState(() {
            selected_index = val;
          });
          },
          selectedItemColor: Colors.brown[700],
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "*"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: "*"),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "*"),
      ]),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search, size: 30, color: Colors.black),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.menu, size: 40),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text("Categories",
                style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            // Fixed ListView.builder
            SizedBox(
              height: 140, // Fixed height for horizontal scrolling
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, i) {
                  // Extract category name and image path from the map
                  String category = images[i].keys.first;
                  String imagePath = images[i][category]!;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200], // Background color
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(category, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Text("Best Selling",
                style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold)),
            GridView.builder(
              itemCount: items.length,
              itemBuilder: (context,i){
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ItemDetails(data:items[i])));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          width: 300,
                          color: Colors.grey[200],
                          child: Image.asset(items[i]["image"],height: 130,fit: BoxFit.cover,),
                        ),
                        Text(items[i]["title"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text(items[i]["description"],style: TextStyle(fontSize: 14,color: Colors.grey),),
                        Text(items[i]["price"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.brown[700] ),)
                      ],
                    ),
                  ),
                );
              },
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250),
            )

          ],
        ),
      ),
    );
  }

}
