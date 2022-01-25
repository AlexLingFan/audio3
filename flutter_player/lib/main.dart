import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_player/video/video_demo1.dart';
import 'package:flutter_player/video/video_demo2.dart';
import 'package:flutter_player/video/video_player_page.dart';
import 'music/home_page.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
  ///设置状态栏背景色为透明色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemUiOverlayStyle systemUiOverlayStyle =
  const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'fijkplayer_skin demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      /// 视频播放器
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellowAccent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 80),
              MyButton(
                text: "完整例子（综艺/影视剧集、播放速度、锁屏、亮度）",
                cb: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const VideoDemo1(),
                    ),
                  );
                },
              ),
              MyButton(
                text: "精简例子、锁屏、亮度、流速",
                cb: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const VideoDemo2(),
                    ),
                  );
                },
              ),
              MyButton(
                text: "FijkPlayer",
                cb: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const VideoPlayerPage(),
                    ),
                  );
                },
              ),
              MyButton(
                text: "音乐殿堂",
                cb: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 100),
              Container(
                color: Colors.lightGreen,
                width: 200,
                height: 100,
              )
            ],
          ),
        )
    );
  }
}

class MyButton extends StatelessWidget {
  Function cb;
  String text;
  MyButton({
    Key? key,
    required this.cb,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: () => cb(),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
