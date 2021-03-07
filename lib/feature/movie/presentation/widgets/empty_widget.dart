import 'package:flutter/cupertino.dart';

class EmptyWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("No data to display")
      ),
    );
  }
}
