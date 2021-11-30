import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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

class Maintentang extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
  
  
    // TODO: implement build
    return Scaffold(
        appBar:AppBar(
  title: Text('About'),
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
        Colors.green,
        Colors.blue
      ])          
    ),
  ),     
  
),
        body:   Container(
      decoration: BoxDecoration(
         color: Colors.green[50]
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
          children: <Widget>[
     
             Card(
               margin: EdgeInsets.all(21.0),
               child: InkWell(
                 onTap: (){
                     
                 },
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                    Container(
                    child:
                    
                      Image.asset('assets/image/iwan.jpg',width:110.0,height:154.0)
                  ),
                  
                   ],
                 ),
               ),
     ),
      Container(
          color: Colors.transparent,
          alignment: Alignment.center,
      
        child: Text.rich(
          
          TextSpan(
            
 // default text style
            children: [    TextSpan(
                  text: '  Aplikasi yang digunakan untuk menentukan jenis huruf dalam kitab al-jurumiyah dibuat untuk memenuhi tugas akhir Skripsi dengan judul:\n' ,
                  style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
              TextSpan(
                  text: '  APLIKASI KITAB JURUMIYAH BERBASIS ANDORID MENGUNAKAN ALGORITMA BRUTE FORCE \n' ,
                  style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)),
              TextSpan(
                  text: 'oleh:\n', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                  text: 'Iwan Setiawan'+'\n NIM: 2017150087'+'\n Prodi: Teknik Informatika'+'\n Fakultas: Fastikom', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                  text: '\n Pembimbing :'+'\n nahar mardiyantoro m,kom '+'\n m. fuat asnawi m,kom '+'\n version apk: 2.1', style: TextStyle(fontWeight: FontWeight.bold)),
             
            ],
            
            style: TextStyle(color: Colors.black, height: 2)
          ), textAlign: TextAlign.center,
        ),
      )
     
          ],
        ),
            
          )
           )
 ),
    );
  }
}