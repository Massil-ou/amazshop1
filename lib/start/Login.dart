import 'package:amazshop/resetPassword/codeResetPAssword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../api/api.service.dart';
import '../main.dart';
import 'Signin.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 60,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginApp()),
              );
            },
          ),
          title: Text("Connexion"),
          actions: <Widget>[
            Row(
              children: [
                Text("Inscription",
                    style: TextStyle(color: Colors.white)), // Ajout du texte "Login"
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signin()),
                    );
                  },
                  icon: Icon(Icons.person_add_alt),
                ),
              ],
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Color(0xFF8A2387), Colors.pink]),
            ),
          ),
        ),
        body: Center(
          child: Container(
            width: 400.0, // Définir une largeur maximale pour le formulaire
            padding: EdgeInsets.all(16.0),
            child: const MyCustomForm(),
          ),
        ),
        //body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();
  final email=TextEditingController();
  final password=TextEditingController();
  final email2=TextEditingController();
  bool _obscurePassword = true; // État initial de l'obfuscation du mot de passe

 // apiService.postDataToApi();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const SizedBox(height: 20,),
          const Text("Connectez-vous",
            style: TextStyle(
                fontSize: 28,
                fontWeight:FontWeight.bold
            ),),

          const SizedBox(height: 10,),
          const Text("Identifiez vous à votre compte",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),),

          const SizedBox(height: 30,),
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                color: Color(0xFF8A2387), // Couleur du texte
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF8A2387)),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Color(0xFF8A2387),
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email obligatoire';
              }
              return null;
            },
          ),

          const SizedBox(height: 20,),
          TextFormField(
            controller: password,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Mot de passe',
              labelStyle: TextStyle(
                color: Color(0xFF8A2387),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF8A2387)),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              prefixIcon: Icon(
                Icons.password_outlined,
                color: Color(0xFF8A2387),
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Color(0xFF8A2387),
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mot de passe obligatoire';
              }
              return null;
            },
          ),

          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), // Ajustez la valeur de la première valeur (8 dans cet exemple)
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            title: Text("Saisir votre email"),
                            content: TextFormField(
                              controller: email2,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF8A2387)),
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email obligatoire';
                                }
                                return null;
                              },
                            ),
                            actions: [
                              ButtonBar(
                                alignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Fermer le dialogue sans rien faire
                                    },
                                    child: Text(
                                      "Annuler",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (email2.text.length>3) {
                                        String email = email2.text;
                                        print(email);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  codeResetPassword()),
                                        );
                                        //_getBatteryLevel();
                                      }
                                      email2.text= "";
                                    },
                                    child: Text(
                                      "Envoyer",
                                      style: TextStyle(color: Color(0xFF8A2387)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                    );
                  },
                  child:const Text("Mot de passe oublié ?",
                    style: TextStyle(
                        color: Color(0xFFD70303)
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
                ApiService().postDataTransaksi();
                String email1 = email.text;
                String password1 = password.text;
                //_getBatteryLevel();
              }// Ajoutez ici votre code pour gérer le tap du bouton
            },
            child: Container(
              alignment: Alignment.topCenter,
              width: 250,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF8A2387), Colors.pink
                      ])
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Connexion',
                  style: TextStyle(color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10,),
          TextButton(
            onPressed: (){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Signin()),
            );},
            child: const Text(
              "Inscription",
              style: TextStyle(
                fontSize: 20, // Agrandir la taille du texte
                color: Colors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
