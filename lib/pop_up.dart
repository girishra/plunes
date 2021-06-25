import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Dialogs extends StatelessWidget {
  //alert dialog of confirmation
  static Future<void> feedback(BuildContext context) {
    if (context == null) {
      return null;
    }

    return showGeneralDialog(
        context: context,
        pageBuilder: (context, anim1, anim2) {},
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.4),
        barrierLabel: '',
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: AlertDialog(
                  contentPadding: EdgeInsets.only(left: 25, right: 25),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  content: Container(
                    height: 500,
                    width: 300,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Thanks for availing service from",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"),
                            backgroundColor: Colors.transparent,
                          ),
                          Center(
                              child: Text(
                            'Dr.Nupur Garg',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Rate Your experience',
                            ),
                          ),
                          Center(
                            child: RatingBar.builder(
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.green,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Leave Your comments',
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            // color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                maxLength: 250,
                                // controller: notes,
                                maxLines: 6,
                                decoration:
                                    InputDecoration.collapsed(hintText: ""),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              child: RaisedButton(
                                child: new Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.green,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                onPressed: () {
                                  //saveIssue();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
        transitionDuration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
