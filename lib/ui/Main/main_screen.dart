
import 'dart:typed_data';

import 'package:covid_track_task/bloc/data/data_bloc.dart';
import 'package:covid_track_task/model/dataModel.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



import '../../app.dart';
import 'details.dart';

int delivery_status;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {

  List<Marker> _markers = [];
  GoogleMapController mapController;

  DataBloc _bloc;
  bool _isloading = false;
  DataModel dataModel;


  @override
  void initState() {
    super.initState();
    _bloc=DataBloc();
    _bloc.add(GetData());
  }


  @override
  Widget build(BuildContext context) {

    return BlocListener<DataBloc, DataState>(
        cubit: _bloc,
        listener: (context, state) {
          if (state is DataStateFailure) {
            setState(() {
              _isloading = false;
            });
           print(state.message);
          }
          if (state is Initial) {
            setState(() {
              _isloading = true;
            });
          }
          if (state is GetDataStateSuccess) {
            setState(() {
              _isloading = false;
              dataModel=state.model;
              for(var country in dataModel.countries){
                _markers.add(Marker(
                    markerId: MarkerId(country['country']),
                    position: LatLng(double.parse(country['latitude'].toString()),double.parse(country['longitude'].toString()) ),
                    draggable: false,
                    zIndex: 2,
                    flat: true,
                  infoWindow: InfoWindow(
                    title: country['country'],
                    snippet: country['active'].toString(),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => DashboardScreen(country)));
                    }
                  ),
                    anchor: Offset(0.5, 0.5),
                ));
              }
            });
          }
        },
        child: SafeArea(
              child: Scaffold(
                backgroundColor: Theme
                    .of(context)
                    .backgroundColor,
                appBar: AppBar(backgroundColor: Theme
                    .of(context)
                    .primaryColor,
                  // title: Image.asset("assets/images/logo.jpg",width: 150,),
                  title: Text("Covid19 Tracker",style: TextStyle(color:  Theme.of(context).primaryColorLight,),),
                  centerTitle: true,
                  iconTheme: IconThemeData(color: Theme
                      .of(context)
                      .primaryColorLight)
                ),

                body: GoogleMap(
                  myLocationButtonEnabled: false,
                  markers: Set.from(_markers),
                  zoomControlsEnabled: false,
                  myLocationEnabled: false,
                  tiltGesturesEnabled: true,
                  compassEnabled: true,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,

                  onMapCreated: (GoogleMapController googleMapController) {
                    setState(() {
                      mapController = googleMapController;
                    });
                  },
                  initialCameraPosition: CameraPosition(
                      zoom: 1.0, target: LatLng(30.1, 31.5)),
                  mapType: MapType.terrain,
                ),
              ),
            ));
  }
}



