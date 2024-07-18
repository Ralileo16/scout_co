import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scout_co/cubit/children_view_cubit.dart';
import 'package:scout_co/src/model/children_dto.dart';

class TabulatedListView extends StatelessWidget {
  const TabulatedListView({
    super.key,
    required TabController tabController,
    required List<String> tabTitles,
    required List<String> dataTableHeader,
    required List<ChildrenDto> dataTableData,
  })  : _tabController = tabController,
        _tabTitles = tabTitles,
        _dataTableHeader = dataTableHeader,
        _dataTableData = dataTableData;

  final TabController _tabController;
  final List<String> _tabTitles;
  final List<String> _dataTableHeader;
  final List<ChildrenDto> _dataTableData;

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
              tabs: _tabTitles.map(
                (String e) {
                  return Tab(
                    text: e,
                  );
                },
              ).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                TabulatedListViewData(
                  dataTableHeader: _dataTableHeader,
                  dataTableData: _dataTableData,
                ),
                TabulatedListViewData(
                  dataTableHeader: _dataTableHeader,
                  dataTableData: _dataTableData,
                ),
                TabulatedListViewData(
                  dataTableHeader: _dataTableHeader,
                  dataTableData: _dataTableData,
                ),
                TabulatedListViewData(
                  dataTableHeader: _dataTableHeader,
                  dataTableData: _dataTableData,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabulatedListViewData extends StatefulWidget {
  const TabulatedListViewData({
    super.key,
    required List<String> dataTableHeader,
    required List<ChildrenDto> dataTableData,
  })  : _dataTableHeader = dataTableHeader,
        _dataTableData = dataTableData;

  final List<String> _dataTableHeader;
  final List<ChildrenDto> _dataTableData;

  @override
  State<TabulatedListViewData> createState() => _TabulatedListViewDataState();
}

class _TabulatedListViewDataState extends State<TabulatedListViewData> {
  bool _sortAsc = true;
  int _sortColumnIndex = 0;

  bool b = true;

  onSortColum(int columnIndex, bool sortAscending) {
    if (columnIndex == 0) {
      if (sortAscending) {
        widget._dataTableData
            .sort((a, b) => a.firstName.compareTo(b.firstName));
      } else {
        widget._dataTableData
            .sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
    if (columnIndex == 1) {
      if (sortAscending) {
        widget._dataTableData.sort((a, b) => a.lastName.compareTo(b.lastName));
      } else {
        widget._dataTableData.sort((a, b) => b.lastName.compareTo(a.lastName));
      }
    }
    if (columnIndex == 2) {
      if (sortAscending) {
        widget._dataTableData.sort((a, b) => a.age.compareTo(b.age));
      } else {
        widget._dataTableData.sort((a, b) => b.age.compareTo(a.age));
      }
    }
  }

  onCellTap(int id) {
    final childrenDtoCubit = context.read<ChildrenViewCubit>();
    childrenDtoCubit.getChildrenDto(id);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAsc,
        columns: widget._dataTableHeader.map(
          (String e) {
            return DataColumn(
              onSort: (columnIndex, sortAscending) {
                setState(
                  () {
                    if (_sortColumnIndex == columnIndex) {
                      _sortAsc = !_sortAsc;
                    } else {
                      _sortAsc = true;
                    }
                    _sortColumnIndex = columnIndex;
                  },
                );
                onSortColum(columnIndex, sortAscending);
              },
              label: Expanded(
                child: Text(
                  e,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            );
          },
        ).toList(),
        rows: widget._dataTableData.map(
          (ChildrenDto e) {
            b = !b;
            return DataRow(
              cells: <DataCell>[
                DataCell(
                  // onTap: () {
                  //   onCellTap(e.id);
                  // },
                  Text(
                    e.firstName,
                    style: b ? const TextStyle(color: Color(0xFFA0CAFD)) : null,
                  ),
                ),
                DataCell(
                  // onTap: () {
                  //   onCellTap(e.id);
                  // },
                  Text(
                    e.lastName,
                    style: b ? const TextStyle(color: Color(0xFFA0CAFD)) : null,
                  ),
                ),
                DataCell(
                  // onTap: () {
                  //   onCellTap(e.id);
                  // },
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e.age.toString(),
                        style: b
                            ? const TextStyle(color: Color(0xFFA0CAFD))
                            : null,
                      ),
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_right_rounded),
                        onPressed: () {
                          onCellTap(e.id);
                        },
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
