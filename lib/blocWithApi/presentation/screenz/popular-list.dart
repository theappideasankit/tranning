import 'package:day1/blocWithApi/cubit/category_cubit.dart';
import 'package:day1/blocWithApi/cubit/popular_list_cubit.dart';
import 'package:day1/blocWithApi/data/modalz/PopularModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:velocity_x/velocity_x.dart';

class PopularListFood extends StatelessWidget {
  const PopularListFood({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PopularListCubit>(context).fetchPopList();
    BlocProvider.of<CategoryCubit>(context).fetchCategoryList();
    return Scaffold(
      appBar: AppBar(
        title: "Popular list".text.make(),
      ),
      body: Column(
        children: [
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (!(state is CategoryListLoaded)) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final catList = (state as CategoryListLoaded).category;
              return SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: catList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(catList[index].image),
                          ),
                          10.heightBox,
                          catList[index].title.text.fontFamily("SFPro").make()
                        ],
                      ).pOnly(right: 10);
                    }),
              );
            },
          ),
          10.heightBox,
          BlocBuilder<PopularListCubit, PopularListState>(
            builder: (context, state) {
              if (state is! PopularListLoaded) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final pops = (state as PopularListLoaded).popular;
              return AlignedGridView.count(
                itemCount: pops.length,
                crossAxisCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemBuilder: (context, index2) {
                  return Container(
                    height: 215,
                    width: 220,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 10.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width - 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(pops[index2].image),
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
                                pops[index2]
                                    .title
                                    .text
                                    .fontFamily("SFPro")
                                    .bold
                                    .black
                                    .make(),
                                pops[index2]
                                    .subtitle
                                    .text
                                    .fontFamily("SFPro")
                                    .coolGray400
                                    .make(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /*     RatingBar(
                                      initialRating: 1.5,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 14,
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                      unratedColor: Vx.coolGray400,
                                      ratingWidget: RatingWidget(
                                        full: Constants.imageSelect("Star.png"),
                                        empty: Constants.imageSelect("star2.png"),
                                        half: Constants.imageSelect("halfstar.png"),
                                      ),
                                      itemPadding:
                                      const EdgeInsets.symmetric(horizontal: 2.0),
                                    ),*/
                                    "\$${pops[index2].price}"
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
                        ]),
                  );
                },
              );
            },
          ).p(10),
        ],
      ),
    );
  }
}
