import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesModel{
 final int id;
 final String name;
 final LatLng latLng;

 PlacesModel({required this.id,required this.name,required this.latLng});
}

List<PlacesModel>places=[
  PlacesModel(id: 1, name: 'Mansoura university', latLng: LatLng(31.045180025517798, 31.354625581150216),),
  PlacesModel(id: 2, name: 'Stereo Restaurant & Café', latLng: LatLng(31.04621532210431, 31.36326541515447),),
  PlacesModel(id: 3, name: 'THE CLUB co-working space', latLng: LatLng(31.03546552536691, 31.35944749386863),),

];