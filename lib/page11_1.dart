import 'package:flutter/material.dart';

class Page11_1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('机票页面1'),
      ),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key}):super(key:key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  //控制动画显示状态变量
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        //添加Opacity动画
        child: Image.asset('flight_images/bjq.jpeg',
          package: 'flutter_package_flight')
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          //控制动画显示状态
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: "显示隐藏",
        child: new Icon(Icons.flip),
      ),
    );
  }
}