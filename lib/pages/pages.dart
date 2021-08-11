import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final PageController _pgController = PageController(initialPage: 0);

  tap(int pageNo) {
    if (pageNo == 3) {
      _pgController.jumpToPage(_pgController.initialPage);
    } else {
      _pgController.jumpToPage(pageNo);
    }
  }
  Widget pageBtn(int pageNo, int currentPage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment. spaceEvenly,
        children: [
          Text("Page $currentPage"),
          MaterialButton(elevation: 2,
            color: Colors.black,
            onPressed: () {
              tap(currentPage);
            },
            child: Text("Go to Page $pageNo",
            style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Take-home Project"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white
                ),
              ),
            ),
            ListTile(
              title: const Text("Page 1"),
              onTap: () {
                tap(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Page 2"),
              onTap: () {
                tap(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Page 3"),
              onTap: () {
                tap(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pgController,
        children: [
          pageBtn(2,1),
          pageBtn(3,2),
          pageBtn(1,3),
        ],
      ),
    );
  }

  
}
