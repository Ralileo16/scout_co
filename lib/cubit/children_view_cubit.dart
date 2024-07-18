import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scout_co/src/model/children_dto.dart';

part 'children_view_state.dart';

class ChildrenViewCubit extends Cubit<ChildrenViewState> {
  final ChildrenDtoRepository _childrenDtoRepository;

  ChildrenViewCubit(this._childrenDtoRepository)
      : super(const ChildrenViewInitial());

  Future<void> getChildrenDto(int id) async {
    try {
      final childrenDto = await _childrenDtoRepository.fetchChildrenDto(id);
      emit(ChildrenViewLoaded(childrenDto));
    } on NetworkException {
      emit(const ChildrenViewError("OOGA BOOGA SOMETHING CRASHED"));
    }
  }
}
