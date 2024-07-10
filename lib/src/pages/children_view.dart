import 'package:flutter/material.dart';
import 'package:scout_co/src/utils/tabulated_list_view.dart';
import 'children_view_form/children_view_form.dart';

class ChildrenViewPage extends StatefulWidget {
  const ChildrenViewPage({super.key});

  @override
  ChildrenViewPageState createState() => ChildrenViewPageState();
}

class ChildrenViewPageState extends State<ChildrenViewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TabulatedListView(tabController: _tabController),
            ),
          ),
          const VerticalDivider(),
          const Expanded(
            child: SingleChildScrollView(
              child: ChildrenViewForm(),
            ),
          ),
        ],
      ),
    );
  }
}
