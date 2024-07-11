import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

final Uri dialnumber = Uri(scheme: 'tel', path: '+001234567890');
final Uri mailid = Uri(scheme: 'mailto', path: 'placeholder@gmail.com');
const linkedin = 'https://www.linkedin.com/placeholder';
const discord = 'https://discordapp.com/users/placeholder';
const github = 'https://github.com/nehanpnair';
const Color bg = Color(0xff37055d);

Future<void> email() async {
  try {
      await launchUrl(mailid);
  } catch (error) {
    print(error);
  }
}

Future<void> callnumber() async {
  try {
    await launchUrl(dialnumber);
  }
  catch (error) {
    print(error);
  }
}

Future<void> lin() async {
  try {
    await launchUrlString(linkedin);
  }
  catch (error) {
    print(error);
  }
}

Future<void> dis() async {
  try {
    await launchUrlString(discord);
  }
  catch (error) {
    print(error);
  }
}

Future<void> git() async {
  try {
    await launchUrlString(github);
  }
  catch (error) {
    print(error);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: bg,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.deepPurple[100],
                  foregroundImage: AssetImage("images/pfp.png"),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Neha Nair',
                  style: TextStyle(
                    fontFamily: 'Playwrite Ísland',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'CURRENT WORKING POSITION',
                  style: TextStyle(
                    fontFamily: 'PT Sans',
                    fontSize: 20.0,
                    color: Colors.purple[100],
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                  width: 200.0,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 45.0, vertical: 25.0),
                  child: ListTile(
                    minLeadingWidth: 20.5,
                    onTap: callnumber,
                    leading: Icon(
                      Icons.phone,
                      size: 25.0,
                      color: Colors.purple[600],
                    ),
                    title: Text(
                      ' +00 123 456 7890',
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                        fontSize: 20.0,
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(45.0, 5.0, 45.0, 30.0),
                  child: ListTile(
                    minLeadingWidth: 20.5,
                    onTap: email,
                    leading: Icon(
                      Icons.mail,
                      size: 28.0,
                      color: Colors.purple[600],
                    ),
                    title: Text(
                      'placeholder@gmail.com',
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      onPressed: lin,
                      icon: FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.white,
                        size: 55.0,
                      ),
                    ),
                    IconButton(
                      onPressed: dis,
                      icon: FaIcon(
                        FontAwesomeIcons.discord,
                        color: Colors.white,
                        size: 55.0,
                      ),
                    ),
                    IconButton(
                      onPressed: git,
                      icon: FaIcon(
                        FontAwesomeIcons.squareGithub,
                        color: Colors.white,
                        size: 55.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
