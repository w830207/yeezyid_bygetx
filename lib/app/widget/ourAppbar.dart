import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeezyid_bygetx/app/core/colors.dart';

class ourAppbar extends StatelessWidget with PreferredSizeWidget {
  ourAppbar({Key? key, required this.title, required this.imagePath})
      : super(key: key);

  final String title;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          this.imagePath != ''
              ? Column(
                children: [
                  Spacer(flex: 3),
                  Container(
                      height: kToolbarHeight*2,
                      width: kToolbarHeight*2,
                      child: FittedBox(
                        child: Image.file(File(this.imagePath)),
                        fit: BoxFit.contain,
                      ),
                    ),
                  Spacer(flex: 2),
                ],
              )
              : Spacer(),
          Column(
            children: [
              Spacer(flex: 2),
              Text(
                this.title,
                style: TextStyle(fontSize: kToolbarHeight, color: Colors.white),
              ),
              Spacer(flex: 1),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 3);
}
