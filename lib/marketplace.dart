import 'package:flutter/material.dart';
import 'package:match_test/checkout.dart';
import 'package:match_test/main.dart';
import 'package:match_test/productInfoPage.dart';
import 'package:match_test/userProfileData.dart';
import 'package:match_test/Products/womensProducts.dart';

class MarketPlace extends StatefulWidget {
  @override
  _MarketPlaceState createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  static final trending = [
    WomenProduct.womensBundles[15],
    WomenProduct.womensBundles[16],
    WomenProduct.womensBundles[17],
    WomenProduct.womensBundles[18],
    WomenProduct.womensBundles[19]
  ];

  int _shoppingCartLength;
  static final tabs = [
    'Men\'s Bundles',
    'Women\'s Bundles',
    'Unisex Bundles',
    'Men',
    'Women',
    'Unisex'
  ];
  String selected;
  //TODO: IMPLEMENT TAB VIEW IN SHOP
  @override
  void initState() {
    super.initState();
    _shoppingCartLength = UserData.shoppingCart.length;
    selected = tabs[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        centerTitle: true,
        title: Text('Market Place',
            style: TextStyle(
              color: Colors.black87,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "Roberto")),
        backgroundColor: Colors.yellow[400],
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(top: 5.0, right: 20.0),
              child: Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 15.0),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.black87,
                      size: 30.0,
                    ),
                  ),
                  Container(
                    height: 20.0,
                    width: 20.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      //foregroundColor: Colors.white,
                      child: Text(
                        '${UserData.shoppingCart.length}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Checkout())),
          ),
        ],
      ),
      drawer: navDrawer(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //TRENDING PAGE
            Padding(
              padding: EdgeInsets.only(left: 15.0, top: 8.0, bottom: 8.0),
              child: Text(
                'Trending',
                textAlign: TextAlign.start,
                softWrap: true,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roberto",
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 125.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                shrinkWrap: false,
                itemBuilder: (BuildContext context, int index) {
                  return horizontalItemContainer(
                      trending[index].toItem(), trending[index].items);
                },
              ),
            ),
            //MAIN MARKETPLACE
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 15.0, bottom: 8.0),
              child: Text(
                'Shop',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roberto",
                  color: Colors.black,
                ),
              ),
            ),
            // ListView(
            //   children: <Widget>[
            //     GestureDetector(
            //       child: Text('Men\'s Bundles')
            //     ),
            //   ],
            // ),
            GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: (180.0 / 300.0),
              children: <Widget>[
                for (int i = 0; i < WomenProduct.womensBundles.length; i++)
                  verticalItemContainer(WomenProduct.toItemList()[i],
                      WomenProduct.womensBundles[i].items),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget horizontalItemContainer(Item item, List<Item> bundleItems) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: GestureDetector(
        child: Container(
          width: 250.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
//            gradient: LinearGradient(
//              begin: Alignment.centerLeft,
//              end: Alignment.centerRight,
//              stops: [0,1],
//              colors:
//                [
//                  Colors.pinkAccent,
//                  Colors.white,
//                ]
//            ),
          color: Colors.white70,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 2,
                    )
                  ),
                ),
                height: 125.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0)),
                  child: Image.asset(
                    item.imagePath,
                    height: 125.0,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      item.name,
                      style: TextStyle(fontSize: 40.0,
                      fontFamily: "Acme",

                      ),

                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 80.0),
                      child: Text(
                        '\$${item.price}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Roberto",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductInfoBuilder(
                        item: item,
                        bundleItems: bundleItems,
                      )));
        },
      ),
    );
  }

  Widget verticalItemContainer(Item item, List<Item> bundleItems) {
    return Container(
      width: 180.0,
      height: 300.0,
      margin: EdgeInsets.all(10.0),
      child: GestureDetector(
        child: Container(
          width: 180.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(color: Colors.black, width: 4),
            color: Colors.white70,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black, width: 3),
//                ),
                constraints: BoxConstraints(
                  maxHeight: 200.0,
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                padding: EdgeInsets.only(top: 4),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10.0),
                child: Center(
                  child: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roberto",
                    ),
                  ),
                ),
              ),
              Center(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 22.0, right: 5.0),
                    child: Text(
                      '\$${item.price}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductInfoBuilder(
                        item: item,
                        bundleItems: bundleItems,
                      )));
        },
      ),
    );
  }
}
