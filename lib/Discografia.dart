import 'package:flutter/material.dart';
class Discografia extends StatefulWidget {
  @override
  _DiscografiaState createState() => _DiscografiaState();
}

class _DiscografiaState extends State<Discografia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(35),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset("imagens/ramones.png"),
                Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 30),
                  child: Text("Álbuns de estúdio:"+
                      "\n* 1976 - Ramones "+
                      "\n* 1977 - Leave Home"+
                      "\n* 1977 - Rocket to Russia"+
                      "\n* 1978 - Road to Ruin"+
                      "\n* 1980 - End of the Century"+
                      "\n* 1981 - Pleasant Dreams"+
                      "\n* 1983 - Subterranean Jungle"+
                      "\n* 1984 - Too Tough to Die"+
                      "\n* 1986 - Animal Boy "+
                      "\n* 1987 - Halfway to Sanity"+
                      "\n* 1989 - Brain Drain"+
                      "\n* 1992 - Mondo Bizarro "+
                      "\n* 1993 - Acid Eaters "+
                      "\n* 1995 - Adios Amigos"+
                      "\n\n* Álbuns ao Vivo"+
                      "\n1979 - It's Alive"+
                      "\n1991 - Loco live"+
                      "\n1996 - Greatest Hits Live"+
                      "\n1997 - We're Outta Here!",
                    style: TextStyle(
                        fontSize: 17
                    ),),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
