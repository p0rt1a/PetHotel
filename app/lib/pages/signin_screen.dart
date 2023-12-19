import 'package:app/constants/palette.dart';
import 'package:app/models/auth/login_model.dart';
import 'package:app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  AuthService authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? errorMessage;
  bool isPending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Giriş Yap"),
        ),
        backgroundColor: HexColor(background),
        body: isPending
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      errorMessage ?? "",
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    SizedBox(height: errorMessage != "" ? 20 : 0),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "E-posta"),
                    ),
                    const SizedBox(height: 20),
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
                          LoginModel model = LoginModel(
                              email: emailController.text,
                              password: passwordController.text);
                          setState(() {
                            isPending = true;
                          });
                          Response response = await authService.login(model);
                          if (response.statusCode == 200) {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString("access-token", response.body);
                            Map<String, dynamic> decodedToken =
                                JwtDecoder.decode(response.body);
                            prefs.setString("userid", decodedToken["sub"]);
                            if (!context.mounted) return;
                            Navigator.pop(context);
                          } else {
                            setState(() {
                              isPending = false;
                              errorMessage = response.body;
                            });
                          }

                          emailController.text = "";
                          passwordController.text = "";
                        },
                        child: const Text("Giriş Yap"))
                  ],
                ),
              ));
  }
}
