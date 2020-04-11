import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'package:easy_alert/easy_alert.dart';
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  double _longitude = 0;
  double _latitude = 0;
  @override
  void initState() {
    super.initState();
    this._getLocation(); //打开这个页面的时候就触发这个方法
  }
  _getLocation() async{
    //启动一下
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
    await AMapLocationClient.startup(new AMapLocationOption( desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters  ));  
    //获取地理位置
    var result = await AMapLocationClient.getLocation(true);
    print("经度:${result.longitude}");
    print("纬度:${result.latitude}");
    setState(() {
     this._longitude=result.longitude;
     this._latitude=result.latitude; 
    });

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("地理位置演示"),
      ),
      body: Column(
        children: <Widget>[
          Text("经度:${this._longitude}"),
          Text("纬度:${this._latitude}"),
        ],
      ),
    );
  }
  
  
}
