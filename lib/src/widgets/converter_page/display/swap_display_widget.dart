import 'package:flutter/material.dart';

class SwapDisplayWidget extends StatelessWidget {
  const SwapDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 16.0),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.swap_vert,
          color: Colors.white,
        ),
      ),
    );
  }
}
