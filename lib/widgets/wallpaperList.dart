import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/image_screen.dart';

class WallpaperList extends StatelessWidget {
  final String imageUrl;
  const WallpaperList({Key key,this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageScreen(imageData: imageUrl,)));
      },
      child: Hero(
        tag: imageUrl,
        child: Container(
          height: 600,
          margin: EdgeInsets.only(left: 5,right: 5),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.network(imageUrl,fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
