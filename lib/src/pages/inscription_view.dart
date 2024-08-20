import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scout_co/cubit/inscription_view_cubit.dart';
import 'package:scout_co/src/model/children_dto.dart';
import 'package:scout_co/src/model/children_dto_repository.dart';
import 'package:scout_co/src/pages/inscription_view_form/inscription_view_form.dart';
import 'package:scout_co/src/utils/inscription_tabulated_list_view.dart';

//Snackbar + full Page
class InscriptionViewPage extends StatefulWidget {
  const InscriptionViewPage({super.key});

  @override
  InscriptionViewPageState createState() => InscriptionViewPageState();
}

class InscriptionViewPageState extends State<InscriptionViewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabTitles = [
    "Not Paid",
    "Paid",
  ];

  final List<String> _dataTableHeader = [
    "First Name",
    "Last Name",
    "Age",
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
    return BlocProvider(
      create: (context) =>
          InscriptionViewCubit(ChildrenDtoRepository(), [], null),
      child: Scaffold(
        body: BlocListener<InscriptionViewCubit, InscriptionViewState>(
          listener: (context, state) {
            if (state is InscriptionViewError) {
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
          child: InscriptionView(
            tabController: _tabController,
            tabTitles: _tabTitles,
            dataTableHeader: _dataTableHeader,
          ),
        ),
      ),
    );
  }
}

//List + Form
class InscriptionView extends StatelessWidget {
  const InscriptionView({
    super.key,
    required TabController tabController,
    required List<String> tabTitles,
    required List<String> dataTableHeader,
  })  : _tabController = tabController,
        _tabTitles = tabTitles,
        _dataTableHeader = dataTableHeader;

  final TabController _tabController;
  final List<String> _tabTitles;
  final List<String> _dataTableHeader;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InscriptionViewCubit, InscriptionViewState>(
      builder: (context, state) {
        if (state is InscriptionViewLoaded) {
          List<ChildrenDto> dataTableData = state.childrenDtoList;
          return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TabulatedListView(
                    tabController: _tabController,
                    tabTitles: _tabTitles,
                    dataTableHeader: _dataTableHeader,
                    dataTableData: dataTableData,
                  ),
                ),
              ),
              const VerticalDivider(),
              const Expanded(
                child: SingleChildScrollView(
                  child: InscriptionViewForm(),
                ),
              ),
            ],
          );
        } else if (state is InscriptionViewLoadedWithSelect) {
          List<ChildrenDto> dataTableData = state.childrenDtoList;
          return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TabulatedListView(
                    tabController: _tabController,
                    tabTitles: _tabTitles,
                    dataTableHeader: _dataTableHeader,
                    dataTableData: dataTableData,
                  ),
                ),
              ),
              const VerticalDivider(),
              const Expanded(
                child: SingleChildScrollView(
                  child: InscriptionViewForm(),
                ),
              ),
            ],
          );
        } else if (state is InscriptionViewLoadedWithSelectCanEdit) {
          List<ChildrenDto> dataTableData = state.childrenDtoList;
          return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TabulatedListView(
                    tabController: _tabController,
                    tabTitles: _tabTitles,
                    dataTableHeader: _dataTableHeader,
                    dataTableData: dataTableData,
                  ),
                ),
              ),
              const VerticalDivider(),
              const Expanded(
                child: SingleChildScrollView(
                  child: InscriptionViewForm(),
                ),
              ),
            ],
          );
        } else {
          final childrenDtoCubit = context.read<InscriptionViewCubit>();
          childrenDtoCubit.getAllChildrenDto();
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
