import 'package:flutter/material.dart';
import 'package:test/Test_Project/details_page.dart';
import 'package:test/Test_Project/homepage_2.dart';
import 'package:test/Test_Project/models/categories_model.dart';

class Categories extends StatelessWidget {
  List<CategoriesModle> list = [];
  Categories({required this.list});
  @override
  Widget build(BuildContext context) {
    print(list);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (contet) => MyHomePage()));
          },
        ),
        title: Text(list.first.category),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.7,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: list.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                              image: list[index].image,
                              name: list[index].name,
                              price: list[index].price)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 370,
                    width: 220,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xff3a3e3e),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(list[index].image),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: ListTile(
                            leading: Text(
                              list[index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Text(
                              list[index].price.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
