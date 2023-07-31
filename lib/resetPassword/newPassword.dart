import 'package:amazshop/resetPassword/codeResetPAssword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import '../start/Signin.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({Key? key});

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
          title: Text("AmazShop"),

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
  final password=TextEditingController();
  final password2=TextEditingController();

  bool _obscurePassword = true; // État initial de l'obfuscation du mot de passe

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const SizedBox(height: 70,),
          const Text("Nouveau mot de passe",
            style: TextStyle(
                fontSize: 28,
                fontWeight:FontWeight.bold
            ),),

          const SizedBox(height: 30,),
          const Text("Saisissez votre nouveau mot de passe",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),),

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
          const SizedBox(height: 20,),
          TextFormField(
            controller: password2,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Confirmation',
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
              if(value != password.text){
                return 'Mot de passe pas identique';
              }
              return null;
            },
          ),

          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), // Ajustez la valeur de la première valeur (8 dans cet exemple)
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

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
                String passwordF1 = password.text;
                String passwordF2 = password2.text;

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
                child: Text('Enregistrer',
                  style: TextStyle(color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
