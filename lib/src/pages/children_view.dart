import 'package:flutter/material.dart';
import 'package:scout_co/src/dto/children_dto.dart';
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

  final List<String> _tabTitles = [
    "Castor",
    "Louveteaux",
    "Aventuriers",
    "Routiers",
  ];

  final List<String> _dataTableHeader = [
    "First Name",
    "Last Name",
    "Age",
  ];

  final List<ChildrenDto> _dataTableData = [
    ChildrenDto(id: 1, firstName: 'Ben', lastName: 'Dover', age: 16),
    ChildrenDto(id: 2, firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(id: 3, firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(id: 4, firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(id: 5, firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(id: 6, firstName: 'Ben', lastName: 'Dover', age: 16),
    ChildrenDto(id: 7, firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(id: 8, firstName: 'Jenny', lastName: 'Talia', age: 42),
    ChildrenDto(id: 9, firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(id: 10, firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(id: 11, firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(id: 12, firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(id: 13, firstName: 'Jenny', lastName: 'Talia', age: 42),
    ChildrenDto(id: 14, firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(id: 15, firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(id: 16, firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(id: 17, firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(id: 18, firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(id: 19, firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(id: 20, firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(id: 21, firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(id: 22, firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(id: 23, firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(id: 24, firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(id: 25, firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(id: 26, firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(id: 27, firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(id: 28, firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(id: 29, firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(id: 30, firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(id: 31, firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(id: 32, firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(id: 33, firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(id: 34, firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(id: 35, firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(id: 36, firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(id: 37, firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(id: 38, firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(id: 39, firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(id: 40, firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(id: 41, firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(id: 42, firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(id: 43, firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(id: 44, firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(id: 45, firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(id: 46, firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(id: 47, firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(id: 48, firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(id: 49, firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(id: 50, firstName: 'Wilma', lastName: 'Diqfit', age: 16),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabTitles.length, vsync: this);
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
              child: TabulatedListView(
                tabController: _tabController,
                tabTitles: _tabTitles,
                dataTableHeader: _dataTableHeader,
                dataTableData: _dataTableData,
              ),
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
