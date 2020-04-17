import 'package:flutter/material.dart';
import 'cart.dart';


class Dashboard extends StatelessWidget {
  final List<Cart> _listCart;
  Dashboard(this._listCart);

  int get totalItem {
    return _listCart.fold(0, (sum, item) {
      return sum += item.qty;
    });
  }

  double get totalPrice {
    return _listCart.fold(0, (sum, item) {
      double total_harga = item.qty * item.harga;
      return sum += total_harga;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.all(0),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
        ),
      ),
    );
  }
}