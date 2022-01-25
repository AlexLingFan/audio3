
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

import 'BGAudioPlayer/BGAudioPlayerDemo.dart';


void main() {
  runApp(
    HomeApp(),
  );
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AudioServiceWidget(child: BGAudioPlayerScreen()),
    );
  }
}