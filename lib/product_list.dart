import 'package:flutter/material.dart';
import 'cart.dart';


class ProductList extends StatelessWidget {
  final List<Cart> carts;

  ProductList(this.carts);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6000,
        child: carts.isEmpty ? Column(children: <Widget>[
        Text(
          "Aplikasi Kasir Sederhana. untuk memulai tekan icon dibawah",
          style: Theme.of(context).textTheme.title,
    
        ),
      ],
      ):



      ListView.builder(
        itemBuilder: (context, index) {
          double total_harga = carts[index].harga * carts[index].qty;
          return Card(
            child: Row(
              children: <Widget>[
                //kotak
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50, horizontal: 0),
                  padding: EdgeInsets.all(5),
                ),

                //output ne
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(carts[index].nama,
                      style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ), 
                    ),
            
                    Text(carts[index].title,
                      style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ), ),
                     
                    Text('Harga : Rp.' + carts[index].harga.toStringAsFixed(0) , style: TextStyle(fontSize: 20, color: Colors.grey),),
                   Text('Total   : Rp.' + total_harga.toStringAsFixed(0), style: TextStyle(fontSize: 20, color: Colors.grey),),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: carts.length,
      ),
    );
  }
}