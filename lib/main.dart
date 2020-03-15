import 'dart:ffi';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo App Version 2.0.0',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
// int _counter = 0;
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int saveCounter;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    }
    void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if(_counter>0)
      {
        _counter--;
      }
      else{
        _counter = _counter;
      }
    });
    }
  void _resetCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter = 0;
    });
    
  }
  void _saveCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      saveCounter =_counter;
    });
    
  }
void _loadCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter = saveCounter;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var scaffold = Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),
          ),
          body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '\n      Flutter Counter App Version 2.0.0 \n\nYou have pushed the button this many times:',
                ),
                Text(
                  '\n$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
          Expanded(
            child: Center(
              child: new FloatingActionButton.extended(
                onPressed: _incrementCounter,
                label: Text('Count'),
                tooltip: 'Increment',
                icon: Icon(Icons.add),
                ),
              ),
            ),
            Expanded(
            child: Center(
              child: new FloatingActionButton.extended(
                onPressed: _saveCounter,
                label: Text('Save Value'),
                tooltip: 'Save',
                icon: Icon(Icons.save),
                ),
              ),
            ),
            Expanded(
            child: Center(
              child: new FloatingActionButton.extended(
                onPressed: _loadCounter,
                label: Text('Load Value'),
                tooltip: 'Load',
                icon: Icon(Icons.rate_review),
                ),
              ),
            ),
            Expanded(
            child: Center(
              child: new FloatingActionButton.extended(
                onPressed: _decrementCounter,
                label: Text('Decrease Count'),
                tooltip: 'Decrement',
                icon: Icon(Icons.remove),
                ),
              ),
            ),
            Expanded(
              child:Center(
                child: new FloatingActionButton.extended(
                  onPressed: () async {
                final ConfirmAction action = await _asyncConfirmDialog(context);
                if(action == ConfirmAction.OK)
                {
                  _resetCounter();
                }
                else{
                  _counter = _counter;
                }
                  },
                  label: Text('Reset Counter'),
                  tooltip: 'reset',
                  icon: Icon(Icons.refresh),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return scaffold;      
  }
}

enum ConfirmAction { CANCEL, OK }
 
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reset Counter?'),
        content: const Text(
            'This will reset your Counter to 0.'),
        actions: <Widget>[
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: const Text('OK'),
            onPressed:  () {
              Navigator.of(context).pop(ConfirmAction.OK);
              
            },
          )
        ],
      );
    },
  );
}