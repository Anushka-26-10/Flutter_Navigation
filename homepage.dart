import 'package:flutter/material.dart';
const image1='https://www.tripsavvy.com/thmb/8hSyNm0dUTXbzbhgqZD0vS2NO2Y=/2121x1414/filters:fill(auto,1)/LakeLouise_GettyImages-6b1e83ecabbb423c9cc66ea024c0e6bf.jpg';
const image2='https://a.cdn-hotels.com/gdcs/production9/d1284/41938777-6157-4658-a612-807a8b48ac1a.jpg';
const image3='https://th.bing.com/th/id/R.350a9b8a56aa3aec1934a4a8a03fdd0f?rik=voZ%2b0hyZ6FD3jw&riu=http%3a%2f%2ffoundtheworld.com%2fwp-content%2fuploads%2f2016%2f09%2fLake-Tahoe-2.jpg&ehk=bCvIFcNjpmXVUYIlp1JO6y440dYLFCWOcNLuDGY0JxI%3d&risl=&pid=ImgRaw&r=0';
const image4='https://www.territorysupply.com/wp-content/uploads/2019/09/things-to-do-lake-tahoe-1.jpg';
const description='''A lake is often a naturally occurring, relatively large and fixed body of water on or near the Earth's surface. It is localized in a basin or interconnected basins surrounded by dry land.[1] Lakes lie completely on land and are separate from the ocean, although they may be connected with the ocean by rivers. Lakes, as with other bodies of water, are part of the water cycle, the processes by which water moves around the Earth. Most lakes are fresh water and account for almost all the world's surface freshwater, but some are salt lakes with salinities even higher than that of seawater. Lakes vary significantly in surface area and volume of water. ''';
class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final imageList=[image1,image2,image3,image4];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Example'),),
    body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    _imageSection(),
    _headerSection(),
    _navigationSection(),
    _bodySection(),
    ],
    ),
    ),
    );
    }

    Widget _bodySection() {
    return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(description),
    );
    }

    Widget _navigationSection() {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Icon(Icons.call, color: Colors.blue),
    Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
    'CALL',
    style: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.blue,
    ),
    ),
    ),
    ],
    ),
    Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Icon(Icons.near_me, color: Colors.blue),
    Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
    'ROUTE',
    style: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.blue,
    ),
    ),
    ),
    ],
    ),
    Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Icon(Icons.share, color: Colors.blue),
    Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
    'SHARE',
    style: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.blue,
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    );
    }

    Widget _headerSection() {
    return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
    children: [
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Banff National Park,Canada',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    Text(
    'Beautiful lake in canada',
    style: TextStyle(fontSize: 14, color: Colors.grey),
    )
    ],
    ),
    Spacer(),
    Icon(
    Icons.star,
    color: Colors.amber,
    ),
    Text(
    '9.5',
    )
    ],
    ),
    );
    }

    Widget _imageSection() {
    return Stack(
    clipBehavior: Clip.none,
    children: [
    Image.network(
    imageList[index],
    width: double.infinity,
    height: 200,
    fit: BoxFit.cover,
    ),
    Positioned.fill(
    child: Center(
    ),
    ),

    Positioned(
    right: 4,
    bottom: 4,
    child: ElevatedButton(
    onPressed: index == imageList.length - 1 ? null : () {
    setState(() {
    index++;
    });
    },
    child: Text('Next'),
    ),
    ),
    Positioned(
    left: 4,
    bottom: 4,
    child: ElevatedButton(
    onPressed: index == 0 ? null : () {
    setState(() {
    index--;
    });
    },
    child: Text('Previous'),
    ),
    ),
    ],
    );
    }
    }


