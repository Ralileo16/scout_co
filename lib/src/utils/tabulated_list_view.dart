import 'package:flutter/material.dart';

class TabulatedListView extends StatelessWidget {
  const TabulatedListView({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 36,
            child: TabBar(
              indicator: BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              tabs: const [
                Tab(text: "Castor"),
                Tab(text: "Louveteaux"),
                Tab(text: "Aventuriers"),
                Tab(text: "Routiers"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                TabulatedListViewData(),
                TabulatedListViewData(),
                TabulatedListViewData(),
                TabulatedListViewData(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabulatedListViewData extends StatelessWidget {
  const TabulatedListViewData({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                'First Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Last Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Ben')),
              DataCell(Text('Dover')),
              DataCell(Text('14')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Mike')),
              DataCell(Text('Oxard')),
              DataCell(Text('80')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Jenny')),
              DataCell(Text('Talia')),
              DataCell(Text('52')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Dixie')),
              DataCell(Text('Normous')),
              DataCell(Text('12')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Wilma')),
              DataCell(Text('Diqfit')),
              DataCell(Text('16')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Ben')),
              DataCell(Text('Dover')),
              DataCell(Text('14')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Mike')),
              DataCell(Text('Oxard')),
              DataCell(Text('80')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Jenny')),
              DataCell(Text('Talia')),
              DataCell(Text('52')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Dixie')),
              DataCell(Text('Normous')),
              DataCell(Text('12')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Wilma')),
              DataCell(Text('Diqfit')),
              DataCell(Text('16')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Ben')),
              DataCell(Text('Dover')),
              DataCell(Text('14')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Mike')),
              DataCell(Text('Oxard')),
              DataCell(Text('80')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Jenny')),
              DataCell(Text('Talia')),
              DataCell(Text('52')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Dixie')),
              DataCell(Text('Normous')),
              DataCell(Text('12')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Wilma')),
              DataCell(Text('Diqfit')),
              DataCell(Text('16')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Ben')),
              DataCell(Text('Dover')),
              DataCell(Text('14')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Mike')),
              DataCell(Text('Oxard')),
              DataCell(Text('80')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Jenny')),
              DataCell(Text('Talia')),
              DataCell(Text('52')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Dixie')),
              DataCell(Text('Normous')),
              DataCell(Text('12')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Wilma')),
              DataCell(Text('Diqfit')),
              DataCell(Text('16')),
            ],
          ),
        ],
      ),
    );
  }
}
