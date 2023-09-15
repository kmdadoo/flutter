import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:ex54_sound2/audio_player_manager.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ex54 Sound Play 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 페이지메니져 객체 준비
  late AudioPlayerManager manager;

  @override
  void initState() {
    super.initState();
    // 페이지메니져 객체 생성
    manager = AudioPlayerManager();
    manager.init();
  }

  @override
  void dispose() {
    manager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const SizedBox(height: 100,),
            _progressBar(),
            const SizedBox(height: 20,),
            _playButton(),
            const SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('노래 1',
                                    style: TextStyle(fontSize: 24)),
                  onPressed: () {
                    manager.player.setAsset('assets/sounds/background1.mp3');
                  },
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  child: const Text('노래 2',
                                    style: TextStyle(fontSize: 24)),
                  onPressed: () {
                    manager.player.setAsset('assets/sounds/background2.mp3');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  StreamBuilder<DurationState> _progressBar() {
    return StreamBuilder<DurationState>(
      stream: manager.durationState,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: manager.player.seek,
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
        );
      },
    );
  }

  StreamBuilder<PlayerState> _playButton() {
    return StreamBuilder<PlayerState>(
      stream: manager.player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 32.0,
            height: 32.0,
            child: const CircularProgressIndicator(),
          );
        } else if (playing != true) {
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: manager.player.play,
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 32.0,
            onPressed: manager.player.pause,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 32.0,
            onPressed: () =>
                manager.player.seek(Duration.zero),
          );
        }
      },
    );
  }

}
