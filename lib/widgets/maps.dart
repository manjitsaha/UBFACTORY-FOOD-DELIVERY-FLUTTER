import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/constant/color.dart';

class DiscoverMap extends StatefulWidget {
  const DiscoverMap({Key? key}) : super(key: key);

  @override
  State<DiscoverMap> createState() => _DiscoverMapState();
}

class _DiscoverMapState extends State<DiscoverMap> {
  final TextEditingController _searchController = TextEditingController();
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.white,
          leading: const BackButton(color: Colors.black,),
          elevation: 0,
        ),
        body: Stack(
          children: [
            
            GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(16, 80),
                zoom: 10,
              ),
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
            ),
            
          
          ],
        ),
      ),
    );
  }
}
