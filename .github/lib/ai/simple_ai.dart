class SimpleAI {
  String reply(String input) {
    input = input.toLowerCase();

    if (input.contains("hello")) {
      return "Hello Sir, I am JARVIS.";
    }

    if (input.contains("btc")) {
      return "Bitcoin analysis module is not fully connected yet.";
    }

    if (input.contains("who are you")) {
      return "I am JARVIS, your AI assistant.";
    }

    return "Command received: $input";
  }
}
