// main.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/Fragment/Blog.dart';
import 'package:provider/provider.dart';
import 'Fragment/personal_info_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Fragment/PersonalProfile.dart';
import 'Fragment/Portfolio.dart';
import 'Fragment/Apps.dart';
import 'Fragment/Skills.dart';
import 'Fragment/Experiences.dart';
import 'Fragment/About.dart';
import 'Fragment/Certificates.dart';
import 'Fragment/login.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PersonalInfoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: ThemeData(
        primaryColor: Colors.black87,
        hintColor: Colors.black87,
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontSize: 20,
            color: Colors.black87,
          ),
          subtitle2: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Md. Khaled Hasan",
            style: Theme.of(context).textTheme.headline6!,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.person, color: Colors.tealAccent),
                text: 'About',
              ),
              Tab(
                icon: Icon(Icons.star, color: Colors.tealAccent),
                text: 'Skills',
              ),
              Tab(
                icon: Icon(Icons.work, color: Colors.tealAccent),
                text: 'Experiences',
              ),
              Tab(
                icon:
                    Icon(Icons.apps_outage_outlined, color: Colors.tealAccent),
                text: 'Apps',
              ),
              Tab(
                icon: Icon(Icons.card_membership, color: Colors.tealAccent),
                text: 'Certificates',
              ),
              Tab(
                icon:
                    Icon(Icons.file_upload_outlined, color: Colors.tealAccent),
                text: 'Upload your Info',
              ),
              Tab(
                icon: Icon(Icons.assignment, color: Colors.tealAccent),
                text: 'Portfolio',
              ),
              Tab(
                icon: Icon(Icons.assignment, color: Colors.tealAccent),
                text: 'Blog',
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.black54,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                  ),
                  child: UserAccountsDrawerHeader(
                    accountName: const Text(
                      "Md. Khaled Hasan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    accountEmail: const Text(
                      "khaled15-14691@diu.edu.bd",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    currentAccountPicture: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("lib/Assets/images/MY PHOTO.jpg",
                      ),
                      
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    // Add logic for Home onTap
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'Gmail',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    launch('https://mail.google.com/mail/u/0/#inbox');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.link,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'LinkedIn',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    launch('https://www.linkedin.com/in/khaled3388/');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.facebook,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'Facebook',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    launch('https://www.facebook.com/mkh.alif.948');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.camera_enhance_outlined,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'Instagram',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    launch('https://www.instagram.com/aal_iff/');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_tree_sharp,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'Github',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    launch('https://github.com/Khaledalif3388');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.note_alt_sharp,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'Get CV',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    launch(
                        'https://drive.google.com/drive/folders/1vw4d22bpsnw93DfWxc4GyyIfVhjW4Pre?usp=sharing');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    // Add logic for Logout onTap
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            About(),
            Skills(),
            Experiences(),
            Apps(),
            Certificates(),
            PersonalProfile(),
            Portfolio(),
            Blog(),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
