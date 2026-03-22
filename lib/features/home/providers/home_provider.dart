import 'package:flutter_riverpod/flutter_riverpod.dart';

final welcomeTextProvider = Provider<String>((ref) {
  return 'Welcome to the Shop App!';
});
