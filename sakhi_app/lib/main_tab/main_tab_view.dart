import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakhi_app/common_widget/tab_button.dart';
import 'package:sakhi_app/home_page.dart';
import 'package:sakhi_app/faqs.dart';
import 'package:sakhi_app/query_bot.dart';
import 'package:sakhi_app/chatbot_ui.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 221, 230, 1.0),
      body: PageStorage(bucket: pageBucket, child: currentTab),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 221, 230, 1.0),
              borderRadius: BorderRadius.circular(35),
            ),
            // child: Image.asset(
            //   'assets/home_tab_select.png',
            //   width: 35,
            //   height: 35,
            // ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(255, 221, 230, 1.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabButton(
                    icon: "assets/home_tab.png",
                    selectIcon: "assets/home_tab_select.png",
                    isActive: selectTab == 0,
                    onTap: () {
                      selectTab = 0;
                      currentTab = const HomePage();
                      if (mounted) {
                        setState(() {});
                      }
                    }),
                TabButton(
                    icon: "assets/chat_tab2.png",
                    selectIcon: "assets/chat_tab_select.png",
                    isActive: selectTab == 1,
                    onTap: () {
                      selectTab = 1;
                      currentTab = const Home();
                      if (mounted) {
                        setState(() {});
                      }
                    }),
                const SizedBox(
                  width: 40,
                ),
                TabButton(
                    icon: "assets/activity_tab.png",
                    selectIcon: "assets/activity_tab_select.png",
                    isActive: selectTab == 2,
                    onTap: () {
                      selectTab = 2;
                      currentTab = ChatScreen();
                      if (mounted) {
                        setState(() {});
                      }
                    }),
                TabButton(
                    icon: "assets/profile_tab.png",
                    selectIcon: "assets/profile_tab_select.png",
                    isActive: selectTab == 3,
                    onTap: () {
                      selectTab = 3;
                      currentTab = const InsightsPage();
                      if (mounted) {
                        setState(() {});
                      }
                    })
              ],
            ),
          )),
    );
  }
}
