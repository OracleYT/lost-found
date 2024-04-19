import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/appTheme.dart';
import 'package:lostandfound/core/authWrapper.dart';
import 'package:lostandfound/core/constants.dart';
import 'package:lostandfound/views/loading.dart';

import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/api.dart';
import '../core/authService.dart';
import '../models/item.dart';

class LostItemPage extends StatefulWidget {
  @override
  State<LostItemPage> createState() => _LostItemPageState();
}

class _LostItemPageState extends State<LostItemPage>
    with TickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    getList();
    super.initState();
  }

  bool isLoading = true;
  List<Item> items;

  int bufferDelay;

  List<Item> data = [];

  AuthService authService = Get.put(AuthService(), permanent: true);

  void getList() async {
    List<dynamic> data = await ApiEndpoints.getItems();
    print(data);
    items = data;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: SafeArea(
              child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12, left: 16),
                child: Image.asset(
                  'assets/menu@3x.png',
                  height: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text(
                  'Lost & Found',
                  style: AppTheme.body
                      .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12, right: 16),
                    child: Icon(
                      Icons.logout_rounded,
                      size: 24,
                    ),
                  ).onTap(() async {
                    await Constants.removeUserFromLocal();
                    Get.offAll(AuthWrapper());
                    Fluttertoast.showToast(msg: "Logout Successfull");
                  }),
                  6.widthBox,
                  Padding(
                    padding: EdgeInsets.only(top: 12, right: 16),
                    child: Image.asset(
                      'assets/Add@3x.png',
                      height: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
          16.heightBox,
          SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            height: 32,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppTheme.appColor),
                  borderRadius: BorderRadius.circular(30)),
              child: TabBar(
                labelStyle: AppTheme.body,
                // controller: tabController,
                indicatorColor: Colors.green,
                labelPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                tabs: [
                  Tab(
                    text: "Lost",
                  ),
                  Tab(
                    text: "Found",
                  ),
                ],

                overlayColor: MaterialStateProperty.all(Colors.transparent),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicator: RectangularIndicator(
                  bottomLeftRadius: 30,
                  bottomRightRadius: 30,
                  topLeftRadius: 30,
                  topRightRadius: 30,
                  color: AppTheme.appColor,
                  paintingStyle: PaintingStyle.fill,
                ),
              ),
            ),
          ),
          Flexible(
              child: TabBarView(children: [
            items == null
                ? Center(child: CircularProgressIndicator())
                : items.isEmpty // == null
                    ? Center(
                        child: Text("No Items Available", style: AppTheme.body))
                    : Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (() => Get.to(() => LoadingPage())),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                    // margin:

                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.blueGrey
                                                .withOpacity(0.4),
                                            blurRadius: 12,
                                            // offset: Offset(0, 2)
                                          )
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.network(
                                                items[index].image,
                                                height: 92,
                                                width: 92,
                                              ),
                                            ),
                                          ),
                                          12.widthBox,
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      items[index].title,
                                                      maxLines: 1,
                                                      style: AppTheme.heading
                                                          .copyWith(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                    ),
                                                    Text(
                                                      items[index].description,
                                                      maxLines: 1,
                                                      style: AppTheme.body
                                                          .copyWith(
                                                              color: Colors
                                                                      .blueGrey[
                                                                  400]),
                                                    ),
                                                  ],
                                                ),
                                                12.heightBox,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '26-Apr-2019',
                                                      maxLines: 1,
                                                      style: AppTheme.body
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                    ),
                                                    Text(
                                                      'DynaTrade',
                                                      maxLines: 1,
                                                      style: AppTheme
                                                          .body
                                                          .copyWith(
                                                              color: Colors
                                                                      .blueGrey[
                                                                  400],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            );
                            // return JobItemWidget(
                            //     index: index, item: items[index]);
                          },
                        ),
                      ),
            Container()
          ]))
        ],
      ))),
    );
  }
}
