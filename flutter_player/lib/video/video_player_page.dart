import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({Key? key}) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {

  final FijkPlayer player = FijkPlayer();


  @override
  void initState() {
    super.initState();
    // 配置视频地址
    player.setDataSource(
      "https://qiniu.xiaodengmi.com/a9ac5d86ca3109cb22ed805b1f227074.mp4",
      // "assets/videos/video_play.MP4",
      autoPlay: true
    );
  }

  @override
  Widget build(BuildContext context) {
    // 全屏宽度和高度
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("视频播放器")),
      body: getBody()
    );
  }

  @override
  void dispose() {
    /**
     * 当页面销毁的时候，将视频播放器也销毁
     * 否则，当页面销毁后会继续播放视频！
     */
    super.dispose();
    player.release();
  }

 Widget getBody() {
    return Container(
      child: FijkView(
        color: Colors.white,
        player: player,
      ),
    );
 }
}


