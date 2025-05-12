import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps_and_payment/Map_Feature/models/Places_Model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition cameraPosition;
  late GoogleMapController googleMapController; //update the attributes of the map
  Set<Marker>markers={};
  Set<Polyline>polyline={};
  Set<Polygon>polygons={};
 Set<Circle>circles={};
  @override
  void initState() {
    cameraPosition=CameraPosition(
        target: LatLng(31.04137960788177, 31.376661242536358),
         zoom: 12
    );
    initMarkers();
    initPolyline();
    initPolygon();
    initCircle();
    super.initState();
  }
  @override
  void dispose() {
   googleMapController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          markers:markers,
          polylines:polyline,
          polygons: polygons,
          circles: circles,
          initialCameraPosition:cameraPosition,

          onMapCreated: (controller){  //initialize the controller
            googleMapController=controller;
            initMapStyle(); //do not use map style with map type
          },

       zoomControlsEnabled: false,
        ),
        
        Positioned(
          bottom: 16,
            right: 25,
            left: 16,
            child: ElevatedButton(
                onPressed: (){
                  googleMapController.animateCamera(
                      CameraUpdate.newLatLng(LatLng(31.200515567568498, 29.91782946566164)),
                  );
                }, child: Text('Change location')
            )
          ,)
      ],
    );
  }

  Future<void> initMapStyle() async {
   var retroStyle=await DefaultAssetBundle.of(context).loadString('assets/map_styles/retro_style.json');
   googleMapController.setMapStyle(retroStyle);
  }

  Future<void> initMarkers() async {
    var customMarkerIcon=await BitmapDescriptor.asset(ImageConfiguration(),'assets/images/location.png');
    var allMarkers=
    places.map(
            (placesModel)=>Marker(
              icon:customMarkerIcon ,
              infoWindow: InfoWindow(title: placesModel.name),
              markerId:MarkerId(placesModel.id.toString()),
              position: placesModel.latLng
            )

    ).toSet();
    markers.addAll(allMarkers);
    setState(() {});
  }

  void initPolyline() {
    Polyline polyline1=Polyline(
        width: 5,
        startCap: Cap.roundCap,
        polylineId: PolylineId('1'),
    points: [
      LatLng(31.045180025517798, 31.354625581150216),
      LatLng(31.04621532210431, 31.36326541515447),
      LatLng(31.03546552536691, 31.35944749386863)
    ]
    );
     polyline.add(polyline1);
  }

  void initPolygon() {
    Polygon polygon=Polygon(
        holes: [[]],//determine a hole in the polygon and calls (holo polygon)
        polygonId: PolygonId('1'),
      fillColor: Colors.black.withValues(alpha: .5),
      strokeWidth: 3,
      points: [
        LatLng(31.02055811187517, 31.373269595734833), 
        LatLng(31.015833026692068, 31.388785938061602),
        LatLng(31.035229475487906, 31.380441834136484),
        ]
    );
    polygons.add(polygon);
  }

  void initCircle() {
    Circle kfcCircle=Circle(
        circleId: CircleId('1'),
      center: LatLng(31.0358535225838, 31.358832273355045),
      radius: 1000
    );
    circles.add(kfcCircle);
  }
}


/* determine the boundaries of the viewed map*/
// cameraTargetBounds: CameraTargetBounds(
//   LatLngBounds(
//       southwest:LatLng(31.025591045336412, 31.333924303684974) ,
//       northeast:LatLng(31.05247616566448, 31.44680832588228)
//   )
// ),
/*zoom levels*/
//world view-> 0 - 3
//country view-> 4 -6
//city view-> 10 - 12
//street view-> 13 - 17
//building view-> 18 - 20