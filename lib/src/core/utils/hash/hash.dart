import 'package:encrypt/encrypt.dart';

class Hash {
  static const String _kKeyGenString = "6ftJKc1SYW6dCpz6HBDfxyC2GGRSByL6";
  static final _kKey = Key.fromUtf8(_kKeyGenString);
  static final _kIv = IV.fromUtf8("6ftJKc1SYW6dCpz6");
  static final _encryptAgent = Encrypter(AES(_kKey));

  static String makeHash(String planeText) => _encryptAgent.encrypt(planeText, iv: _kIv).base64;
  static String getPlain(String hash) => _encryptAgent.decrypt(Encrypted.fromBase64(hash), iv: _kIv);
}