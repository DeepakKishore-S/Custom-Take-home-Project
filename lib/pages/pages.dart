import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final PageController _pgController = PageController(initialPage: 0);
  bool pg1 = true;
  bool pg2 = false;
  bool pg3 = false;

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Page $currentPage"),
          MaterialButton(
            elevation: 2,
            color: Colors.black,
            onPressed: () {
              tap(currentPage);
            },
            child: Text(
              "Go to Page $pageNo",
              style: TextStyle(color: Colors.white),
            ),
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
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
            ListTile(
              tileColor: pg1 ? Colors.black: Colors.white,
              title:  Text("Page 1",
              style: TextStyle(
                color: pg1 ? Colors.white: Colors.black,
              ),),
              onTap: () {
                setState(() {
                  pg1 = false;
                  pg2 = true;
                  pg3 = false;
                });
                tap(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              tileColor: pg2 ? Colors.black: Colors.white,
              title: Text("Page 2",
              style: TextStyle(
                color: pg2 ? Colors.white: Colors.black,
              ),),
              onTap: () {
                setState(() {
                  pg1 = false;
                  pg2 = true;
                  pg3 = false;
                });
                tap(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              tileColor: pg3 ? Colors.black: Colors.white,
              title: Text("Page 3",
              style: TextStyle(
                color: pg3 ? Colors.white: Colors.black,
              ),),
              onTap: () {
                setState(() {
                  pg1 = false;
                  pg2 = false;
                  pg3 = true;
                });
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
          pageBtn(2, 1),
          pageBtn(3, 2),
          pageBtn(1, 3),
        ],
      ),
    );
  }
}
