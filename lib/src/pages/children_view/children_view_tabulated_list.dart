import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scout_co/core/localization/generated/l10n.dart';
import 'package:scout_co/cubit/children_view_cubit.dart';
import 'package:scout_co/src/model/children_dto.dart';
import 'package:scout_co/src/utils/locator.dart';
import 'package:scout_co/src/utils/pdf_generator.dart';

class TabulatedListView extends StatefulWidget {
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
  TabulatedListViewState createState() => TabulatedListViewState();
}

class TabulatedListViewState extends State<TabulatedListView> {
  late final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final I10n i10n = locator<I10n>();
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
              controller: widget._tabController,
              tabs: widget._tabTitles.map(
                (String header) {
                  return Tab(
                    text: header,
                  );
                },
              ).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: widget._tabController,
              children: [
                TabulatedListViewData(
                    dataTableHeader: widget._dataTableHeader,
                    dataTableData: _searchController.text.isEmpty
                        ? widget._dataTableData
                            .where((c) => c.age <= 8)
                            .toList()
                        : widget._dataTableData
                            .where(
                              (c) =>
                                  c.age <= 8 &&
                                  (c.firstName.toLowerCase().contains(
                                            _searchController.text
                                                .toLowerCase(),
                                          ) ||
                                      c.lastName.toLowerCase().contains(
                                            _searchController.text
                                                .toLowerCase(),
                                          )),
                            )
                            .toList()),
                TabulatedListViewData(
                    dataTableHeader: widget._dataTableHeader,
                    dataTableData: _searchController.text.isEmpty
                        ? widget._dataTableData
                            .where((c) => c.age <= 12 && c.age > 8)
                            .toList()
                        : widget._dataTableData
                            .where(
                              (c) =>
                                  c.age <= 12 &&
                                  c.age > 8 &&
                                  (c.firstName.toLowerCase().contains(
                                            _searchController.text
                                                .toLowerCase(),
                                          ) ||
                                      c.lastName.toLowerCase().contains(
                                            _searchController.text
                                                .toLowerCase(),
                                          )),
                            )
                            .toList()),
                TabulatedListViewData(
                    dataTableHeader: widget._dataTableHeader,
                    dataTableData: _searchController.text.isEmpty
                        ? widget._dataTableData
                            .where((c) => c.age <= 17 && c.age > 12)
                            .toList()
                        : widget._dataTableData
                            .where(
                              (c) =>
                                  c.age <= 17 &&
                                  c.age > 12 &&
                                  (c.firstName.toLowerCase().contains(
                                            _searchController.text
                                                .toLowerCase(),
                                          ) ||
                                      c.lastName.toLowerCase().contains(
                                            _searchController.text
                                                .toLowerCase(),
                                          )),
                            )
                            .toList()),
                TabulatedListViewData(
                    dataTableHeader: widget._dataTableHeader,
                    dataTableData: _searchController.text.isEmpty
                        ? widget._dataTableData
                            .where((c) => c.age > 17)
                            .toList()
                        : widget._dataTableData
                            .where(
                              (c) =>
                                  c.age > 17 &&
                                  (c.firstName.toLowerCase().contains(
                                            _searchController.text
                                                .toLowerCase(),
                                          ) ||
                                      c.lastName.toLowerCase().contains(
                                            _searchController.text
                                                .toLowerCase(),
                                          )),
                            )
                            .toList()),
              ],
            ),
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: i10n.formSearchBar,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Tooltip(
                    message: i10n.formButtonsAttendanceTooltip,
                    child: const PDFAttendance(),
                  ),
                ),
              ),
            ],
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

  bool sort = true;

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
    sort = true;
    return SingleChildScrollView(
      child: DataTable(
        showCheckboxColumn: false,
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAsc,
        columns: widget._dataTableHeader.map(
          (String header) {
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
                  header,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            );
          },
        ).toList(),
        rows: widget._dataTableData.map(
          (ChildrenDto children) {
            sort = !sort;
            return DataRow(
              onSelectChanged: (bool? selected) {
                onCellTap(children.id);
              },
              cells: [
                DataCell(
                  Text(
                    children.firstName,
                    style:
                        sort ? const TextStyle(color: Color(0xFFA0CAFD)) : null,
                  ),
                ),
                DataCell(
                  Text(
                    children.lastName,
                    style:
                        sort ? const TextStyle(color: Color(0xFFA0CAFD)) : null,
                  ),
                ),
                DataCell(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        children.age.toString(),
                        style: sort
                            ? const TextStyle(color: Color(0xFFA0CAFD))
                            : null,
                      ),
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_right_rounded),
                        onPressed: () {
                          onCellTap(children.id);
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
