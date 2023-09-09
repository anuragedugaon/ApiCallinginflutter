import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'datamodel.dart';

void main() {
  runApp( MyHomePage());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserdataBase? userdataBase;

  final data = {
    'user_id': '3',
  };

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('https://manage.chaalakya.com/api/c-enquiry-list-client');

    final headers = {
      'Content-Type': 'application/json', // Set the Content-Type header
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data), // Convert the data to JSON format
    );

    if (response.statusCode == 200) {
      setState(() {
        userdataBase = userdataBaseFromJson(response.body);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('API Request Example'),
        ),
        body: ListView.builder(
          itemCount: userdataBase?.data.length ?? 0,
          itemBuilder: (context, index) {
            final datum = userdataBase?.data[index];
            return ListTile(
              title: Text('Service Name: ${datum?.serviceName}',style: TextStyle(fontSize: 22,color: Colors.cyan),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Event Date: ${datum?.eventDate}',style: TextStyle(fontSize: 20,color: Colors.cyan)),
                  for (final customerDetail in datum?.customerDetails ?? [])
                    ListTile(
                      title: Text('Name: ${customerDetail.name}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      subtitle: Text('Phone: ${customerDetail.phone}',style: TextStyle(fontSize: 15)),
                    ),
                ],
              ),
            );
          },
        ),

      ),
    );
  }
}