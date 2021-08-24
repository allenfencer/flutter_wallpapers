import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/models/wallpaperModel.dart';
import 'package:flutter_wallpaper/widgets/wallpaperList.dart';
import 'package:http/http.dart'as http;

Map searchData;
List searchedPhotos;

class Search extends StatefulWidget {
  final String query;
  const Search({Key key,this.query}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future <WallpaperModel> searchWallpapers(String query)async{
    String url='https://api.pexels.com/v1/search?query=$query&per_page=20';
    final response= await http.get(Uri.parse(url),headers: {'Authorization':'563492ad6f91700001000001afc180739c4744a08eb83112e75fab6a'});
    if(response.statusCode==200){
      searchData=jsonDecode(response.body);
      searchedPhotos=searchData['photos'];
      return WallpaperModel.fromJson(searchData);
    }else{
      throw Exception('cannot search for photos');
    }
  }
  final searchField= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              padding: EdgeInsets.all(20),
              icon: Icon(Icons.arrow_back_ios,size: 26,color: Colors.black54,), onPressed: (){
            Navigator.pop(context);
          }),
          actions: [
            Icon(Icons.clear,color: Colors.white,size: 28,),
          ],
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
              children: [
                SizedBox(height: 20,),
                FutureBuilder(
                    future: searchWallpapers(widget.query),
                    builder: (BuildContext context, snapshot){
                      if(snapshot.hasData)
                      {
                        return GridView.builder(
                            itemCount: searchedPhotos.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.6,
                            ),
                            itemBuilder: (BuildContext context,index){
                              return WallpaperList(imageUrl: searchedPhotos[index]['src']['portrait']);
                            }
                        );
                      }
                      else if(snapshot.hasData==null){
                        return Center(child: Text('No images'),);
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
      ),
    );
  }
}
