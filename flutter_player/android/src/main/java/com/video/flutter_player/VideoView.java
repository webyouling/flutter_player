package com.video.flutter_player;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;

import com.video.flutter_player.player.JzvdStd;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.plugin.platform.PlatformView;

import static io.flutter.plugin.common.MethodChannel.MethodCallHandler;

public class VideoView implements PlatformView, MethodCallHandler {
    private View bmsVideo;
    private JzvdStd jzvdStd;
    private final MethodChannel methodChannel;
    private final Registrar registrar;

    VideoView(Context context, int viewId, Object args, Registrar registrar) {
        this.registrar = registrar;
        bmsVideo = LayoutInflater.from(registrar.activity()).inflate(R.layout.layout_videoview, null);
        jzvdStd = bmsVideo.findViewById(R.id.videoplayer);
        this.methodChannel = new MethodChannel(registrar.messenger(), "bms_video_player_" + viewId);
        this.methodChannel.setMethodCallHandler(this);
    }

    @Override
    public View getView() {
        return bmsVideo;
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        switch (methodCall.method) {
            case "loadUrl":
                String url = methodCall.arguments.toString();
                getBmsVideo(url);
                break;
            default:
                result.notImplemented();
        }

    }

    @Override
    public void dispose() {
    }

    private void getBmsVideo(String url) {
        jzvdStd.setUp(url
                , "饺子快长大");
    }

    @Override
    public void onInputConnectionLocked() {

    }

    @Override
    public void onInputConnectionUnlocked() {

    }
}