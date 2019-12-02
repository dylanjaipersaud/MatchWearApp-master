import 'package:flutter/material.dart';
import 'package:match_test/userProfileData.dart';
import 'package:match_test/wishList.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static int _itemsInCart;

  double _findPrice(List<Item> items) {
    double total = 0.00;

    for (Item item in items) total += item.price;

    return total;
  }

  @override
  void initState() {
    super.initState();
    _itemsInCart = UserData.shoppingCart.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: ListTile(
                title: Text(
                  'Your Shopping Cart',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  '($_itemsInCart Items)',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _itemsInCart == 0
                ? Center(
                    child: Text(
                      'There are no items in your Shopping Cart.',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _itemsInCart,
                    itemBuilder: (BuildContext context, int index) {
                      Item item = UserData.shoppingCart[index];
                      //print(item.imagePath);
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          leading: Image.asset(item.imagePath),
                          title: Text(item.name),
                          trailing: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              Item item = UserData.shoppingCart[index];

                              UserData.shoppingCart.removeAt(index);

                              setState(() {
                                _itemsInCart = UserData.shoppingCart.length;
                              });

                              if (UserData.shoppingCart.length == 0)
                                setState(() {
                                  _itemsInCart = 0;
                                });

                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(
                                    '${item.name} has been removed from your shopping cart.'),
                              ));
                            },
                          ),
                        ),
                      );
                    },
                  ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Total: ',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('\$${_findPrice(UserData.shoppingCart).toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: GestureDetector(
                child: Container(
                  height: 40.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text('Place Your Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  for(Item item in UserData.shoppingCart)
                    UserData.previousPurchases.add(BoughtItem(item.name, item.price, DateTime.now(), orderStatus[0], item.imagePath));

                  UserData.shoppingCart.clear();
                  setState(() {
                    _itemsInCart = 0;
                  });
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('All Items Have Been Checked Out.'),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
