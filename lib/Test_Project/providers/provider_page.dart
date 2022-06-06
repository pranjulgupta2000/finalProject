import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test/Test_Project/models/cart_page_model.dart';
import 'package:test/Test_Project/models/categories_model.dart';

class MyProvider extends ChangeNotifier {
  List<CategoriesModle> burgerList = [];
  late CategoriesModle burgerModle;
  getData() async {
    var querySnapshot =
        await FirebaseFirestore.instance.collection('new').get();
    burgerList = querySnapshot.docs
        .map((e) => CategoriesModle.fromJson(e.data()))
        .toList();
  }

  addData(CategoriesModle x) async {
    await FirebaseFirestore.instance.collection('new').add(x.toJSON());
  }

  List<CartModle> cartList = [];
  List<CartModle> newCartList = [];
  late CartModle cartModle;
  void addToCart({
    required String image,
    required String name,
    required int price,
    required int quantity,
  }) {
    cartModle = CartModle(
      image: image,
      name: name,
      price: price,
      quantity: quantity,
    );
    newCartList.add(cartModle);
    cartList = newCartList;
  }

  get throwCartList {
    return cartList;
  }

  int totalprice() {
    int total = 0;
    for (var element in cartList) {
      total += (element.price * element.quantity);
    }
    return total;
  }

  late int deleteIndex;
  void getDeleteIndex(int index) {
    deleteIndex = index;
  }

  void delete() {
    cartList.removeAt(deleteIndex);
    notifyListeners();
  }
}
