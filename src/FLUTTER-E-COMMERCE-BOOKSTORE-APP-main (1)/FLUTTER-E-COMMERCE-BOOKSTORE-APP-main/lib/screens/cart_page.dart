import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_bookstore/screens/constants.dart';
import 'package:e_bookstore/screens/payment_page.dart';
import 'package:e_bookstore/screens/product_page.dart';
import 'package:e_bookstore/services/firebase_services.dart';


import 'package:e_bookstore/widgets/checkout_tab.dart';
import 'package:e_bookstore/widgets/custom_action_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'size_config.dart';

class CartPage extends StatefulWidget {
  final String productId;
  final String price;
  final String points;

  CartPage({this.productId,this.price,this.points});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  FirebaseServices _firebaseServices = FirebaseServices();

  int total=0;
  int points = 0;
  int tot =0;
  ///This function is to calculate total value of the cart
  void _getTotal() async{
    total=0;
    await  _firebaseServices.usersRef.doc(_firebaseServices.getUserId()).collection("Cart").get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((result) {//what to write here so that new documents would be created in other collection
        total += int.parse(result.data()['price']);
      });
      tot = total - points;
      if(total > 0){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => PaymentPage(total: "$total",tot: tot,)));
      }

      return total;
    });

  }

  void _getDiscount() async{
    await  _firebaseServices.usersRef.doc(_firebaseServices.getUserId()).collection("Points").get().then((QuerySnapshot querySnapshot) {
      points = total - points;
      print(points);
      return points;
    });

  }

  void _removeFromCart(String s) {
    _firebaseServices.usersRef
        .doc(_firebaseServices
        .getUserId())
        .collection("Cart")
        .doc(s)
        .delete();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0)),
            height: 90.0,
            width: 150.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () async {
                  await _getDiscount();
                },
                child: Container(
                  height: 90.0,
                  width: 100.0,
                  margin: EdgeInsets.all(
                      2.0
                  ),
                  decoration: BoxDecoration(
                    color: Color(0XFF2a2a4a),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: Alignment.center,
                  child: StreamBuilder(
                    stream: _firebaseServices.usersRef.doc(_firebaseServices.getUserId())
                        .collection("Points")
                        .snapshots(),
                    builder: (context, snapshot) {


                      if (snapshot.connectionState == ConnectionState.active) {

                      }
                      points = snapshot.data.docs.single.data()['points'];

                      return Text(
                        " Redeem $points coins"  ?? null,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0)),
            height: 90.0,
            width: 200.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () async {
                  await _getTotal();
                },
                child: Container(
                  height: 70.0,
                  width: 150.0,
                  margin: EdgeInsets.all(
                      2.0
                  ),
                  decoration: BoxDecoration(
                    color: Color(0XFF2a2a4a),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      ///Fetching items in cart
      body: Container(
        child: Stack(
          children: [
            ///Query to fetch items in firebase
            FutureBuilder<QuerySnapshot>(
              future: _firebaseServices.usersRef
                  .doc(_firebaseServices.getUserId())
                  .collection("Cart")
                  .get(),
              builder: (context, snapshot) {
                ///our data is now  stored in snapshot
                if (snapshot.connectionState == ConnectionState.done && snapshot.data.docs.isNotEmpty) {
                  // Display the data inside a list view
                  return ListView(
                    padding: EdgeInsets.only(
                      top: 108.0,
                      bottom: 12.0,
                    ),
                    children: snapshot.data.docs.map((document) {
                      ///this GestureDetector on tap takes us back to product page of that particular book
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(
                                  productId: document.id,
                                ),
                              ));
                        },
                        child: FutureBuilder(
                          future: _firebaseServices.productsRef
                              .doc(document.id)
                              .get(),
                          builder: (context, productSnap) {
                            if (productSnap.connectionState == ConnectionState.done) {
                              Map _productMap = productSnap.data.data();
                              return Dismissible(
                                key: Key(document.id),
                                direction: DismissDirection.endToStart,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 97,
                                      height: 133,
                                      child: AspectRatio(
                                        aspectRatio: 0.88,
                                        child: Container(
                                          padding: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F6F9),
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          ),
                                          child: Image.network(
                                            "${_productMap['images'][0]}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${_productMap['name']}",
                                          maxLines: 2,
                                          softWrap: true,
                                          overflow: TextOverflow.visible,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "\₹ ${_productMap['price']}",
                                          style: Constants.RText,
                                          maxLines: 1,
                                        ),
                                        ///remove froom cart
                                        GestureDetector(
                                          onTap: () async {
                                            setState(() {
                                              _removeFromCart(document.id);
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 125.0),
                                            child: Container(
                                              alignment:Alignment.topRight,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15.0),
                                              ),
                                              height: 27.0,
                                              width: 80.0,
                                              child: Icon(
                                                Icons.remove_circle,
                                                size: 25.0,
                                                color: Colors.red.withRed(500),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                background: Container(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    color: Color(0XFFFFE6E6),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Icon(Icons.remove_circle)
                                    ],
                                  ),
                                ),
                                onDismissed: (direction) {
                                  setState(() {
                                    _removeFromCart(document.id);
                                  });
                                },
                              );
                            }

                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  );
                }

                ///If cart is empty
                return Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top:60.0,bottom: 20.0),
                            child: Container(
                              alignment: Alignment.center,
                              height:180.0,
                              child: Image(image: AssetImage("assets/images/no_trolley.png"),color: Color(0XFF2a2a4a).withOpacity(0.9),),),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(top:60.0,bottom: 20.0),
                          child: Text("Your Cart Is Empty!",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w800),),
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
            CustomActionBar(
              hasBackArrow: true,
              title: "Cart",
            ),
          ],
        ),
      ),
    );
  }
}
