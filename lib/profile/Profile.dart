import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import '../start/Signin.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key});

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
          actions: <Widget>[
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signin()),
                    );
                  },
                  icon: Icon(Icons.person),
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
          const Text("Profile",
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
