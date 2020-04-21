import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Live Score'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('scores').snapshots(),
        builder: (context, snapshot)
        {
          if (!snapshot.hasData) return Text('Loading Data...');
          if (snapshot.hasError) return Text('Error occured');
          if (snapshot.data.documents.length > 0) {
            return Column(
              children: <Widget>[
                Text(snapshot.data.documents[0].data['TeamOne'].toString()),
                Text(snapshot.data.documents[0].data['TeamTwo'].toString()),
                Text(snapshot.data.documents[0].data['overs'].toString()),
                Text(snapshot.data.documents[0].data['runs'].toString()),
                Text(snapshot.data.documents[0].data['toWin'].toString()),
                Text(snapshot.data.documents[0].data['wickets'].toString()),
              ],
            );
          } else {
            return Text('No data');
          }
        },
      ));

  }
}
