import 'dart:convert';

import 'package:dio/dio.dart';

class SongClient{
  Dio dioClient = Dio();

  getSongsFromTunes() async{
    try{
      String iTunesUrl = "https://itunes.apple.com/search?term=Juice + WRLD&limit=25";
     var res =  await dioClient.get(iTunesUrl);
      Map<String, dynamic> songsMap = jsonDecode(res.data);
return songsMap;
     
    }
    // ignore: empty_catches
    catch(error){
    }
  }
}