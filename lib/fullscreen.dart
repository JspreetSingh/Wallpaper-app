import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';


class FullScreen extends StatefulWidget {
  final String imageUrl;
  const FullScreen({Key? key, required this.imageUrl}) : super(key: key);


  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {

  Future<void>setwallpaper() async{
    int location=WallpaperManager.HOME_SCREEN;
    var file= await DefaultCacheManager().getSingleFile(widget.imageUrl);
    String result=(await WallpaperManager.setWallpaperFromFile(file.path,location)) as String;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container(
              child: Image.network(widget.imageUrl),
            )),
            InkWell(
              onTap: (){
                setwallpaper();
              },
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.black,
                child: Center(child: Text("Set Wallpaper",style: TextStyle(fontSize: 20,color: Colors.white),)),),
            )
          ],
        ),
      ),
    );
  }
}
