import 'dart:async';
import 'package:cicdtest/salis/core/utils/helper_functions.dart';
import 'package:cicdtest/salis/core/widgets/app_button.dart';
import 'package:cicdtest/salis/props/presentation/widgets/my_property_detail_page.dart';
import 'package:flutter/material.dart';

class MyPropsCard extends StatefulWidget {
  final List<String> imageUrls;
  final String title;
  final String ownership;
  final String completionStatus;
  final String status;
  final String nextPaymentDue;
  final String location;
  final int rating;

  const MyPropsCard({
    Key? key,
    required this.imageUrls,
    required this.title,
    required this.ownership,
    required this.completionStatus,
    required this.status,
    required this.nextPaymentDue,
    required this.location,
    required this.rating,
  }) : super(key: key);

  @override
  _MyPropsCardState createState() => _MyPropsCardState();
}

class _MyPropsCardState extends State<MyPropsCard> {
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.imageUrls.length;
      });
    });
  }

  void _stopAutoSlide() {
    _timer.cancel();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onNext() {
    _stopAutoSlide();
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.imageUrls.length;
    });
    _startAutoSlide();
  }

  void _onPrevious() {
    _stopAutoSlide();
    setState(() {
      _currentIndex = (_currentIndex - 1 + widget.imageUrls.length) %
          widget.imageUrls.length;
    });
    _startAutoSlide();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Carousel Section
          Stack(
            children: [
              // Image Display
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  widget.imageUrls[_currentIndex],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Left Arrow Button
              Positioned(
                left: 8,
                top: 75,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: _onPrevious,
                ),
              ),

              // Right Arrow Button
              Positioned(
                right: 8,
                top: 75,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: _onNext,
                ),
              ),
            ],
          ),

          // Dots Indicator
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imageUrls.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    _stopAutoSlide();
                    setState(() {
                      _currentIndex = entry.key;
                    });
                    _startAutoSlide();
                  },
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Text Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.pie_chart, size: 18, color: Colors.grey[700]),
                    SizedBox(width: 8),
                    Text('Ownership: ${widget.ownership}'),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.check_circle, size: 18, color: Colors.green),
                    SizedBox(width: 8),
                    Text('Total Ownership: ${widget.completionStatus}'),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.lock_outline, size: 18, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('Status: ${widget.status}'),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 18, color: Colors.blue),
                    SizedBox(width: 8),
                    Text('Due Date : ${widget.nextPaymentDue}'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < widget.rating
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.orange,
                          size: 20,
                        );
                      }),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 18, color: Colors.red),
                        SizedBox(width: 4),
                        Expanded(
                          // Ensure the text takes available space
                          child: Text(
                            widget.location,
                            style: TextStyle(fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppButton(
                text: "View",
                onPress: () {
                  HelperFunctions.routePushTo(
                      const PropertyDetailsPage(
                        title: "7 Semi Detached Duplex",
                        imageUrls: [
                          "assets/images/props13.jpg",
                          "assets/images/props7.jpg",
                          "assets/images/props4.jpg",
                          "assets/images/props15.jpg",
                        ],
                        ownership: "20%",
                        location: "Central Area Abuja Express",
                        housePlanUrl: "assets/images/plan.jpg",
                        videoUrl: "assets/images/propsvideo.mp4",
                      ),
                      context);
                },
                width: 100,
              ),
              AppButton(
                text: "Sell",
                onPress: () {},
                width: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
