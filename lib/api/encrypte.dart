
import 'dart:convert';
import 'dart:math';
import 'package:encrypt/encrypt.dart';

class Encrypt {
  static  String key="j2zvbEj7tBVoUB8hKegFGbn5Blg2oByJA-Wz9bSGbt0=";
  static String iv="OxMxBpu7V-wmehYL6t0xAg==";
  static String getKey() {
    return key;
  }
  static String getIv() {
    return iv;
  }
  static String generateRandomKey() {
    final random = Random.secure();
    final keyBytes = List.generate(32, (index) => random.nextInt(256));
    return base64Url.encode(keyBytes);
  }

  static String generateRandomIV() {
    final random = Random.secure();
    final ivBytes = List.generate(16, (index) => random.nextInt(256));
    return base64Url.encode(ivBytes);
  }

  static String encryptData(String data, String key, String iv) {
    final encrypter = Encrypter(AES(Key.fromBase64(key), mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(data, iv: IV.fromBase64(iv));
    return encrypted.base64;
  }

  static String decryptData(String encryptedData, String key, String iv) {
    final encrypter = Encrypter(AES(Key.fromBase64(key), mode: AESMode.cbc));
    final encrypted = Encrypted.fromBase64(encryptedData);
    final decrypted = encrypter.decrypt(encrypted, iv: IV.fromBase64(iv));
    return decrypted;
  }


}