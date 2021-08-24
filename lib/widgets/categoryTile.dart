import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_wallpaper/search_screen.dart';

class CategoryTile extends StatelessWidget {
  final imageTag;
  final imageTitle;
  const CategoryTile({Key key,this.imageTag,this.imageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(query: imageTitle.toString().toLowerCase(),)));
      },
      child: Container(
        width: 180,
        margin: EdgeInsets.symmetric(horizontal: 10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Image.network(imageTag,fit: BoxFit.cover,width: 200,),
            Center(child: Text(imageTitle,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white
            ),),)
          ],
        ),
      ),
    );
  }
}
