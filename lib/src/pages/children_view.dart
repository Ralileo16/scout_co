import 'package:flutter/material.dart';

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
            child: TabulatedListView(tabController: _tabController),
          ),
          const VerticalDivider(),
          Expanded(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Card.outlined(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 8.0, right: 8.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First Name',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 8.0, left: 8.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Last Name',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, right: 8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Phone Number',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'E-mail',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Notes',
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
              children: [
                const DataTableExample(),
                ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Container(
                      height: 50,
                      color: Colors.amber[600],
                      child: const Center(child: Text('Entry A')),
                    ),
                    Container(
                      height: 50,
                      color: Colors.amber[500],
                      child: const Center(child: Text('Entry B')),
                    ),
                    Container(
                      height: 50,
                      color: Colors.amber[100],
                      child: const Center(child: Text('Entry C')),
                    ),
                  ],
                ),
                ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Container(
                      height: 50,
                      color: Colors.amber[600],
                      child: const Center(child: Text('Entry A')),
                    ),
                    Container(
                      height: 50,
                      color: Colors.amber[500],
                      child: const Center(child: Text('Entry B')),
                    ),
                    Container(
                      height: 50,
                      color: Colors.amber[100],
                      child: const Center(child: Text('Entry C')),
                    ),
                  ],
                ),
                ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Container(
                      height: 50,
                      color: Colors.amber[600],
                      child: const Center(child: Text('Entry A')),
                    ),
                    Container(
                      height: 50,
                      color: Colors.amber[500],
                      child: const Center(child: Text('Entry B')),
                    ),
                    Container(
                      height: 50,
                      color: Colors.amber[100],
                      child: const Center(child: Text('Entry C')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
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
      ],
    );
  }
}

class PageTest2 extends StatelessWidget {
  const PageTest2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("page test 2")),
    );
  }
}

class PageTest3 extends StatelessWidget {
  const PageTest3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("page test 3")),
    );
  }
}
