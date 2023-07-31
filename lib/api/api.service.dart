import 'dart:convert';
import 'package:amazshop/api/keys.dart';
import 'package:amazshop/aws/aws.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import 'dart:math';
import 'dart:convert';
import 'dart:convert';
import 'package:encrypt/encrypt.dart';

import 'encrypte.dart';


class ApiService {



  Future postDataTransaksi() async {
    try {
      //String key="iTKYdufxnpUr1VEJsoSNZKJp2EE-vcmbU1j28A11QI4=";

      String res1 = 'massil98@live.fr';
      String res2 = 'massil98';

      String encryptedRes1 = Encrypt.encryptData(res1,Encrypt.getKey(),Encrypt.getIv());
      String encryptedRes2 = Encrypt.encryptData(res2,Encrypt.getKey(),Encrypt.getIv());

      String encryptedRes3 = Encrypt.decryptData(encryptedRes1,Encrypt.getKey(),Encrypt.getIv());


      http.Response response = await http.post(
          Uri.parse(aws.getUrl("dev")+'/login/connexion.php'),
          body: {
            'compteEmail_base': encryptedRes1,
            'comptePassword_base': encryptedRes2,
          },
          headers: {
            'access-token': '---'
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data.containsKey('result')) {
          var result = data['result'];
          if (result is List && result.isNotEmpty) {
            var idCompteCpt = result[0]['idCompte_cpt'];
            print('ID du compte: $idCompteCpt');
          } else {
            print('Aucun résultat ou format de résultat incorrect');
          }
        } else {
          print('Aucun résultat dans la réponse JSON');
        }
      } else {
        print('Échec de la requête. Code de statut: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
  }


  Future<void> postDataToApi() async {
    String apiUrl = aws.getUrl("dev");
   // apiUrl ='$apiUrl/login/connexion.php';
    apiUrl = "http://107.22.131.46/AmazShop/services/login/connexion.php";
String res= 'massil98@live.fr';
    String res2= 'massil98';

    var requestBody = {
      'compteEmail_base': res,
      'comptePassword_base': res2,
    };
    var headers = {
      'Content-Type': 'application/json',
    };

    var jsonBody = jsonEncode(requestBody);

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);

        if (responseData.containsKey('result')) {
          var result = responseData['result'];
          var idCompteCptList = result.map((item) => item['idCompte_cpt']).toList();
          print('idCompte_cpt: $idCompteCptList');
         print( result.toString());

          if (result is List) {
            var idCompteCptList = result.map((item) => item['idCompte_cpt']).toList();
            print('idCompte_cpt: $idCompteCptList');
          } else {
            print('Aucun résultat ou format de résultat incorrect');
          }
        } else {
          print('Aucun résultat dans la réponse JSON');
        }
      } else {
        print('Échec de l\'envoi des données. Code de statut: ${response.statusCode}');
      }
    } catch (e) {
      print('Une erreur s\'est produite lors de l\'envoi des données: $e');
    }
  }
}