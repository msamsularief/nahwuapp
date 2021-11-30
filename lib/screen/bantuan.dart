import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Mainbantuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.green, Colors.blue])),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.green[50]),
          ),
          Container(
            child: Center(
              child: Text(
                'Aplikasi nahwu Al-jurumiyah \n\n\n 1. menu nahwu: \n\n klik menu SEARCH NAHWU lalu tulis huruf arab yang inggin di cari jenis huruf (jika keyboar masih latin setting keyboar huruf arab ) nanti hasilnya akan tampil di kolom yang di sediakan \n\n\n 2. menu about \n\n\n di menu ini user akan melihat profil developer dan version aplikasi \n\n\n 3. menu help \n\n di menu help user bisa melihat fingsi dari menu-menu yang tersedia\n\n\n 4. menu exit \n\n user dapat keluar dari aplikasi nahwu ini ',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
