import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_lab4_2/anim.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'HTTP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  httpGet() async {
    try {
      var response = await http.post(Uri.parse('https://json.flutter.su/echo'),
          body: {'name': 'My Name', 'num': '10'},
          headers: {'Accept': 'application/json'});
      print("Reasponse status: ${response.statusCode}");
      print("Reasponse body: ${response.body}");
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(children: [
        TextButton(
          onPressed: httpGet,
          // {
          //   http
          //       .get(Uri.parse('https://json.flutter.su/echo'))
          //       .then((response) {
          //     print("Reasponse status: ${response.statusCode}");
          //     print("Reasponse body: ${response.body}");
          //   }).catchError((error) {
          //     print(error);
          //   });
          // },
          child: Text('HTTP'),
        ),
        SizedBox(
          height: 30,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return AnimClass();
              }));
            },
            child: Text('Animmation'))
      ])), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
