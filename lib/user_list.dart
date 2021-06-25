import 'package:flutter/material.dart';
import 'package:plunes/pop_up.dart';
import 'package:plunes/providers.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  const UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  bool isSelection = false;
  List selectedIndex = [];
  var apiData = [];
  bool loadingState = true;
  apicall() {
    Provider.of<Users>(context, listen: false).getUsers().then((value) {
      apiData = value;
      setState(() {
        loadingState = false;
      });
      print(value);
    });
  }

  @override
  void initState() {
    apicall();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            isSelection
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex.forEach((element) {
                          apiData.removeAt(element);
                        });
                        isSelection = false;
                        selectedIndex = [];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  )
                : Container(),
            Spacer(),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.30,
                child: RaisedButton(
                  child: new Text(
                    'PopUp',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    Dialogs.feedback(context);
                  },
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: loadingState
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: apiData.length,
                      itemBuilder: (_, i) => GestureDetector(
                            onTap: () {},
                            child: GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  isSelection = true;
                                  selectedIndex.add(i);
                                });
                              },
                              onTap: () {
                                setState(() {
                                  isSelection
                                      ? selectedIndex.contains(i)
                                          ? selectedIndex.remove(i)
                                          : selectedIndex.add(i)
                                      : () {};
                                  if (selectedIndex.isEmpty) {
                                    isSelection = false;
                                  }
                                });
                              },
                              child: Container(
                                child: Card(
                                  color: selectedIndex.contains(i)
                                      ? Colors.blueGrey[300]
                                      : Colors.white,
                                  elevation: 1,
                                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: Container(
                                    width: selectedIndex.contains(i)
                                        ? mq.size.width * 0.66
                                        : mq.size.width * 0.6,
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      children: <Widget>[
                                        Text(apiData[i]['name']),
                                        Text(apiData[i]['username']),
                                        Text(apiData[i]['email']),
                                        Text(apiData[i]['phone']),
                                        Text(apiData[i]['website']),
                                        Text(apiData[i]['username'])
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
              ));
  }
}
