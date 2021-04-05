import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  final double opacity;
  final Function onPressed;
  final String image;
  final Size size;
  final Size imageSize;
  const HeaderContainer({Key key, this.opacity, this.onPressed, this.image, this.size, this.imageSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: size.height,
            width: size.width,
          ),
          Container(
            height: 25,
            child: Image.asset('images/rise_black.png', fit: BoxFit.contain,),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Hero(
              tag: 'profile',
              child: Opacity(
                opacity: opacity,
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: Image.asset(image, width: imageSize.width, height: imageSize.height,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

