import 'package:envied/envied.dart';
part 'env.g.dart'; // build runner will create this

@Envied(path: '.env') // read .env file
abstract class Env {
  // obfuscate: true -> encrypt the key, make unreadable in binary.
  @EnviedField(varName: 'GEMINI_API_KEY', obfuscate: true)
  static final String geminiApiKey = _Env.geminiApiKey;
}