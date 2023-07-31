import 'package:amazshop/resetPassword/newPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import '../start/Signin.dart';


class codeResetPassword extends StatelessWidget {
  const codeResetPassword({Key? key});

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
  final code = List.generate(6, (index) => TextEditingController());
  final focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var i = 0; i < 6; i++) {
      code[i].dispose();
      focusNodes[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 70,),
          Align(
            alignment: Alignment.center,
            child: const Text(
              "Confirmez votre identité",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30,),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Saisissez votre code reçu par e-mail",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),

          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (index) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TextFormField(
                    controller: code[index],
                    focusNode: focusNodes[index],
                    textAlign: TextAlign.center, // Centrer le texte
                    decoration: const InputDecoration(
                      labelText: '',
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
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (value) {
                      if (value.length == 1) {
                        focusNodes[index].unfocus();
                        if (index < 5) {
                          FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                        }
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatoire';
                      }
                      return null;
                    },
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 50,),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
                String codeValue = code.map((controller) => controller.text).join();
                if(codeValue == "123456"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  NewPassword()),
                  );
                }else {

                }
                // Utilisez la valeur du code pour la validation ou le traitement ultérieur
              }
            },
            child: Container(
              alignment: Alignment.topCenter,
              width: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF8A2387), Colors.pink],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Suivant',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
