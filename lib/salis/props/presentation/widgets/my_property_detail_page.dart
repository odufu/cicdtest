import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PropertyDetailsPage extends StatefulWidget {
  final String title;
  final List<String> imageUrls;
  final String ownership;
  final String location;
  final String housePlanUrl;
  final String videoUrl;

  const PropertyDetailsPage({
    super.key,
    required this.title,
    required this.imageUrls,
    required this.ownership,
    required this.location,
    required this.housePlanUrl,
    required this.videoUrl,
  });

  @override
  _PropertyDetailsPageState createState() => _PropertyDetailsPageState();
}

class _PropertyDetailsPageState extends State<PropertyDetailsPage> {
  int _currentIndex = 0;
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel for Images & Video
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    itemCount: widget.imageUrls.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        widget.imageUrls[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showVideoDialog(context);
                    },
                    icon: Icon(Icons.play_circle_filled),
                    label: Text('Watch Video'),
                  ),
                ),
              ],
            ),

            // Property Overview
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Property Overview',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.ownership,
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.home, size: 40, color: Colors.blue),
                      Text('Ownership: Owned by ${widget.ownership}'),
                      Icon(Icons.lock, size: 40, color: Colors.green),
                    ],
                  ),
                ],
              ),
            ),

            Divider(),

            // Location Map
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Property Location',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 200,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(6.5244,
                            3.3792), // Change to actual property location
                        zoom: 15,
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId('propertyLocation'),
                          position: LatLng(6.5244, 3.3792),
                          infoWindow: InfoWindow(title: widget.title),
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ),

            Divider(),

            // House Plan & Legal Documents
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'House Plan & Documents',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Download or view logic for house plan
                    },
                    icon: Icon(Icons.download),
                    label: Text('View House Plan'),
                  ),
                ],
              ),
            ),

            Divider(),

            // Amenities & Features
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amenities & Features',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _buildFeatureIcon(Icons.pool, 'Swimming Pool'),
                      _buildFeatureIcon(Icons.wifi, 'High-speed WiFi'),
                      _buildFeatureIcon(Icons.local_parking, 'Parking Space'),
                      _buildFeatureIcon(Icons.fitness_center, 'Gym'),
                    ],
                  ),
                ],
              ),
            ),

            Divider(),

            // Call to Action
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Contact agent logic
                    },
                    icon: Icon(Icons.phone),
                    label: Text('Contact Agent'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Schedule maintenance
                    },
                    icon: Icon(Icons.build),
                    label: Text('Schedule Maintenance'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Future Payment logic
                    },
                    icon: Icon(Icons.payments),
                    label: Text('Make Payment'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData iconData, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData, size: 40, color: Colors.blue),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  void _showVideoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          height: 300,
          child: Center(child: Text('Video Player Goes Here!')),
        ),
      ),
    );
  }
}
