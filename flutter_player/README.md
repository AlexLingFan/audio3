# flutter_player

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



fijkplayer 播放器的普通皮肤，主要解决 fijkplayer 自带的皮肤不好看，没有手势拖动快进，快退
fijkplayer_skin只是一款皮肤，并不是播放器，所以 fijkplayer 存在的问题，这里 fijkplayer_skin 一样存在

#待尝试验证
## Flutter SDK要求
sdk >= 2.12.0 支持空安全

## 功能如下

* 手势滑动，快进快退
* 上下滑动（左：屏幕亮度 右：系统音量）
* 视频内剧集切换 （全屏模式下，视频内部切换播放剧集）
* 倍数切换，（全屏模式下，切换倍数）
* 锁定，（锁定UI，防误触）
* 设置视频顶部返回，标题
* 支持部分UI配置显示隐藏


## 其他开源项目

* [Dart-Cms](https://github.com/abcd498936590/Dart-Cms)  =>> Dart-Cms完整项目
* [Dart-Cms-Manage](https://github.com/abcd498936590/Dart-Cms-Manage)   =>> Dart-Cms后台管理系统页面部分
* [Dart-Cms-Flutter](https://github.com/abcd498936590/Dart-Cms-Flutter)  =>> Dart-Cms的安卓客户端，使用flutter开发
* [Dart-Cms-Script](https://github.com/abcd498936590/Dart-Cms-Script)  =>> Dart-Cms插件教程，插件使用，插件开发
* [flutter_eyepetizer](https://github.com/abcd498936590/flutter_eyepetizer)  =>> Flutter + GetX仿开眼视频app


## 使用说明

在使用皮肤之前，你需要查看 fijkplayer 的文档说明，了解如何 fijkplayer [自定义UI](https://fijkplayer.befovy.com/docs/zh/custom-ui.html#gsc.tab=0)


## 安装
> 如果 pub 安装失败或者不能使用，请更换git方式引入

pubspec.yaml
```yaml
dependencies:
  fijkplayer: ${lastes_version}
  fijkplayer_skin: ${lastes_version}
```
或者
```yaml
fijkplayer_skin:
  git:
    url: git@github.com:abcd498936590/fijkplayer_skin.git
```


## 参数说明

_curTabIdx 当前选中的tab索引，_curActiveIdx 当前选中的剧集索引。如果你使用过 react 你一定知道状态提升，父组件托管数据，子组件只负责渲染，这里的 _curTabIdx 和 _curActiveIdx 也是同理，在父组件中可以给多个需要该数据的组件传递。（包括皮肤内部也使用该数据）

videoList 存放视频列表，请参考我的格式，使用 fijkplayer_skin/schema.dart 中的 VideoSourceFormat 格式化数据

onChangeVideo（int curTabIdx, int curActiveIdx） 钩子函数，在播放器内切换剧集会触发该函数，回调参数是最新的 TabIdx 和 ActiveIdx ，用于更新托管在父组件中的 _curTabIdx 和 _curActiveIdx

pageContent 传递的就是当前组件的 context，这里注意，你当前的根组件不要使用 MaterialApp 否则会报错，请使用 Scaffold

showConfig 传递一个接口实例，抽象类 ShowConfigAbs，实现之后传递给皮肤，定制你需要显示的按键（参数如下）

```code
  bool drawerBtn    // 是否显示剧集按钮
  bool nextBtn      // 是否显示下一集按钮
  bool speedBtn     // 是否显示速度按钮
  bool topBar       // 是否显示播放器状态栏（顶部），非系统
  bool lockBtn      // 是否显示锁按钮
  bool autoNext     // 播放完成后是否自动播放下一集，false 播放完成即暂停
  bool bottomPro    // 底部吸底进度条，贴底部，类似开眼视频
  bool stateAuto    // 是否自适应系统状态栏，true 会计算系统状态栏，从而加大 topBar 的高度，避免挡住播放器状态栏
  bool isAutoPlay   // 是否自动开始播放
```

videoFormat json 格式化后的视频数据，使用 VideoSourceFormat 格式化json数据

## 具体例子
完整例子查看VideoDemo1-VideoDemo2



#音乐播放器

#pubspec.yaml
audioplayers: ^0.16.1

