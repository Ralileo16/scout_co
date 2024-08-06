part of 'children_view_cubit.dart';

@immutable
sealed class ChildrenViewState {
  const ChildrenViewState();
}

final class ChildrenViewInitial extends ChildrenViewState {
  const ChildrenViewInitial();
}

class ChildrenViewLoaded extends ChildrenViewState {
  final List<ChildrenDto> childrenDtoList;
  const ChildrenViewLoaded(this.childrenDtoList);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChildrenViewLoaded &&
        other.childrenDtoList == childrenDtoList;
  }

  @override
  int get hashCode => childrenDtoList.hashCode;
}

class ChildrenViewLoadedWithSelect extends ChildrenViewState {
  final ChildrenDto childrenDto;
  final List<ChildrenDto> childrenDtoList;
  const ChildrenViewLoadedWithSelect(this.childrenDtoList, this.childrenDto);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChildrenViewLoadedWithSelect &&
        other.childrenDtoList == childrenDtoList &&
        other.childrenDto == childrenDto;
  }

  @override
  int get hashCode => childrenDtoList.hashCode + childrenDto.hashCode;
}

class ChildrenViewLoadedWithSelectCanEdit extends ChildrenViewState {
  final ChildrenDto childrenDto;
  final List<ChildrenDto> childrenDtoList;
  final bool canEdit;
  const ChildrenViewLoadedWithSelectCanEdit(
      this.childrenDtoList, this.childrenDto, this.canEdit);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChildrenViewLoadedWithSelectCanEdit &&
        other.childrenDtoList == childrenDtoList &&
        other.childrenDto == childrenDto;
  }

  @override
  int get hashCode => childrenDtoList.hashCode + childrenDto.hashCode;
}

class ChildrenViewError extends ChildrenViewState {
  final String message;
  const ChildrenViewError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChildrenViewError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
