import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VoiceEngine {
  final SpeechToText _stt = SpeechToText();
  final FlutterTts _tts = FlutterTts();

  bool isReady = false;

  Future<void> init() async {
    isReady = await _stt.initialize();
    await _tts.setLanguage("en-US");
    await _tts.setSpeechRate(0.5);
  }

  Future<String> listen() async {
    if (!isReady) return "Voice not ready";

    String result = "";

    await _stt.listen(
      onResult: (val) {
        result = val.recognizedWords;
      },
    );

    await Future.delayed(const Duration(seconds: 4));
    _stt.stop();

    return result;
  }

  Future<void> speak(String text) async {
    await _tts.speak(text);
  }
}
