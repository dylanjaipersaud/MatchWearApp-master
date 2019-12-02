import 'package:flutter/material.dart';
import 'package:match_test/userProfileData.dart';

class ProductInfoBuilder extends StatefulWidget {
  final Item item;
  final List<Item> bundleItems;

  ProductInfoBuilder({Key key, @required this.item, @required this.bundleItems})
      : super(key: key);

  @override
  _ProductInfoBuilderState createState() => _ProductInfoBuilderState();
}

class _ProductInfoBuilderState extends State<ProductInfoBuilder> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Info'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                    child: Image.asset(
                  widget.item.imagePath,
                  fit: BoxFit.fitHeight,
                ))),
            Center(
              child: Text(
                widget.item.name,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 11.0),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text(
                '${'\t' * 3}${widget.item.description}',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            _twoButtons(widget.item),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text('Items Inside Package:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            widget.bundleItems.length != 0
                ? ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.bundleItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      Item item = widget.bundleItems[index];
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(item.imagePath),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item.name,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _twoButtons(item),
                          ),
                        ],
                      );
                    },
                  )
                : Container(
                    height: 0.0,
                    width: 0.0,
                  ),
          ],
        ),
      ),
    );
  }

  Widget _twoButtons(Item item) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Container(
              height: 30.0,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              child: Center(
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            onTap: () {
              Item pass = Item.overloader(item.name, item.price);
              pass.setImage(item.imagePath);

              UserData.shoppingCart.add(pass);

              // setState(() {
              //   _shoppingCartLength = UserData.shoppingCart.length;
              // });
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text(
                    '${item.name} has been added to your shopping list!'),
              ));
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: GestureDetector(
              child: Container(
                height: 30.0,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(width: 2.0, color: Colors.blue),
                ),
                child: Center(
                  child: Text(
                    'Add to Wishlist',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              onTap: () {
                UserData.wishList.add(item);
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text(
                    '${item.name} has been added to your Wishlist!',
                    style: TextStyle(),
                  ),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      UserData.wishList.removeLast();
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text(
                          '${item.name} has been removed from your Wishlist.',
                          style: TextStyle(),
                        ),
                      ));
                    },
                  ),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
