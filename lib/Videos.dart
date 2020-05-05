import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:ramonestube/services/Api.dart';
import 'model/Video.dart';

class Videos extends StatefulWidget {
  String pesquisa;
  Videos(this.pesquisa);

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {

  _listarVideos(String pesquisa){
    Api api = Api();
    return api.pesquisar(pesquisa);
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context,snapshot){
        switch(snapshot.connectionState ){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            print('resultado ='+snapshot. toString());
            if(snapshot.hasData){
              return ListView.separated(
                  itemBuilder: (context,index){
                    List<Video> videos = snapshot.data;
                    Video video = videos[index];
                    return GestureDetector(
                      onTap: (){
                        FlutterYoutube.playYoutubeVideoById(
                          apiKey: CHAVE_YOUTUBE_API,
                          videoId: video.id,
                          autoPlay: true,
                          fullScreen: true,
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit:BoxFit.cover,
                                    image: NetworkImage(video.imagem)
                                )
                            ),
                          ),
                          ListTile(
                            title: Text(video.titulo),
                            subtitle: Text(video.canal),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context,index)=>Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  itemCount: snapshot.data.length
              );
            }else{
              return Center(
                  child: Text("Nenhum dado a ser exibido!")
              );
            }
            break;
        }
      },
    );
  }
}
