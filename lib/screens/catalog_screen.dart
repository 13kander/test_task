import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/data_bloc.dart';
import 'package:test_task/components/components.dart';
import 'package:test_task/components/widgets/commodity_scroll.dart';
import 'package:test_task/components/widgets/data_scroll.dart';
import 'package:test_task/components/widgets/filter_scroll.dart';
import 'package:test_task/components/widgets/project_tab_bar.dart';

class CatalogScreen extends StatefulWidget {
  CatalogScreen({Key key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          'Каталог',
          style: ProjectTextStyles.appBarTitle,
        ),
        backgroundColor: ProjectColor.appBarBackground,
      ),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is DataInitial) {
            return Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                ProjectColor.backgroundSwitchEnabled,
              )),
            );
          }
          if (state is DataFailure) {
            return Center(
              child: Text(
                state.error,
                style: ProjectTextStyles.appBarTitle,
              ),
            );
          }
          if (state is DataSuccess) {
            return Column(
              children: [
                ProjectTabBar(
                    showAppbar: _showAppbar, tabController: _tabController),
                FilterScroll(showAppbar: _showAppbar),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      CommodityScroll(
                          scrollViewController: _scrollViewController,
                          data: state.data),
                      DataScroll(
                        dataCategory:
                            state.data.fermer.map((e) => e.name).toList(),
                      ),
                      DataScroll(
                        dataCategory:
                            state.data.agroTour.map((e) => e.name).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
