import 'package:flutter/material.dart';

void main() => runApp(TestApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TestHomePage(
        title: '测试demo',
      ),
      routes: {
        'new_page':(context)=>new NewPage(tip: '1231',)
      },
    );
  }
}

class TestHomePage extends StatefulWidget {
  TestHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TestHomePage createState() => _TestHomePage();
}

class _TestHomePage extends State<TestHomePage> {
  int num = 0;

  void addNum() {
    setState(() {
      num++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('点击了'),
            new Text(
              '$num次',
              style: Theme.of(context).textTheme.display1,
            ),
            MaterialButton(onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context){
                return new NewPage(tip: '新界面',);
              },fullscreenDialog: false));
//            Navigator.pushNamed(context, 'new_page');
            }, child: new Text('打开新页面'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNum,
        tooltip: 'add',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class NewPage extends StatelessWidget {

  final String tip;

  const NewPage({Key key, this.tip}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新页面'),
      ),
      body: new Center(
        child: new Text(tip,style: new TextStyle(color: Colors.blueAccent,fontSize: 16),),
      ),
    );
  }
}
