import 'dart:convert';
import 'dart:io';
import '../services/networking.dart';

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late Future<dynamic> response;

  Future<dynamic> loadData() async {
    Networking connection = Networking();

    var result = await connection.serverGet('/Mock');
    if (result.statusCode == 200) {
      return jsonDecode(result.body);
    }
    return [
      {'message': 'error'}
    ];
  }

  @override
  void initState() {
    // TODO: implement initState

    response = loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo App'),
      ),
      body: FutureBuilder<dynamic>(
        future: response,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: List.generate(
                snapshot.data!.length,
                (index) => ListTile(
                  leading: const Icon(Icons.verified),
                  title: Text(snapshot.data![index]["item"]),
                  onTap: () {
                    print(snapshot.data![index]["serial"]);
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error Loading data'),
            );
          } else {
            return const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
