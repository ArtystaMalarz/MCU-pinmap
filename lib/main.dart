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
        "podstawowe rozwiązanie dla większości porjektów",
        "uno.png",
        "unopins.png"));
    items.add(Product("Arduino Leonardo", "Leonardo", "Arduino_Leonardo.png",
        "leonardo_pin.png"));
    items.add(Product("ESP8266", "Compact and usefull", "esp8266.png",
        "ESP-01-ESP8266-pin.png"));
    items.add(Product("Node MCU", "Wifi module with 10 GPIO adn 4MB flash",
        "nodemcu.png", "ESP8266-NodeMCU-pin.png"));
    items.add(Product("Wemos D1 mini", "3.3V Wifi module", "WeMos-D1-mini.png",
        "ESP8266-WeMos-D1-Mini-pinout.png"));
    return items;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Pinmap dla Arduino'),
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
                    width: 400, height: 325, fit: BoxFit.fill),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //Text(this.item.name,
                            Text("Wyprowadzenie pinów Arduino UNO",
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
                Image.asset("p/" + item.image),
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

/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quality management',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: "QMS"));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('My Page!'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Dostępne narzędzia'),
            ),
            ListTile(
              title: const Text('Raport 8D'),
              onTap: () {
                // Update the state of the app
                body:
                Center(child: Icon(Icons.email));
                title:
                const Text('First Route');
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class kalkulator extends StatefulWidget {
  const kalkulator({super.key});

  @override
  State<kalkulator> createState() => _kalkulatorState();
}

class _kalkulatorState extends State<kalkulator> {
  final _biggerFont = const TextStyle(fontSize: 18);
  final _wynik = "aaaa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // NEW from here ...
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Open route'),
        ),
      ),
    );
  }
}
*/
