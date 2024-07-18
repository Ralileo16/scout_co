import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scout_co/cubit/children_view_cubit.dart';
import 'package:scout_co/src/model/children_dto.dart';
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

  final List<ChildrenDto> _dataTableData = childrenDtoList;

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
    return BlocProvider(
      create: (context) => ChildrenViewCubit(ChildrenDtoRepository()),
      child: Scaffold(
        body: BlocListener<ChildrenViewCubit, ChildrenViewState>(
          listener: (context, state) {
            if (state is ChildrenViewError) {
              String message = state.message;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          },
          child: ChildrenView(
            tabController: _tabController,
            tabTitles: _tabTitles,
            dataTableHeader: _dataTableHeader,
            dataTableData: _dataTableData,
          ),
        ),
      ),
    );
  }
}

class ChildrenView extends StatelessWidget {
  const ChildrenView({
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
    return Row(
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
    );
  }
}
