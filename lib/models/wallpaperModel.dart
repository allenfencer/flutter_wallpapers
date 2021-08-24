class WallpaperModel{
  String photographer_url;
  SrcModel src;

  WallpaperModel({this.src,this.photographer_url});

  factory WallpaperModel.fromJson(Map<String,dynamic>json){
    return WallpaperModel(
      src: json['src'],
      photographer_url: json['photographer_url'],
    );
  }
}

class SrcModel{
  String original;
  String small;
  String portrait;

  SrcModel({this.original,this.portrait,this.small});

  factory SrcModel.fromJson(Map<String,dynamic> json){
    return SrcModel(
      original: json['original'],
      small: json['small'],
      portrait: json['portrait']
    );
  }
}