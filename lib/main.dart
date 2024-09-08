import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController _googleMapController;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          elevation: 2,
        ),
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(23.253352016831087, 89.41839701864181),
            zoom: 16.0,
          ),
          onMapCreated: (GoogleMapController controller) {
            _googleMapController = controller;
          },
          onTap: (LatLng latLan) {
            print(latLan);
          },
          zoomControlsEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          polylines: <Polyline>{
            Polyline(
              polylineId: PolylineId('sample'),
              width: 7,
              color: Colors.red,
              visible: true,
              jointType: JointType.mitered,
              onTap: () {
                print('Tap on polyline');
              },
              points: [
                LatLng(23.257604055622554, 89.41992167383432),
                LatLng(23.254215977502483, 89.42167684435844),
                LatLng(23.253062058344284, 89.4150584936142)
              ],
            ),
            Polyline(
                polylineId: PolylineId('another'),
                color: Colors.yellow,
                width: 5,
                points: [
                  LatLng(23.26566868429214, 89.42257605493069),
                  LatLng(23.26085867345472, 89.42316245287657),
                  LatLng(23.26440582683892, 89.42138347774744)
                ])
          },
          circles: <Circle>{
            Circle(
              circleId: CircleId('mosque-circle'),
              center: LatLng(23.248177967990365, 89.41613506525755),
              radius: 200,
              strokeColor: Colors.green,
              strokeWidth: 5,
              fillColor: Colors.yellow.withOpacity(0.3),
            ),
            Circle(
              circleId: CircleId('another-circle'),
              center: LatLng(23.256215135747524, 89.41588796675205),
              radius: 230,
              strokeColor: Colors.red,
              strokeWidth: 4,
              fillColor: Colors.purple.withOpacity(0.3),
            )
          },
          polygons: <Polygon>{
            Polygon(
                polygonId: PolygonId('polygon-id'),
                visible: true,
                fillColor: Colors.blue,
                points: [
                  LatLng(23.252872920615673, 89.42718911916018),
                  LatLng(23.251523381251125, 89.42689139395952),
                  LatLng(23.24528531926386, 89.42930471152067),
                  LatLng(23.238603954311873, 89.42751467227936)
                ]),
          },
          markers: <Marker>{
            Marker(
                markerId: MarkerId('abc-building'),
                position: LatLng(23.271764729301704, 89.43268563598394),
                infoWindow: InfoWindow(title: 'ABC Building'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen)),
            Marker(
              markerId: MarkerId('abcd-building'),
              position: LatLng(23.25855186422762, 89.43834476172924),
              infoWindow: InfoWindow(title: 'ABCD Building'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
              draggable: true,
              onDragEnd: (LatLng lastLatLng) {
                print('End at $lastLatLng');
              },
              onDragStart: (LatLng lastLatLng) {
                print('Start at $lastLatLng');
              },
              onDrag: (LatLng lastLatLng) {
                print('On at $lastLatLng');
              },
            ),
          },
        ),
      ),
    );
  }
}
