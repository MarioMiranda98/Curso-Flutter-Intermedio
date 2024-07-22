import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _playing = false;
  Duration _songLength = Duration.zero;
  Duration _current = Duration.zero;

  String get songTotalLength => this.printDuration(this._songLength);

  String get currentSecond => this.printDuration(this._current);

  double get songPercent => this._songLength.inSeconds == 0
      ? 0.0
      : (this._current.inSeconds / this._songLength.inSeconds);

  late AnimationController _controller;

  AnimationController get controller => this._controller;

  set controller(AnimationController controller) {
    this._controller = controller;
  }

  bool get playing => this._playing;

  set playing(bool value) {
    this._playing = value;
  }

  Duration get songLength => this._songLength;

  set songLength(Duration value) {
    this._songLength = value;
    notifyListeners();
  }

  Duration get current => this._current;

  set current(Duration value) {
    this._current = value;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
