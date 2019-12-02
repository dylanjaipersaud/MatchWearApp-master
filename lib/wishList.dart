import 'package:flutter/material.dart';
import 'package:match_test/userProfileData.dart';
import 'package:match_test/main.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _hasWishes;

  @override
  void initState() {
    super.initState();

    UserData.wishList.isEmpty ? _hasWishes = false : _hasWishes = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: navDrawer(context),
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Wish List'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            _hasWishes
                ? Expanded(
                    child: ListView.builder(
                      itemCount: UserData.wishList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            Slidable(
                              key: Key(UserData.wishList[index].name),
                              actionPane: SlidableDrawerActionPane(),
                              actions: <Widget>[
                                IconSlideAction(
                                  caption: 'Shopping Cart',
                                  icon: Icons.add,
                                  color: Colors.grey,
                                  onTap: () {
                                    UserData.shoppingCart.add(UserData.wishList[index]);
                                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                                      content: Text('${UserData.wishList[index].name} has been added to your Shopping List'),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () {
                                          UserData.shoppingCart.removeLast();
                                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                                            content: Text('${UserData.wishList[index].name} has been removed from your Shopping List'),
                                          ));
                                        },
                                      ),
                                    ));
                                  },
                                ),
                              ],
                              secondaryActions: <Widget>[
                                IconSlideAction(
                                  caption: 'Delete',
                                  icon: Icons.delete,
                                  color: Colors.red,
                                  onTap: () {
                                    setState(() {
                                      UserData.wishList.removeAt(index);
                                    });

                                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                                      content: Text('${UserData.wishList[index].name} has been removed from your Shopping List'),
                                    ));

                                    if (UserData.wishList.isEmpty)
                                      setState(() {
                                        _hasWishes = false;
                                      });

                                    print(UserData.wishList);
                                  },
                                ),
                              ],
                              child: ListTile(
                                title:
                                    Text(UserData.wishList[index].name),
                                leading: Image.asset(
                                    UserData.wishList[index].imagePath),
                              ),
                            ),
                            index == UserData.wishList.length - 1
                                ? Container(
                                    height: 0,
                                    width: 0,
                                  )
                                : Divider(
                                    color: Colors.grey,
                                    thickness: 2.0,
                                  ),
                          ],
                        );
                      },
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2),
                    child: Center(
                      child: Text(
                        'You Have Nothing in Your Wish List',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
          ],
        ));
  }
}
