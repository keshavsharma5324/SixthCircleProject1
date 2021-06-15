import 'package:firstproject/drawer.dart';
import 'package:firstproject/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  Choice _selectedChoice = choices[0];

  void _incrementCounter() {
    setState(() {
 
      _counter++;
    });
  }
  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        /*leading: IconButton(
          icon: Icon(Icons.dehaze_rounded),
          onPressed: () => Scaffold.of(context).openDrawer(),   // will open the Widget defined in property 'drawer'
        ),*/
        actions: [
          PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title)
                  );
                }).toList();
              },
            ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Center(
      
        child: Column(
       
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.pages),
        label: 'Page2',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.pages),
        label: 'Page2',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.pages),
        label: 'Page2',
      ),
    ],onTap: (index){  
  Navigator.push(  
    context,  
    MaterialPageRoute(builder: (context) => SecondScreen()),  
  );  
}  ,
  ), 
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
 
  const Choice(title: 'setting', icon: Icons.settings),
  const Choice(title: 'Walk away', icon: Icons.logout),
];

  