import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location/flutter_map_location.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        zoom: 19,
        plugins: <MapPlugin>[
          LocationPlugin(),
        ],
      ),
      layers: <LayerOptions>[
        TileLayerOptions(
          urlTemplate: '', // TODO Tiles API URL
          maxZoom: 23,
          minZoom: 19,
          // TODO errorImage: AssetImage('map\18\91667\150125.png'),
        ),
        MarkerLayerOptions(
            // TODO Get markers from API
            markers: [])
      ],
      nonRotatedLayers: <LayerOptions>[
        LocationOptions(
          locationButton(),
          onLocationRequested: (LatLngData ld) {
            if (ld == null) {
              return;
            }
            _mapController.move(ld.location, 19.0);
          },
        ),
      ],
    );
  }

  LocationButtonBuilder locationButton() {
    return (BuildContext context, ValueNotifier<LocationServiceStatus> status,
        Function onPressed) {
      return Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
          child: FloatingActionButton(
              child: const Icon(
                Icons.location_searching,
                color: Colors.white,
              ),
              onPressed: () {
                onPressed();
              }),
        ),
      );
    };
  }
}
