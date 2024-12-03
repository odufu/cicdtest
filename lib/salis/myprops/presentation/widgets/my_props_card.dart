import 'dart:async';
import 'package:cicdtest/salis/core/utils/helper_functions.dart';
import 'package:cicdtest/salis/core/widgets/app_button.dart';
import 'package:cicdtest/salis/myprops/presentation/widgets/my_props_details.dart';
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
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
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
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
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
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: _onPrevious,
                ),
              ),

              // Right Arrow Button
              Positioned(
                right: 8,
                top: 75,
                child: IconButton(
                  icon:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
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
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.pie_chart, size: 18, color: Colors.grey[700]),
                    const SizedBox(width: 8),
                    Text('Ownership: ${widget.ownership}'),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.check_circle,
                        size: 18, color: Colors.green),
                    const SizedBox(width: 8),
                    Text('Total Ownership: ${widget.completionStatus}'),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.lock_outline,
                        size: 18, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text('Status: ${widget.status}'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 18, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text('Due Date : ${widget.nextPaymentDue}'),
                  ],
                ),
                const SizedBox(height: 16),
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
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 18, color: Colors.red),
                          const SizedBox(width: 4),
                          Text(
                            widget.location,
                            style: const TextStyle(fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
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
                  HelperFunctions.routePushTo(MyPropsDetails(), context);
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
