import 'package:flutter/material.dart';
import 'dart:async';

class FlashSaleBar extends StatefulWidget {
  @override
  _FlashSaleBarState createState() => _FlashSaleBarState();
}

class _FlashSaleBarState extends State<FlashSaleBar> {
  Duration duration = Duration(days: 1);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          if (duration.inSeconds > 0) {
            duration -= Duration(seconds: 1);
          } else {
            timer.cancel();
          }
        });
      }
    });
  }

  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inHours)}:${twoDigits(d.inMinutes % 60)}:${twoDigits(d.inSeconds % 60)}";
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Flash Sale Info
          Row(
            children: [
              Icon(Icons.flash_on, color: Colors.redAccent),
              SizedBox(width: 6),
              Text(
                'Flash Sale',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  formatTime(duration),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          // See All Button
          TextButton(
            onPressed: () {
              // TODO: Navigate to full flash sale page
            },
            child: Text('See All',style: TextStyle(color: Colors.grey),),
          ),
        ],
      ),
    );
  }
}
