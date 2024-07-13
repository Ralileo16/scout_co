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
    ChildrenDto(firstName: 'Ben', lastName: 'Dover', age: 16),
    ChildrenDto(firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(firstName: 'Ben', lastName: 'Dover', age: 16),
    ChildrenDto(firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(firstName: 'Jenny', lastName: 'Talia', age: 42),
    ChildrenDto(firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(firstName: 'Jenny', lastName: 'Talia', age: 42),
    ChildrenDto(firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(firstName: 'Wilma', lastName: 'Diqfit', age: 16),
    ChildrenDto(firstName: 'Ben', lastName: 'Dover', age: 14),
    ChildrenDto(firstName: 'Mike', lastName: 'Oxard', age: 80),
    ChildrenDto(firstName: 'Jenny', lastName: 'Talia', age: 52),
    ChildrenDto(firstName: 'Dixie', lastName: 'Normous', age: 12),
    ChildrenDto(firstName: 'Wilma', lastName: 'Diqfit', age: 16),
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
