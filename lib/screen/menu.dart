import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nahwu/screen/bantuan.dart';
import 'package:nahwu/screen/nahwu.dart';
import 'package:nahwu/screen/tentang.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class MyMenu extends StatelessWidget {
  const MyMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[];
        },
        body: Stack(
          children: <Widget>[
            SizedBox(
              height: 160,
              child: AppBar(
                title: const Text('Ilmu Nahwu Al-Jurumiyah',
                    style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white)),
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[Colors.green, Colors.blue])),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.black26),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Card(
                child: _buildBody(context),
                margin: const EdgeInsets.fromLTRB(16, 8, 16, 329),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                clipBehavior: Clip.antiAlias,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Card(
                color: Colors.greenAccent,
                child: _buildCenter(),
                margin: const EdgeInsets.fromLTRB(16, 410, 17, 260),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                clipBehavior: Clip.antiAlias,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Card(
                color: Colors.green[50],
                child: _buildfooter(),
                margin: const EdgeInsets.fromLTRB(16, 460, 16, 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildBody(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          const Align(
            alignment: Alignment.topCenter,
            child: Text("MENU UTAMA",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900)),
          ),
          GridView.count(
            crossAxisCount: 2,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 160.0,
                    width: 160.0,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(189, 183, 107, 1),
                        border: Border.all()),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.transparent,
                            elevation: 0.0,
                            margin: const EdgeInsets.all(34.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainNahwu()));
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(
                                      height: 70.0,
                                      width: 82.0,
                                      child: Image.asset(
                                        'assets/image/nahwu3.png',
                                        height: 92.0,
                                      )),
                                  const Text("Nahwu",
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w900)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 160.0,
                    width: 160.0,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(189, 183, 107, 1),
                        border: Border.all()),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.transparent,
                            elevation: 0.0,
                            margin: EdgeInsets.all(34.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Mainbantuan()));
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                      color: Colors.transparent,
                                      height: 70.0,
                                      width: 82.0,
                                      child: Image.asset(
                                        'assets/image/help1.png',
                                        height: 92.0,
                                      )),
                                  const Text(
                                    "Help",
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 160.0,
                    width: 160.0,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(189, 183, 107, 1),
                        border: Border.all()),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.transparent,
                            elevation: 0.0,
                            margin: EdgeInsets.all(34.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Maintentang()));
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                      height: 70.0,
                                      width: 82.0,
                                      child: Image.asset(
                                        'assets/image/about1.png',
                                        height: 92.0,
                                      )),
                                  Container(
                                    child: Text(
                                      "About",
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 160.0,
                    width: 160.0,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(189, 183, 107, 1),
                        border: Border.all()),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.transparent,
                            elevation: 0.0,
                            margin: EdgeInsets.all(34.0),
                            child: InkWell(
                              onTap: () {
                                SystemNavigator.pop();
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                      height: 70.0,
                                      width: 82.0,
                                      child: Image.asset(
                                        'assets/image/keluar3.png',
                                        height: 92.0,
                                      )),
                                  Container(
                                    child: Text("Exit",
                                        style: new TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w900)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildCenter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 420.0,
            width: 420.0,
            child: Text('Rajinlah membaca membuka jendela dunia',
                style: new TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w900,
                )),
          ),
        ],
      ),
    );
  }
}

_buildfooter() {
  return CarouselSlider(
    items: [
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            'assets/image/footer.jpg',
            height: 98.0,
          )),
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/image/images.png')),
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/image/fotter.png')),
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/image/ju3.png', height: 118.0)),
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/image/ju1.png'))
    ],

    //Slider Container properties
    options: CarouselOptions(
      autoPlay: true,
    ),
  );
}
