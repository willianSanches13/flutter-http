import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;
import 'data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DataModel> model = [];
  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http get request'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ExpansionTile(
              title: Text(model[index].name),
              children: [Text(model[index].price.toString())],
            ),
          );
        },
        itemCount: model.length,
      ),
    );
  }

  Future<void> getData() async {
    Uri url = Uri.http('localhost:3000', '/product');
    http.Response res = await http.get(url);
    print(res.body);
    List<dynamic> body = cnv.jsonDecode(res.body);
    model = body.map((dynamic item) => DataModel.fromJson(item)).toList();
    setState(() {});
  }
}
