import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scout_co/src/model/children_dto.dart';
import 'package:scout_co/src/model/children_dto_repository.dart';
import 'package:scout_co/src/model/parent_dto.dart';

part 'inscription_view_state.dart';

class InscriptionViewCubit extends Cubit<InscriptionViewState> {
  final ChildrenDtoRepository _childrenDtoRepository;
  List<ChildrenDto> _childrenDtoList;
  ChildrenDto? _childrenDto;

  InscriptionViewCubit(
      this._childrenDtoRepository, this._childrenDtoList, this._childrenDto)
      : super(const InscriptionViewInitial());

  Future<void> getChildrenDto(int id) async {
    try {
      _childrenDto = await _childrenDtoRepository.fetchChildrenDto(id);
      emit(InscriptionViewLoadedWithSelect(_childrenDtoList, _childrenDto!));
    } on NetworkException {
      emit(const InscriptionViewError("Network Exception"));
    }
  }

  Future<void> getAllChildrenDto() async {
    try {
      _childrenDtoList = await _childrenDtoRepository.fetchAllChildrenDto();
      emit(InscriptionViewLoaded(_childrenDtoList));
    } on NetworkException {
      emit(const InscriptionViewError("Network Exception"));
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
      isPaid: false,
    );
    _childrenDto = blank;
    emit(InscriptionViewLoadedWithSelectCanEdit(
        _childrenDtoList, _childrenDto!, true));
  }

  Future<void> onEditPressed() async {
    if (_childrenDto != null) {
      emit(InscriptionViewLoadedWithSelectCanEdit(
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
      emit(InscriptionViewLoadedWithSelect(_childrenDtoList, _childrenDto!));
    } on NetworkException {
      emit(const InscriptionViewError("Network Exception"));
    }
  }

  Future<void> onCancelPressed() async {
    _childrenDtoList = await _childrenDtoRepository.fetchAllChildrenDto();
    emit(InscriptionViewLoaded(_childrenDtoList));
  }

  Future<void> onPaidPressed(ChildrenDto childrenDto) async {
    try {
      childrenDto.isPaid = !childrenDto.isPaid;
      await _childrenDtoRepository.putChildrenDto(childrenDto);
      _childrenDtoList = await _childrenDtoRepository.fetchAllChildrenDto();
      emit(InscriptionViewLoaded(_childrenDtoList));
    } on NetworkException {
      emit(const InscriptionViewError("Network Exception"));
    }
  }
}
