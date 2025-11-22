import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MuslimKidsApp());
}

class MuslimKidsApp extends StatelessWidget {
  const MuslimKidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مسلم کڈز',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const TopicsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TopicsPage extends StatefulWidget {
  const TopicsPage({super.key});

  @override
  _TopicsPageState createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  List<dynamic> topics = [];

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    final String response = await rootBundle.loadString('content/urdu.json');
    final data = json.decode(response);
    setState(() {
      topics = data["topics"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("مسلم کڈز"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(topics[index]["title"], textDirection: TextDirection.rtl),
              subtitle: Text(topics[index]["content"], textDirection: TextDirection.rtl),
            ),
          );
        },
      ),
    );
  }
}
