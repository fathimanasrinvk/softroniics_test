import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softroniics_test/core/constants/colors.dart';
import 'package:softroniics_test/core/constants/text_style.dart';
import 'package:path_provider/path_provider.dart';
import '../../HomePage/view/home_screen.dart';
import '../../bottom_navigation/view/bottomnav_screen.dart';
import '../../registration_page/view/registration_screen.dart';
void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: LoginPage(),));
}

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final namecontroller = TextEditingController();
  final pcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  late SharedPreferences preferences;
  late bool newuser;

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
      body:
      Container(
        height: double.infinity, width: double.infinity,
        color: ColorTheme.secondarycolor,
        child: Stack(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg_image.png"),
                      fit: BoxFit.cover)
              ),
            ),
            Positioned(
                top: 50, left: 60,
                child: Image.asset("assets/images/icon_img.png", height: 140,)),
            Positioned(
                top: 270, left: 90,
                child: Text(
                  "Welcome to GreenHub", style: GlobalTextStyles.mainTittle,)),
            Positioned(
                top: 310, left: 160,
                child: Text("LOGIN", style: GlobalTextStyles.secondTittle,)),
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 370),
              child: Container(
                  height: 350, width: 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorTheme.white,
                  ),
                  child: SingleChildScrollView(
                      child: Center(
                          child: Column(children: [
                            SizedBox(
                              height: size * 40,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size * 35,
                                  right: size * 35,
                                  ),
                              child: TextFormField(
                                controller: namecontroller,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(color: ColorTheme.maincolor),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person_2_outlined,
                                    color: ColorTheme.green,
                                  ),
                                  filled: true,
                                  fillColor: ColorTheme.secondarycolor,
                                  hintText: 'Enter Your name ',
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: size * 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size * 35,
                                  right: size * 35,
                                  top: size * 30),
                              child: TextFormField(
                                controller: pcontroller,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: ColorTheme.green,
                                  ),
                                  filled: true,
                                  fillColor: ColorTheme.secondarycolor,
                                  hintText: 'Enter Your Password',
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: size * 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide.none),
                                ),
                                style: TextStyle(color: ColorTheme.maincolor),
                              ),
                            ),
                            SizedBox(
                              height: size * 40,
                            ),
                            Container(
                              width: size * 250,
                              decoration: BoxDecoration(
                                  color: ColorTheme.maincolor,
                                  borderRadius: BorderRadius.circular(
                                      size * 7)),
                              child: ElevatedButton(
                                onPressed: () async {
                                  SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                                  List<String>? userListJson = preferences
                                      .getStringList('users');
                                  if (userListJson != null &&
                                      userListJson.isNotEmpty) {
                                    List<User> userList = userListJson
                                        .map((userJson) =>
                                        User.fromJson(json.decode(userJson)))
                                        .toList();
                                    String enteredName = namecontroller.text;
                                    String enteredPassword = pcontroller.text;
                                    User? user;
                                    try {
                                      user =
                                          userList.firstWhere((user) =>
                                          user.name == enteredName);
                                    } catch (e) {
                                      user = null;
                                    }
                                    if (user != null &&
                                        user.pword == enteredPassword) {
                                      await _writeName(enteredName);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BottomNavPage()));
                                      namecontroller.text = "";
                                      pcontroller.text = "";
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                              "Username or password is incorrect")));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                "No users registered yet")));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorTheme.maincolor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            7))),
                                child: Text("Login",
                                    style: GlobalTextStyles.buttonText),
                              ),
                            ),
                            SizedBox(height: size * 9),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (context) => RegistrationScreen()));
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Don't have account ?  ",
                                      style: GoogleFonts.lato(
                                          decoration: TextDecoration.none,
                                          fontSize: size * 14,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: " Sign Up",
                                      style: GoogleFonts.lato(
                                          color: Colors.blue,
                                          decoration: TextDecoration.none,
                                          fontSize: size * 15,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ])))
              ),
            )

          ],

        ),
      ),
    );
  }}
Future<File> _getLocalFile() async {
  final directory = await getApplicationDocumentsDirectory();
  return File('${directory.path}/name.txt');
}


Future<void> _writeName(String name) async {
  final file = await _getLocalFile();
  await file.writeAsString(name);
}

Future<String> _readName() async {
  try {
    final file = await _getLocalFile();
    String name = await file.readAsString();
    return name;
  } catch (e) {
    // If encountering an error, return empty string
    return '';
  }
}
