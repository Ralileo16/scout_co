import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scout_co/src/model/children_dto.dart';
import 'package:scout_co/src/model/children_dto_repository.dart';
import 'package:scout_co/src/model/parent_dto.dart';

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

  Future<void> onAddNewPressed() async {
    ChildrenDto blank = ChildrenDto(
        id: 0,
        firstName: '',
        lastName: '',
        dateOfBirth: DateTime.now(),
        gender: null,
        address: '',
        city: '',
        province: '',
        postalCode: '',
        phone: null,
        email: null,
        consentImage: false,
        notes: null,
        fkParent1: 0,
        fkParent2: 0,
        parentDto1: ParentDto(
          id: 0,
          firstName: '',
          lastName: '',
          gender: '',
          phone: '',
          email: '',
        ),
        parentDto2: ParentDto(
          id: 0,
          firstName: '',
          lastName: '',
          gender: '',
          phone: '',
          email: '',
        ),
        dateRegistration: DateTime.now(),
        datePaid: null,
        isPaid: false);
    _childrenDto = blank;
    emit(ChildrenViewLoadedWithSelectCanEdit(
        _childrenDtoList, _childrenDto!, true));
  }

  Future<void> onEditPressed() async {
    if (_childrenDto != null) {
      emit(ChildrenViewLoadedWithSelectCanEdit(
          _childrenDtoList, _childrenDto!, true));
    }
  }

  Future<void> onSavePressed(ChildrenDto childrenDto) async {
    try {
      if (childrenDto.id == 0) {
        await _childrenDtoRepository.postChildrenDto(childrenDto);
      } else {
        await _childrenDtoRepository.putChildrenDto(childrenDto);
      }
      _childrenDtoList = await _childrenDtoRepository.fetchAllChildrenDto();
      emit(ChildrenViewLoadedWithSelect(_childrenDtoList, _childrenDto!));
    } on NetworkException {
      emit(const ChildrenViewError("Network Exception"));
    }
  }

  Future<void> onCancelPressed() async {
    _childrenDtoList = await _childrenDtoRepository.fetchAllChildrenDto();
    emit(ChildrenViewLoaded(_childrenDtoList));
  }
}
