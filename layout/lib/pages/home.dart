import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แอพความรู้เกี่ยวกับอุปกรณ์ดับเพลิง'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          builder: (context, snapshop){
            var data = json.decode(snapshop.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return MyBox(data[index]['title'], data[index]['subtitle'], data[index]['imageUrl'], data[index]['detail']);
              
              },
              itemCount: data.length,
              
            );

          },
          future: DefaultAssetBundle.of(context).loadString('assets/data.json'),


        )
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String imageUrl, String detail) {
    var v1,v2,v3,v4;
    v1 = title;
    v2 = subtitle;
    v3 = imageUrl;
    v4 = detail;
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      //color: Colors.blue[50],
      height: 200,
      decoration: BoxDecoration(
          //color: Colors.blue[50],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.65), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(height: 15,),
          TextButton(onPressed: (){
            print('Next Page >>>');
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(v1,v2,v3,v4)));  
          }, child: Text('อ่านต่อ >>'))
        ],
      ),
    );
  }
}
