import 'package:app/components/badge.dart';
import 'package:app/constants/palette.dart';
import 'package:app/models/user/users_view_model.dart';
import 'package:app/pages/profile_setttings_screen.dart';
import 'package:app/pages/register_screen.dart';
import 'package:app/pages/signin_screen.dart';
import 'package:app/services/users_service.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  UsersService usersService = UsersService();
  UsersViewModel? user;

  bool isPending = true;
  bool isLoggedIn = false;

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString("userid");

    if (id != null) {
      UsersViewModel result = await usersService.getUserDetails(id);
      setState(() {
        user = result;
        isLoggedIn = true;
        isPending = false;
      });
      return;
    }

    setState(() {
      user = null;
      isPending = false;
      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkLoginStatus();
    return isPending
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(10),
            child: user == null
                ? Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()));
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                child: Text("Üye Ol"),
                              ))),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const SignInScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                child: Text(
                                  "Giriş Yap",
                                  style: TextStyle(color: HexColor(primary)),
                                ),
                              )))
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: const Offset(-3, 3),
                                              color: HexColor(dark),
                                              blurRadius: 5)
                                        ],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(user!.image))),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(user!.name,
                                          style: const TextStyle(fontSize: 20)),
                                      Row(
                                        children: [
                                          Text(user!.email),
                                          Icon(
                                            !user!.emailConfirmStatus
                                                ? Icons.not_interested_rounded
                                                : Icons.verified_user_rounded,
                                            color: !user!.emailConfirmStatus
                                                ? Colors.red
                                                : Colors.green,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileSettingsScreen()));
                                },
                                child: Icon(
                                  Icons.settings,
                                  size: 30,
                                  color: HexColor(dark),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Evcil Hayvanlarım",
                                  style: TextStyle(
                                      color: HexColor(dark), fontSize: 16)),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Row(
                                    children: [
                                      Icon(Icons.add),
                                      SizedBox(width: 4),
                                      Text(
                                        "Ekle",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: user!.pets.length,
                                itemBuilder: (context, index) => Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Row(
                                          children: [
                                            const CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  "lib/assets/images/doggo.jpg"),
                                              radius: 24,
                                            ),
                                            const SizedBox(width: 14),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          user!
                                                              .pets[index].name,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      14)),
                                                      MyCustomBadge(
                                                          size: "xs",
                                                          text: user!
                                                              .pets[index]
                                                              .brand,
                                                          outlined: true,
                                                          color: Colors.white,
                                                          borderColor:
                                                              HexColor(primary))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                          )
                        ])));
  }
}
