import 'package:flutter/material.dart';

import '../components.dart';

class ProjectTabBar extends StatelessWidget {
  const ProjectTabBar(
      {Key key, @required this.showAppbar, @required this.tabController})
      : super(key: key);

  final bool showAppbar;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: showAppbar ? 110.0 : 0.0,
      duration: Duration(milliseconds: 200),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            color: ProjectColor.backgroundSwitchContainer,
            borderRadius: BorderRadius.circular(
              50.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: TabBar(
              controller: tabController,
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  40.0,
                ),
                color: ProjectColor.backgroundSwitchEnabled,
              ),
              labelColor: ProjectColor.appBarBackground,
              unselectedLabelColor: ProjectColor.title,
              labelStyle: ProjectTextStyles.switchButton,
              tabs: [
                // first tab [you can add an icon using the icon property]
                Tab(
                  text: 'Продукты',
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'Фермеры',
                ),
                Tab(
                  text: 'Агротуры',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
