
import 'package:day1/blocWithApi/data/modalz/PopularModel.dart';
import 'package:day1/blocWithApi/data/modalz/pops.dart';
import 'package:day1/blocWithApi/data/network_service.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Popps extends StatelessWidget {
   Popps({Key key}) : super(key: key);

  NetworkServices networkServices = NetworkServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Popular list".text.make(),
      ),
      body:FutureBuilder<Pops>(
          future: networkServices.getPops(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.popular.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width - 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        snapshot.data.popular[index].image),
                                    fit: BoxFit.cover),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                          ),
                          SizedBox(
                            height: 95,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                snapshot.data.popular[index].title.text.black
                                    .fontFamily("SFPro")
                                    .bold
                                    .make(),
                                snapshot.data.popular[index].subtitle.text
                                    .fontFamily("SFPro")
                                    .coolGray400
                                    .make(),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    "\$${snapshot.data.popular[index].price}"
                                        .text
                                        .black
                                        .fontFamily("SFPro")
                                        .bold
                                        .make(),
                                  ],
                                )
                              ],
                            ).p(8),
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
/*
Widget _popular(PopularElement popular, context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
    ),
    child: Column(
      children: [
        Container(
          height: 120,
          width: MediaQuery.of(context).size.width - 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(popular.image),
                  fit: BoxFit.cover),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
        ),
        SizedBox(
          height: 95,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              popular.title.text.black.fontFamily("SFPro").bold.make(),
              popular.subtitle.text
                  .fontFamily("SFPro")
                  .coolGray400
                  .make(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${popular.price}"
                      .text.black
                      .fontFamily("SFPro")
                      .bold
                      .make(),
                ],
              )
            ],
          ).p(8),
        )
      ],
    ),
  ).p(10);
}
*/
