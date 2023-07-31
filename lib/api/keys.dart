
import 'dart:convert';
import 'dart:math';
import 'package:encrypt/encrypt.dart';

class Keys {
  static String key = "iTKYdufxnpUr1VEJsoSNZKJp2EE-vcmbU1j28A11QI4=";

  static String getKey() {
    return key;
  }
  static String encryptData(String data, String key) {
    final iv = IV.fromLength(16); // Utilisez un vecteur d'initialisation (IV) pour renforcer la sécurité
    final encrypter = Encrypter(AES(Key.fromBase64(key), mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(data, iv: iv);
    return encrypted.base64; // Vous pouvez également retourner encrypted.bytes pour obtenir les données chiffrées sous forme d'une liste d'octets
  }

  static String decryptData(String encryptedData, String key) {
    final encrypted = Encrypted.fromBase64(encryptedData);
    final iv = IV.fromLength(16); // Assurez-vous d'utiliser le même vecteur d'initialisation (IV) que celui utilisé pour le chiffrement
    final encrypter = Encrypter(AES(Key.fromBase64(key), mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }
  static String generateRandomKey() {
    final random = Random.secure();
    final keyBytes = List.generate(32, (index) => random.nextInt(256));
    return base64Url.encode(keyBytes);
  }



}



