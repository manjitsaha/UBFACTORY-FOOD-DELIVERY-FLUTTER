import 'package:flutter/material.dart';

class ScrollToHideBottomContainer extends StatefulWidget {
  @override
  _ScrollToHideBottomContainerState createState() =>
      _ScrollToHideBottomContainerState();
}

class _ScrollToHideBottomContainerState
    extends State<ScrollToHideBottomContainer> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          // When the user scrolls, check the scroll direction
          if (scrollNotification.scrollDelta! > 0) {
            // Scrolling down, hide the bottom container
            setState(() {
              _isVisible = false;
            });
          } else {
            // Scrolling up, show the bottom container
            setState(() {
              _isVisible = true;
            });
          }
        }
        return false; // Return false to allow the notification to continue.
      },
      child:_buildBottomContainer()
    );
  }

  Widget _buildBottomContainer() {
    // You can customize the bottom container here
    if (_isVisible) {
      return Container(
        height: 100,
        color: Colors.blue,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'This is the bottom container',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      return SizedBox.shrink(); // Hide the container
    }
  }
}