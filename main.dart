import 'package:assignment1/grid_view_example.dart';
import 'package:assignment1/list_view_example.dart';
import 'package:assignment1/menu_page.dart';
import 'package:flutter/material.dart';

const url='https://www.tripsavvy.com/thmb/8hSyNm0dUTXbzbhgqZD0vS2NO2Y=/2121x1414/filters:fill(auto,1)/LakeLouise_GettyImages-6b1e83ecabbb423c9cc66ea024c0e6bf.jpg';
const description='''A lake is often a naturally occurring, relatively large and fixed body of water on or near the Earth's surface. It is localized in a basin or interconnected basins surrounded by dry land.[1] Lakes lie completely on land and are separate from the ocean, although they may be connected with the ocean by rivers. Lakes, as with other bodies of water, are part of the water cycle, the processes by which water moves around the Earth. Most lakes are fresh water and account for almost all the world's surface freshwater, but some are salt lakes with salinities even higher than that of seawater. Lakes vary significantly in surface area and volume of water. ''';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MenuPage(),
    );
  }
}
class Homepage extends StatelessWidget {
  const Homepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              url, width: double.infinity, height: 200, fit: BoxFit.cover,),
            Padding(padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Banff National Park,Canada', style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),),
                      Text('Beautiful Lake In Canada',
                        style: TextStyle(fontSize: 14, color: Colors.grey),)
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.star, color: Colors.redAccent,),
                  Text('41')
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call, color: Colors.blue,),
                      Padding(padding: const EdgeInsets.only(top: 8.0),
                        child: Text('CALL', style: TextStyle(fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue),),),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.near_me, color: Colors.blue,),
                      Padding(padding: const EdgeInsets.only(top: 8.0),
                        child: Text('ROUTE', style: TextStyle(fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue),
                        ),)
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share, color: Colors.blue,),
                      Padding(padding: const EdgeInsets.only(top: 8.0),
                        child: Text('SHARE', style: TextStyle(fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue),
                        ),)
                    ],
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(16.0),
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}
