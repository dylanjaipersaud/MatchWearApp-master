import 'package:flutter/material.dart';
import 'package:match_test/Products/womensProducts.dart';

class UserData {
  static String name;
  static int loyalty;

  static List<Item> wishList = [
    // Item.overloader('${WomenProduct.fresh.bundleName}1', 12.99),
    // Item.overloader('${WomenProduct.fresh.bundleName}2', 12.99),
    // Item.overloader('${WomenProduct.fresh.bundleName}3', 12.99),
    // Item.overloader('${WomenProduct.fresh.bundleName}4', 12.99),
    // Item.overloader('${WomenProduct.fresh.bundleName}5', 12.99),
  ];

  static List<BoughtItem> previousPurchases = [
    // BoughtItem('Fresh', 36.22, DateTime.now(), orderStatus[0]),
    // BoughtItem('Poopy', 36.22, DateTime.now(), orderStatus[1]),
    // BoughtItem('Poppy', 36.22, DateTime.now(), orderStatus[2]),
    // BoughtItem('SHitty', 36.22, DateTime.now(), orderStatus[0]),
    // BoughtItem('sdajdn', 36.22, DateTime.now(), orderStatus[1]),
    // BoughtItem('Poppy', 36.22, DateTime.now(), orderStatus[2]),
    // BoughtItem('Poppy', 36.22, DateTime.now(), orderStatus[2]),
    // BoughtItem('Poppy', 36.22, DateTime.now(), orderStatus[2]),
  ];

  static List<Item> shoppingCart = [];

  UserData(String name, int loyalty) {
    UserData.name = name;
    UserData.loyalty = loyalty;
  }
}

class Item {
  String name, imagePath = 'assets/images/rawr.png', description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Convallis tellus id interdum velit laoreet id donec. Vitae sapien pellentesque habitant morbi tristique senectus et netus et. Amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet. Sit amet mattis vulputate enim. Orci nulla pellentesque dignissim enim sit.';
  double price;

  void setImage(String imagePath){
    this.imagePath = imagePath;
  }

  void setDescription(String description){
    this.description = description;
  }

  Item() {
    this.name = 'Product Name';
    this.price = 0.00;
  }

  Item.overloader(String name, double price) {
    this.name = name;
    this.price = price;
  }

  Item.overloaderWithImage(String name, double price, String imagePath){
    this.name = name;
    this.price = price;
    this.imagePath = imagePath;
  }

  construct(String name, double price) {
    this.name = name;
    this.price = price;
  }
}

class BoughtItem extends Item {
  DateTime deliveredDate;
  String deliveryStatus;

  BoughtItem(String name, double price, DateTime deliveredDate,
      String deliveryStatus, String imagePath) {
    super.construct(name, price);
    super.imagePath = imagePath;
    this.deliveredDate = deliveredDate;
    this.deliveryStatus = deliveryStatus;
  }
}

class Bundle{
  double price;
  String description, bundleName, imagePath;

  var items;

  Bundle(this.bundleName, this.price, this.items, this.description, this.imagePath);

  Item toItem(){
    Item item = Item.overloader(bundleName, price);
    item.setImage(imagePath);
    item.setDescription(description);
    //print(item.imagePath);
    return item;
  }

  static List<Item> toItemList(List<Bundle> bundles) {
    List<Item> changed = [];

    for(Bundle bundle in bundles){
      changed.add(bundle.toItem());
    }

    return changed;
  }
}

final orderStatus = ["Order Recieved", "In Transit", "Delivered"];

Widget unfulfilledItemBox(String name, String imagePath, String status) {
  Text text;

  switch (status) {
    case 'Order Recieved':
      text = Text(
        status,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.red,
        ),
      );
      break;
    case 'In Transit':
      text = Text(
        status,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.yellow,
        ),
      );
      break;
    case 'Delivered':
      text = Text(
        status,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.green,
        ),
      );
      break;
  }

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      leading: Image.asset(imagePath),
      title: Text(
        name,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: text,
    ),
  );
}