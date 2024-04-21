class SongModel{
  late String artistName;
  late String trackName;
  late String artworkUrl100;
  late String previewUrl;
bool isSongPlaying = false;
  SongModel(
    {
      required this.artistName,
      required this.previewUrl,
      required this.artworkUrl100,
      required this.trackName,
    }
  );
  SongModel.fromJSON(Map<String, dynamic> jsonMap){
    artistName = jsonMap['artistName'] ?? "not avl";
    trackName = jsonMap['trackName'] ?? "not avl";
    artworkUrl100 = jsonMap['artworkUrl100'] ?? "not avl";
    previewUrl = jsonMap['previewUrl'] ?? "not avl";

  }
  

  

}