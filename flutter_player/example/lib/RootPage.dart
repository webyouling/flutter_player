import 'package:flutter/material.dart';
import 'package:flutter_player/bms_video_player.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var viewPlayerController;

  @override
  Widget build(BuildContext context) {
    var x = 0.0;
    var y = 0.0;
    var width = 400;
    var height = width * 9.0 / 16.0;

    BmsVideoPlayer videoPlayer = new BmsVideoPlayer(
        onCreated: onViewPlayerCreated);
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(child: videoPlayer, height: height),
            Expanded(
              child: Container(
                color: Colors.amberAccent,
                child: Text(
                  'GUSDUYFUWQHERFOHUASDNFIUYHSDFHNUIDFASJFIYHSDIFHSIJDFHUIASHFUISDYFAISHDFJDSKFJDSFHJKSDFHIUSDHFKDSFDJSFKLADJSFHIDSOUYFAIHFIDSYFIASHFKSDHFISODYFHIDASDYFSKJDFKOHSADIFJSKDFHI',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onViewPlayerCreated(viewPlayerController) {
    this.viewPlayerController = viewPlayerController;
    this.viewPlayerController.loadUrl(
        "https://apissources.bamasoso.com/video/rvz3YaO8Gbxq/0e5fdab9c4935093877390e6db94443c.mp4");
  }
}
