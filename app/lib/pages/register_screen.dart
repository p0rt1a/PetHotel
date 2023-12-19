import 'package:app/constants/palette.dart';
import 'package:app/models/auth/register_model.dart';
import 'package:app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthService authService = AuthService();

  bool isPending = false;
  String? errorMessage;

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(background),
      appBar: AppBar(
        title: const Text("Üyelik Oluştur"),
      ),
      body: isPending
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(errorMessage ?? "",
                          style:
                              const TextStyle(color: Colors.red, fontSize: 14)),
                      const SizedBox(height: 10),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "İsim"),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: surnameController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Soyisim"),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "E-posta Adresi"),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Şifre"),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () async {
                            RegisterModel model = RegisterModel(
                                name: nameController.text,
                                surname: surnameController.text,
                                email: emailController.text,
                                password: passwordController.text);
                            setState(() {
                              isPending = true;
                            });
                            Response response =
                                await authService.register(model);
                            if (response.statusCode == 200) {
                              if (!context.mounted) return;
                              Navigator.pop(context);
                            } else {
                              setState(() {
                                errorMessage = response.body;
                                isPending = false;
                              });
                            }

                            nameController.text = "";
                            surnameController.text = "";
                            emailController.text = "";
                            cityController.text = "";
                            passwordController.text = "";
                          },
                          child: const Text("Kayıt Oluştur"))
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
