
import 'package:amazshop/start/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo2';

    return MaterialApp(
      title: appTitle,
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
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
        ),
        title: Text("Inscription"),
        actions: <Widget>[
          Row(
            children: [
              Text("Connexion", style: TextStyle(color: Colors.white)), // Ajout du texte "Login"
              IconButton(
                onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Login()),
                  );},
                icon: Icon(Icons.person_add_alt),
              ),
            ],
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            gradient: LinearGradient(colors: [Color(0xFF8A2387), Colors.pink]),
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

  final nom= TextEditingController();
  final prenom=TextEditingController();
  final email=TextEditingController();
  final numero=TextEditingController();
  final password=TextEditingController();

  bool _obscurePassword = true; // État initial de l'obfuscation du mot de passe


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
            const Text("Inscrivez-vous",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight:FontWeight.bold
              ),),

            const SizedBox(height: 10,),
            const Text("Inscription pour un compte AmazShop",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),),

          const SizedBox(height: 30,),
          TextFormField(
            controller: nom,
            decoration: const InputDecoration(
              labelText: 'Nom',
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
                Icons.person,
                color: Color(0xFF8A2387),
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nom obligatoire';
              }
              return null;
            },
          ),

          const SizedBox(height: 10,),
          TextFormField(
            controller: prenom,
            decoration: const InputDecoration(
              labelText: 'Prénom',
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
                Icons.person_add_alt,
                color: Color(0xFF8A2387),
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Prénom obligatoire';
              }
              return null;
            },
          ),

          const SizedBox(height: 10,),
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

          const SizedBox(height: 10,),
          TextFormField(
            controller: numero,
            decoration: const InputDecoration(
              labelText: 'Numéro',
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
                Icons.numbers_outlined,
                color: Color(0xFF8A2387),
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Numéro obligatoire';
              }
              return null;
            },
          ),

          const SizedBox(height: 10,),
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
                    
          const SizedBox(height: 50,),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
                String nom1 = nom.text;
                String prenom1 = prenom.text;
                String email1 = email.text;
                String numero1 = numero.text;
                String password1 = password.text;

                print("//////////////");
                print(nom1);
                print(prenom1);
                print(email1);
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
                child: Text('Inscription',
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
