import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async{
    WorldTime wt = WorldTime(location: 'Kolkata', flag: 'kolkata.png', url: 'Asia/Kolkata');
    await wt.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':wt.location,
      'flag' : wt.flag,
      'time':wt.time,
      'isDaytime':wt.isDaytime,

    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue[900],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
