import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/models/audio_player_model.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _Background(),
          Column(
            children: [
              CustomAppbar(),
              _DiscImageAndSongLength(),
              _TitleAndPlay(),
              Expanded(
                child: _Lyrics(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      height: mq.size.height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.0)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            Color(0XFF33333E),
            Color(0XFF201E28),
          ],
        ),
      ),
    );
  }
}

class _Lyrics extends StatelessWidget {
  final lyrics = getLyrics();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListWheelScrollView(
        physics: BouncingScrollPhysics(),
        itemExtent: 42.0,
        diameterRatio: 1.5,
        children: lyrics
            .map(
              (l) => Text(
                l,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TitleAndPlay extends StatefulWidget {
  const _TitleAndPlay();

  @override
  State<_TitleAndPlay> createState() => _TitleAndPlayState();
}

class _TitleAndPlayState extends State<_TitleAndPlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _firstTime = true;
  final assetAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void open() {
    final audioPlayerModel =
        Provider.of<AudioPlayerModel>(context, listen: false);

    assetAudioPlayer.open(Audio('assets/Breaking-Benjamin-Far-Away.mp3'),
        autoStart: true, showNotification: true);

    assetAudioPlayer.currentPosition.listen((duration) {
      audioPlayerModel.current = duration;
    });

    assetAudioPlayer.current.listen((playingAudio) {
      audioPlayerModel.songLength =
          playingAudio?.audio.duration ?? Duration(seconds: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Far Away',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Text(
                'Breaking Benjamin',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ],
          ),
          Spacer(),
          FloatingActionButton(
              onPressed: () {
                if (audioPlayerModel.playing) {
                  _animationController.reverse();
                  audioPlayerModel.controller.stop();
                } else {
                  _animationController.forward();
                  audioPlayerModel.controller.repeat();
                }

                audioPlayerModel.playing = !audioPlayerModel.playing;

                if (_firstTime) {
                  open();
                  _firstTime = false;
                } else {
                  assetAudioPlayer.playOrPause();
                }
              },
              backgroundColor: Color(0XFFF8CB51),
              elevation: 0,
              highlightElevation: 0,
              child: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: _animationController,
                color: Colors.black,
                size: 28.0,
              )),
        ],
      ),
    );
  }
}

class _DiscImageAndSongLength extends StatelessWidget {
  _DiscImageAndSongLength();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      margin: EdgeInsets.only(top: 70.0),
      child: Row(
        children: [
          _DiscImage(),
          SizedBox(width: 80.0),
          _ProgressBar(),
          SizedBox(width: 20.0),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar();

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    final percentage = audioPlayerModel.songPercent;
    return Container(
      child: Column(
        children: [
          Text(
            audioPlayerModel.songTotalLength,
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          SizedBox(height: 10.0),
          Stack(
            children: [
              Container(
                width: 3.0,
                height: 230.0,
                color: Colors.white.withOpacity(0.1),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3.0,
                  height: 230.0 * percentage,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            audioPlayerModel.currentSecond,
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscImage extends StatelessWidget {
  const _DiscImage();

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    return Container(
      padding: EdgeInsets.all(20.0),
      width: 250.0,
      height: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0XFF484750),
            Color(0XFF1E1C24),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              duration: Duration(seconds: 10),
              infinite: true,
              manualTrigger: true,
              controller: (animationController) =>
                  audioPlayerModel.controller = animationController,
              child: Image(
                image: AssetImage('assets/aurora.jpg'),
              ),
            ),
            Container(
              width: 25.0,
              height: 25.0,
              decoration: BoxDecoration(
                color: Colors.black38,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 18.0,
              height: 18.0,
              decoration: BoxDecoration(
                color: Color(0XFF1C1C25),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
