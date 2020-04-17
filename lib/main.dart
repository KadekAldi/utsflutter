import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './about_me.dart';
import './dashboard.dart';
import './product_list.dart';
import './add_new_item.dart';
import './cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Kasir Sederhana",
      theme: ThemeData(
          primarySwatch: Colors.brown,
          accentColor: Colors.red,
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
      home: Home(),
      routes: <String, WidgetBuilder>{
        'satu' : (BuildContext context) => new Home(),
        'dua' : (BuildContext context) => new MyProfil(),
      },
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Cart> _carts = [
    

  ];

  void _openModal(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_){
          return AddNewItem(_addNewItem);
        });

  }

  void _addNewItem(String title, String nama, double harga, int qty) {
    final newItem = Cart(id: DateTime.now().toString(), title: title, nama: nama, harga: harga, qty: qty);
    setState(() {
      _carts.add(newItem);
    });
  }

  void _resetCarts() {
    setState(() {
      _carts.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.attach_money),
          
          onPressed: () => _openModal(context)
      ),
     
      appBar: AppBar(
        leading: new IconButton(
          icon: Icon(Icons.person_outline,color: Colors.white,),
          onPressed: (){
            Navigator.pushNamed(context, 'dua');
          },
        ),
        title: Text("App Kasir Sederhana"),
        actions: <Widget>[
          FlatButton(child: Icon(Icons.backspace, color: Colors.white,),
           onPressed: () => _resetCarts(),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Dashboard(_carts),
            ProductList(_carts),
          ],
        ),
      ),
    );
  }
}


