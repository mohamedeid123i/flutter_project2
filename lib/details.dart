import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final data; // Explicitly define type

  const ItemDetails({super.key, required this.data});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  String? color = "زياده";
  String? size = "وسط";// Move state variable to the class level
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
      appBar: AppBar(
        iconTheme: IconThemeData(size: 30),
        centerTitle: true,
        title: Text(
          "قهوه عم محمود",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[200],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.menu),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 10),
          Image.asset(widget.data["image"], height: 400, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(
            widget.data["title"],
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            widget.data["description"],
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            widget.data["price"],
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown[700], fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ٍسكر :", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Radio<String>(
                value: "مظبوط",
                groupValue: color,
                onChanged: (String? val) {
                  setState(() => color = val);
                },
              ),
              Text("مظبوط", style: TextStyle(fontSize: 16)),
              SizedBox(width: 20),
              Radio<String>(
                value: "زياده",
                groupValue: color,
                onChanged: (String? val) {
                  setState(() => color = val);
                },
              ),
              Text("زياده", style: TextStyle(fontSize: 16)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("ٍحجم", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Radio<String>(
                value: "صغير",
                groupValue: size,
                onChanged: (String? val) {
                  setState(() => size = val);
                },
              ),
              Text("وسط", style: TextStyle(fontSize: 16)),
              //SizedBox(width: 20),
              Radio<String>(
                value: "وسط",
                groupValue: size,
                onChanged: (String? val) {
                  setState(() => size = val);
                },
              ),
              Text("وسط", style: TextStyle(fontSize: 16)),
              //SizedBox(width: 20),
              Radio<String>(
                value: "كبير",
                groupValue: size,
                onChanged: (String? val) {
                  setState(() => size = val);
                },
              ),
              Text("كبير", style: TextStyle(fontSize: 16)),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            child: MaterialButton(
              onPressed: () {},
              padding: EdgeInsets.all(15),
              height: 50,
              color: Colors.black,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50), // Add border radius
              ),
              child: Text("اطلب", style: TextStyle(fontSize: 20)),
            ),
          )
        ],
      ),
    );
  }
}
