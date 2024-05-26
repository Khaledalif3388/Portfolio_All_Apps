import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home: About(),
    debugShowCheckedModeBanner: false,
  ));
}

//stless
class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/Assets/images/BG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 30.0, left: 30),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(radius: 40, backgroundImage: AssetImage("lib/Assets/images/MY PHOTO.jpg"),),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Md. Khaled Hasan", style: TextStyle(fontSize: 25, color: Colors.white , fontFamily: "Roboto"),),
                      Text("Web Developer", style: TextStyle(fontSize: 14,color: Colors.white70,fontFamily: "Robotor"),)
                    ],
                  )
                ],
              ),
              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.school, size: 30,color: Colors.teal,),
                          SizedBox(width: 15,),
                          Text("B.sc in CSE", style: TextStyle(fontSize: 18,color: Colors.white70,fontFamily: "Robotor"),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.note_add_rounded, size: 30,color: Colors.teal,),
                          SizedBox(width: 15,),
                          Text("Android Portfolio App", style: TextStyle(fontSize: 18,color:Colors.white70,fontFamily: "Robotor"),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_pin, size: 30,color: Colors.teal,),
                          SizedBox(width: 15,),
                          Text("Dhaka, Savar", style: TextStyle(fontSize: 18,color: Colors.white70,fontFamily: "Robotor"),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.email, size: 30,color: Colors.teal,),
                          SizedBox(width: 15,),
                          Text("khaledalif3388@gmail.com", style: TextStyle(fontSize: 18,color: Colors.white70,fontFamily: "Robotor"),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.phone, size: 30,color: Colors.teal,),
                          SizedBox(width: 15,),
                          Text("+8801811249599", style: TextStyle(fontSize: 18,color: Colors.white70,fontFamily: "Robotor"),),
                        ],
                      ),
                  
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text("I'm Khaled Hasan, a passionate learner with a strong academic background.Currently I am pursuing a Bachelor degree in Computer Science and Engineering at Daffodil International University. I am consistent in learning and achieved some significant growth in skill development and maintained good CGPA.", style: TextStyle(fontSize: 14,color: Colors.grey,fontFamily: "Robotor"),),
              ),
              SizedBox(height: 60,),
              Text("Created By Md. Khaled Hasan", style: TextStyle(fontSize: 13,color: Colors.teal,fontFamily: "Robotor"),),
            ],
          ),
        ),
      ),
    );
  }
}
