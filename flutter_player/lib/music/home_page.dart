import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// we will need some variables
  /// 是否播放 --at the begining we are not playing any song
  bool playing = false;

  /// the main state of the play button icon
  IconData playBtn = Icons.play_arrow;

  /// Now let's start by creating our music player
  ///  first let's declare some object
  late AudioPlayer _player;
  late AudioCache cache;

  /// 播放起始位置
  Duration position = const Duration();

  /// 播放时长
  Duration musicLength = const Duration();

  /// custom slider
  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  // let's create the seek function that will allow us to go to a certain position of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  // Now let's initialize our player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //now let's handle the audioplayer time

    /// this function will allow you to get the music duration
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    /// this function will allow us to move the cursor of the slider while we are playing the song
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  @override
  void dispose() async{
    // 退出屏幕时
    await _player.release(); // 不需要时手动释放
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // 全屏宽度和高度
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("音乐殿堂")),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.lightBlue,
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 21.0,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Let's add some text title
                    const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                            "Listen to your favorite Music",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w400,
                            )
                        )
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    // 映射当前所播放歌曲歌名
                    const Center(
                      child: Text(
                        "夕阳之歌",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 时间进度条
                            Container(
                              // width: 500.0,
                                width: width,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Container(
                                        width: width - 120,
                                        child: slider(),
                                      ),
                                      Text(
                                          "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                          )
                                      )
                                    ]
                                )
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                // 切换上一曲
                                IconButton(
                                  iconSize: 45.0,
                                  color: Colors.blue,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.skip_previous,
                                  ),
                                ),

                                // 播放/暂停
                                IconButton(
                                  iconSize: 62.0,
                                  color: Colors.blue[800],
                                  onPressed: () async{
                                    if (!playing) {
                                      //now let's play the song
                                      // 播放音乐，此处添加歌曲
                                      /*
                                  cache.play("Stargazer.mp3");
                                  setState(() {
                                    playBtn = Icons.pause;
                                    playing = true;
                                  });
                                   */

                                      int result = await _player.play("https://sharefs.ali.kugou.com/202201081023/dbdf953ac68b7576c4fa239e9b763254/KGTX/CLTX001/55dc3f4c5f00cd747f6b8dbb7e07dd4c.mp3");
                                      // int result = await _player.play("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3");
                                      if (result == 1) {
                                        // success
                                        setState(() {
                                          playBtn = Icons.pause;
                                          playing = true;
                                        });
                                        if (kDebugMode) {
                                          print("play success");
                                        }
                                      } else {
                                        print('play failed');
                                      }

                                    } else {
                                      int result = await _player.pause();
                                      if (result == 1) {
                                        // success
                                        _player.pause();
                                        setState(() {
                                          playBtn = Icons.play_arrow;
                                          playing = false;
                                        });
                                        if (kDebugMode) {
                                          print("pause success");
                                        }
                                        // print('pause success');
                                      } else {
                                        print('pause failed');
                                      }
                                      /*
                                    _player.pause();
                                  setState(() {
                                    playBtn = Icons.play_arrow;
                                    playing = false;
                                  });
                                   */
                                    }
                                  },
                                  icon: Icon(
                                    playBtn,
                                  ),
                                ),

                                // 切换下一曲
                                IconButton(
                                  iconSize: 45.0,
                                  color: Colors.blue,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.skip_next,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 66,
                child: Container(
                  width: 280.0,
                  height: 280.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/music_gradient.jpg"),
                      )),
                )
              )
            ],
          )
        ),
      ),
    );
  }
}