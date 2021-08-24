
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String imageData;
  const ImageScreen({Key key,this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Hero(
                tag: imageData,
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(imageData,fit: BoxFit.cover,)
                ),
              ),
              Positioned(
                bottom: 30,
                left: 50,
                right: 50,
                child: InkWell(
                  onTap: (){
                    //TODO:SAVE FUNCTIONALITY TO LOCAL STORAGE
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 2),
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black54,
                          Colors.black87,
                        ]
                      )
                    ),
                    child: Text('Set Wallpaper',style: TextStyle(fontSize: 25,color: Colors.white),),
                  ),
                ),
              ),
              Positioned(
                top:25,
                left: MediaQuery.of(context).size.width/2.1,
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey[800].withOpacity(0.7),
                    minRadius: 23,
                    child: Icon(Icons.clear,color: Colors.white,size: 28,),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
