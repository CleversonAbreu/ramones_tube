import 'package:flutter/material.dart';
import 'package:ramonestube/CustomSearchDelegate.dart';
import 'Discografia.dart';
import 'Videos.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual=0;
  String _resultado="";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas=[
      Videos(_resultado),
      Discografia(),
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Colors.grey,
        ),
        backgroundColor: Colors.white,
        title:Image.asset("imagens/ramones_tube.png",
          width: 135,
          height: 45,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(
                  context:context,
                  delegate: CustomSearchDelegate()
              );
              setState(() {
                _resultado=res;
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice){
            setState(() {
              _indiceAtual=indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items:[
            BottomNavigationBarItem(
                title:Text('Vídeos'),
                icon:Icon(Icons.ondemand_video)
            ),BottomNavigationBarItem(
                title:Text('Discografia'),
                icon:Icon(Icons.album)
            ),
          ]
      ),
    );
  }
}
