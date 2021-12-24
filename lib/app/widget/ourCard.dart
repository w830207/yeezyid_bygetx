import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurCard extends StatelessWidget {
  OurCard({
    Key? key,
    required this.type,
    required this.output,
    required this.imageURL,
    required this.url,
    required this.highestBid,
    required this.lowestAsk,
    required this.lastSale,
  }) : super(key: key);

  final String type;
  final String output;
  final String url;
  final String imageURL;
  final String highestBid;
  final String lowestAsk;
  final String lastSale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launch(this.url);
      },
      child: Card(
        child: Column(
            //用Column讓圖片和文字可以垂直排列
            crossAxisAlignment: CrossAxisAlignment.start, //水平對齊方式
            children: <Widget>[
              AspectRatio(
                //設定圖片的長寬比
                aspectRatio: 18.0 / 11.0,
                child: Image.network(
                  this.imageURL,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  //用Column讓兩排文字可以垂直排列
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('型號：' + this.type),
                    SizedBox(height: 8.0), //兩排文字間距用透明的box隔開
                    Text('配色：' + this.output),
                    SizedBox(height: 8.0), //兩排文字間距用透明的box隔開
                    Text('最高買價：' + this.highestBid),
                    SizedBox(height: 8.0), //兩排文字間距用透明的box隔開
                    Text('最低售價：' + this.lowestAsk),
                    SizedBox(height: 8.0), //兩排文字間距用透明的box隔開
                    Text('上次成交價：' + this.lastSale),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
