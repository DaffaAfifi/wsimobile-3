import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'LoginPage.dart';
import 'package:android_intent_plus/android_intent.dart';
import '../drawer/Drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          backgroundColor: Colors.red,
        ),
        drawer: DrawerScreen(),
        body: DashboardPage(),
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _HomePageState();
}

class _HomePageState extends State<DashboardPage> {
  TextEditingController tujuan = TextEditingController();
  String location = 'lat:, long:';
  String address = 'Mencari Lokasi...';

  //getLongLat
  Future<Position> _getGeoLocationPosition() async{
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      await Geolocator.openLocationSettings();
      return Future.error('GPS tidak aktif');
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Izin akses lokasi ditolak');
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error('Izin lokasi ditolak selamanya, kita tidak dapat mengaksesnya');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  //getAddress
  Future<void> getAddressFromLongLat(Position position) async{
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    setState(() {
      address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Text(
                'Dapatkan Rutemu!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Titik Koordinat',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Lokasi saat ini',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text('${address}'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Position position = await _getGeoLocationPosition();
                  setState(() {
                    location =
                        'lat:${position.latitude}, long:${position.longitude}';
                  });
                  getAddressFromLongLat(position);
                },
                child: const Text('Cek Lokasi', style: TextStyle(fontSize: 14),),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),),
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                'Tujuanmu?',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  autofocus: false,
                  controller: tujuan,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintText: "Contoh: Polije",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final intent = AndroidIntent(
                        action: 'action_view',
                        data: Uri.encodeFull(
                            'google.navigation:q=${tujuan.text.trim()}'),
                        package: 'com.google.android.apps.maps');
                    await intent.launch();
                  },
                  child: const Text("Cari Lokasi", style: TextStyle(fontSize: 14),),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),),
              ),       
          ],
        ),
      ),
    ));
  }
}