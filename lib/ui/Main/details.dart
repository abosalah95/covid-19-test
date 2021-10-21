import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  dynamic data;
  DashboardScreen(this.data);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
    print ("mo123"+widget.data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme
          .of(context)
          .primaryColor,
          // title: Image.asset("assets/images/logo.jpg",width: 150,),
          title: Text(widget.data['country'],style: TextStyle(color:  Theme.of(context).primaryColorLight,),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Theme
              .of(context)
              .primaryColorLight)
      ),
      body: Column(
        children:[
          Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text('Result date: ${widget.data['updatedAt'].toString().split('T')[0]}'),
                  ),
                ),

          buildSummerCard(
              text: 'Confirmed',
              color: Colors.black,
              count: widget.data['confirmed']),
          buildSummerCard(
              text: 'Active',
              color: Colors.blue,
              count: widget.data['active']),
          buildSummerCard(
              text: 'Recovered',
              color: Colors.green,
              count: widget.data['recovered']),
          buildSummerCard(
              text: 'Deaths',
              color: Colors.red,
              count: widget.data['deaths']),
        ],
      ),
    );
  }

  Widget buildSummerCard({int count, Color color, String text}) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${count}',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )
          ],
        ),
    );
  }
}