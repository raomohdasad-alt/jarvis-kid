import 'package:flutter/material.dart';
import 'voice/voice_engine.dart';
import 'ai/simple_ai.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  final VoiceEngine voice = VoiceEngine();
  final SimpleAI ai = SimpleAI();

  String status = "Tap mic to speak";

  @override
  void initState() {
    super.initState();
    voice.init();
  }

  void startListening() async {
    setState(() => status = "Listening...");

    String text = await voice.listen();

    setState(() => status = "You said: $text");

    String response = ai.reply(text);

    await voice.speak(response);

    setState(() => status = response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("JARVIS VOICE")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              status,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: startListening,
              child: const Text("🎤 Speak to JARVIS"),
            )
          ],
        ),
      ),
    );
  }
}
