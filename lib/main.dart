import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Product {
  final String name;
  final String description;
//  final int price;
  final String image;
  final String pinmap;
  Product(this.name, this.description, this.image, this.pinmap);

  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(Product(
        "Arduino UNO",
        "Basic Arduino with 32 kB Flash, 2 kB RAM, 14 digital and 6 analog GPIO ",
        "uno.png",
        "unopins.png"));
    items.add(Product(
        "Arduino Leonardo",
        "Leonardo has 32 kB Flash, 2,5 kB RAM, 20 digital and 12 analog GPIO",
        "Arduino_Leonardo.png",
        "leonardo_pin.png"));
    items.add(Product(
        "ESP8266",
        "3.3V WiFi module with 1MB Flash with 2 GPIO and UART interface",
        "esp8266.png",
        "ESP-01-ESP8266-pin.png"));
    items.add(Product(
        "Node MCU",
        "Wifi module with 4MB Flash 160kB RAM and 10 GPIO",
        "nodemcu.png",
        "ESP8266-NodeMCU-pin.png"));
    items.add(Product("Wemos D1 mini", "Wemos D1 mini has 4MB Flash and 9 GPIO",
        "WeMos-D1-mini.png", "ESP8266-WeMos-D1-Mini-pinout.png"));
    return items;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCU_Pinmap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Pinmap for Arduino'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({key, required this.title}) : super(key: key);
  final String title;
  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("MCU list")),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ProductBox(item: items[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(item: items[index]),
                  ),
                );
              },
            );
          },
        ));
  }
}

class ProductPage extends StatelessWidget {
  ProductPage({key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset("p/" + this.item.pinmap,
                    width: 400, height: 400, fit: BoxFit.contain),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //Text(this.item.name,
                            Text("Pinout diagram for " + this.item.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            //Text(this.item.description),
                            // Text("Price: " + this.item.price.toString()),
                            //  RatingBox(),
                          ],
                        )))
              ]),
        ),
      ),
    );
  }
}

//////////////
class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }

  Widget build(BuildContext context) {
    double _size = 20;
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 1
                ? Icon(
                    Icons.favorite,
                    size: _size,
                  )
                : Icon(
                    Icons.favorite_border,
                    size: _size,
                  )),
            color: Colors.red[500],
            onPressed: _setRatingAsOne,
            iconSize: _size,
          ),
        ),
      ],
    );
  }
}
//////////////////

class ProductBox extends StatelessWidget {
  ProductBox({key, required this.item}) : super(key: key);
  final Product item;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset("p/" + item.image,
                    width: 200, height: 200, fit: BoxFit.contain),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(this.item.description),
                            //     Text("Price: " + this.item.price.toString()),
                            RatingBox(),
                          ],
                        )))
              ]),
        ));
  }
}
