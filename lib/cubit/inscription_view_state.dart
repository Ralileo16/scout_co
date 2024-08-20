part of 'inscription_view_cubit.dart';

@immutable
sealed class InscriptionViewState {
  const InscriptionViewState();
}

final class InscriptionViewInitial extends InscriptionViewState {
  const InscriptionViewInitial();
}

class InscriptionViewLoaded extends InscriptionViewState {
  final List<ChildrenDto> childrenDtoList;
  const InscriptionViewLoaded(this.childrenDtoList);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InscriptionViewLoaded &&
        other.childrenDtoList == childrenDtoList;
  }

  @override
  int get hashCode => childrenDtoList.hashCode;
}

class InscriptionViewLoadedWithSelect extends InscriptionViewState {
  final ChildrenDto childrenDto;
  final List<ChildrenDto> childrenDtoList;
  const InscriptionViewLoadedWithSelect(this.childrenDtoList, this.childrenDto);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InscriptionViewLoadedWithSelect &&
        other.childrenDtoList == childrenDtoList &&
        other.childrenDto == childrenDto;
  }

  @override
  int get hashCode => childrenDtoList.hashCode + childrenDto.hashCode;
}

class InscriptionViewLoadedWithSelectCanEdit extends InscriptionViewState {
  final ChildrenDto childrenDto;
  final List<ChildrenDto> childrenDtoList;
  final bool canEdit;
  const InscriptionViewLoadedWithSelectCanEdit(
      this.childrenDtoList, this.childrenDto, this.canEdit);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InscriptionViewLoadedWithSelectCanEdit &&
        other.childrenDtoList == childrenDtoList &&
        other.childrenDto == childrenDto;
  }

  @override
  int get hashCode => childrenDtoList.hashCode + childrenDto.hashCode;
}

class InscriptionViewError extends InscriptionViewState {
  final String message;
  const InscriptionViewError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InscriptionViewError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
