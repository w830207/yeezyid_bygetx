import 'package:flutter/material.dart';


class ourCard extends StatelessWidget {
  ourCard({Key? key,
    required this.type,
    required this.output,
    required this.imageURL,
    required this.URL,
    required this.HB,
    required this.LA,
    required this.LS,
  }) :super(key: key);

  final String type;
  final String output;
  final String URL;
  final String imageURL;
  final String HB;
  final String LA;
  final String LS;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column( //用Column讓圖片和文字可以垂直排列
            crossAxisAlignment: CrossAxisAlignment.start, //水平對齊方式
            children: <Widget>[
              AspectRatio( //設定圖片的長寬比
                aspectRatio: 18.0 / 11.0,
                child: Image.network(this.imageURL, fit: BoxFit.fitWidth,),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column( //用Column讓兩排文字可以垂直排列
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('型號：' + this.type),
                    SizedBox(height: 8.0), //兩排文字間距用透明的box隔開
                    Text('配色：' + this.output),
                    SizedBox(height: 8.0), //兩排文字間距用透明的box隔開
                    Text('最高買價：' + this.HB),
                    SizedBox(height: 8.0), //兩排文字間距用透明的box隔開
                    Text('最低售價：' + this.LA),
                    SizedBox(height: 8.0), //兩排文字間距用透明的box隔開
                    Text('上次成交價：' + this.LS),

                  ],
                ),
              ),
            ]
        )
    );
  }
}
