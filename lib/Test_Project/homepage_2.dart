import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Test_Project/categories.dart';
import 'package:test/Test_Project/details_page.dart';
import 'package:test/Test_Project/models/categories_model.dart';
import 'package:test/Test_Project/providers/provider_page.dart';

import 'package:test/Test_Project/widget/side_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Color(0xff3a3e3e),
        elevation: 0.0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://thumbs.dreamstime.com/b/little-kid-avatar-profile-picture-girls-face-bandana-cartoon-character-portrait-isolated-vector-illustration-graphic-design-149130285.jpg'),
            ),
          )
        ],
      ),
      body: Consumer<MyProvider>(
        builder: (context, provider, _) {
          return FutureBuilder(
            future: provider.getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Delicious Foods....",
                          style: TextStyle(
                              color: Color.fromARGB(255, 198, 197, 197),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              bestItem(context, "Pizza"),
                              bestItem(context, "Burger"),
                              bestItem(context, "Dosa"),
                              bestItem(context, "Hakka Noodels"),
                              bestItem(context, "Dhokla"),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Populars Items....",
                          style: TextStyle(
                              color: Color.fromARGB(255, 198, 197, 197),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 450,
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 0.7,
                                      crossAxisSpacing: 30,
                                      mainAxisSpacing: 30),
                              itemCount: provider.burgerList.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                            image: provider
                                                .burgerList[index].image,
                                            name:
                                                provider.burgerList[index].name,
                                            price: provider
                                                .burgerList[index].price),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 370,
                                    width: 220,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xff3a3e3e),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 50,
                                            backgroundImage: NetworkImage(
                                                provider
                                                    .burgerList[index].image),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                provider.burgerList[index].name,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                provider.burgerList[index].price
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          );
        },
      ),
    );
  }

  Widget bestItem(context, x) {
    MyProvider xyz = Provider.of<MyProvider>(context, listen: false);

    List<CategoriesModle> abc = [];
    for (int i = 0; i < xyz.burgerList.length; i++) {
      if (xyz.burgerList[i].category == x) {
        abc.add(xyz.burgerList[i]);
      }
    }
    return Row(
      children: [
        GestureDetector(
          onTap: (() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Categories(list: abc)));
          }),
          child: Container(
            height: 100,
            width: 100,
            // ignore: sort_child_properties_last
            child:
                Image(image: NetworkImage(abc.first.image), fit: BoxFit.cover),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.amber),
            //color: Colors.amber,
          ),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}
