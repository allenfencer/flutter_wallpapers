import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wallpaper/models/categoryList.dart';
import 'package:flutter_wallpaper/models/wallpaperModel.dart';
import 'package:flutter_wallpaper/search_screen.dart';
import 'package:flutter_wallpaper/widgets/categoryTile.dart';
import 'package:flutter_wallpaper/widgets/wallpaperList.dart';
import 'package:http/http.dart'as http;

Map data;
List photos;
Future <WallpaperModel> fetchImages;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchImages = getImages();
  }

  final searchController=TextEditingController();

  Future <WallpaperModel> getImages()async{
    String url='https://api.pexels.com/v1/curated?per_page=30';
    var response= await http.get(Uri.parse(url),headers: {'Authorization':'563492ad6f91700001000001afc180739c4744a08eb83112e75fab6a'});
    if(response.statusCode==200)
      {
        data=jsonDecode(response.body);
        photos=data['photos'];
        return WallpaperModel.fromJson(data);
      }
    else{
      throw Exception('Could not fetch data at the moment');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pixel',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),),
            Text('Art',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 15),
                  padding: EdgeInsets.only(left: 25,right: 10),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(query: searchController.text.toString(),)));
                      },
                        icon: Icon(Icons.search,size: 28,color: Colors.grey[700],)),
                    hintText: 'search',
                    hintStyle: TextStyle(color: Colors.grey[500],fontSize: 18,fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Created by',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black45),),
                  Text(' Allen Fencer',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blue),)
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 90,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: CategoryTileData.categories.length,
                  itemBuilder: (BuildContext context,index){
                    return CategoryTile(imageTag: CategoryTileData.categories[index].imageUrl,imageTitle: CategoryTileData.categories[index].title,);
                  },
                ),
              ),
              SizedBox(height: 20,),
              FutureBuilder(
                  future: fetchImages,
                  builder: (BuildContext context, snapshot){
                    if(snapshot.hasData)
                      {
                        return GridView.builder(
                              itemCount: photos.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.6,
                            ),
                            itemBuilder: (BuildContext context,index){
                              return WallpaperList(imageUrl: photos[index]['src']['portrait']);
                            }
                        );
                      }
                    else{
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
