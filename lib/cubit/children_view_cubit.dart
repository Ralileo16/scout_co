import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scout_co/src/model/children_dto.dart';
import 'package:scout_co/src/model/children_dto_repository.dart';

part 'children_view_state.dart';

class ChildrenViewCubit extends Cubit<ChildrenViewState> {
  final ChildrenDtoRepository _childrenDtoRepository;
  List<ChildrenDto> _childrenDtoList;
  ChildrenDto? _childrenDto;

  ChildrenViewCubit(
      this._childrenDtoRepository, this._childrenDtoList, this._childrenDto)
      : super(const ChildrenViewInitial());

  Future<void> getChildrenDto(int id) async {
    try {
      _childrenDto = await _childrenDtoRepository.fetchChildrenDto(id);
      emit(ChildrenViewLoadedWithSelect(_childrenDtoList, _childrenDto!));
    } on NetworkException {
      emit(const ChildrenViewError("Network Exception"));
    }
  }

  Future<void> getAllChildrenDto() async {
    try {
      _childrenDtoList = await _childrenDtoRepository.fetchAllChildrenDto();
      emit(ChildrenViewLoaded(_childrenDtoList));
    } on NetworkException {
      emit(const ChildrenViewError("Network Exception"));
    }
  }

  Future<void> onCancelPressed() async {
    emit(ChildrenViewLoaded(_childrenDtoList));
  }

  Future<void> onEditPressed() async {
    emit(ChildrenViewLoadedWithSelectCanEdit(
        _childrenDtoList, _childrenDto!, true));
  }
}
