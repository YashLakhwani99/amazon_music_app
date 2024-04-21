import 'dart:async';
import 'package:flutter/material.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isFirstLoadingScreenShow = true;
  // @override
  void initState() {
  
    super.initState();
    Timer(const Duration(seconds: 3), () {
      isFirstLoadingScreenShow = false;
      setState(() {});
    if (isFirstLoadingScreenShow == false){
     Timer(Duration(seconds: 3), (){
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
      Navigator.pushReplacementNamed(context, '/home');
          });
  }});
   
  }

  @override
  Widget build(BuildContext context) {
    return isFirstLoadingScreenShow
        ? SafeArea(
            child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/amazon_music_logo_GIF.png",
                  ),
                  const CircularProgressIndicator()
                ],
              ),
            ),
          ))
        : SafeArea(
            child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Image.asset(
                "assets/image3.png",
              ),
            ),
          ));
  }
}