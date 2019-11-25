import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

typedef void BmsVideoPlayerCreatedCallback(BmsVideoPlayerController controller);

class BmsVideoPlayerController {

  MethodChannel _channel;
  
  BmsVideoPlayerController.init(int id) {
    _channel =  new MethodChannel('bms_video_player_$id');
  }

  Future<void> loadUrl(String url) async {
    assert(url != null);
    return _channel.invokeMethod('loadUrl', url);
  }
}

class BmsVideoPlayer extends StatefulWidget {

  final BmsVideoPlayerCreatedCallback onCreated;

  BmsVideoPlayer({
    Key key,
    @required this.onCreated,
  });

  @override
  State<StatefulWidget> createState() => _VideoPlayerState();

}
  
class _VideoPlayerState extends State<BmsVideoPlayer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: nativeView(),
      onHorizontalDragStart: (DragStartDetails details) {
        print("onHorizontalDragStart: ${details.globalPosition}");
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        print("onHorizontalDragUpdate: ${details.globalPosition}");
        print(details.globalPosition);
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        print("onHorizontalDragEnd");
      },
      onTapDown: (TapDownDetails details) {
        print("onTapDown: ${details.globalPosition}");
      },
    );
  }

  nativeView() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'plugins.bms_video_player/view',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return UiKitView(
        viewType: 'plugins.bms_video_player/view',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
  }

  Future<void> onPlatformViewCreated(id) async {
    if (widget.onCreated == null) {
      return;
      }
    
    widget.onCreated(new BmsVideoPlayerController.init(id));
  }
}
