import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/WebServices/apiClient.dart';
import 'package:flutter_boilerplate/WebServices/apiRequest.dart';
import 'package:flutter_boilerplate/constants/routesStrings.dart';
import 'package:flutter_boilerplate/tests/testModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.root,
      routes: {Routes.root: (context) => MyHomePage(title: "title")},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  getData() async {
    final url = Uri.parse("https://reqres.in/api/users/2");
    final request = ApiRequest(url);
    final response = await ApiClient.getData<TestModel>(
        request, (json) => TestModel.fromJson(json));
    if (response?.error != null) {
      print(response?.error);
    } else {
      final testModel = response?.data;
      print(testModel);
    }
  }
}
