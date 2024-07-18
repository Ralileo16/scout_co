part of 'children_view_cubit.dart';

@immutable
sealed class ChildrenViewState {
  const ChildrenViewState();
}

final class ChildrenViewInitial extends ChildrenViewState {
  const ChildrenViewInitial();
}

class ChildrenViewLoaded extends ChildrenViewState {
  final ChildrenDto childrenDto;
  const ChildrenViewLoaded(this.childrenDto);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChildrenViewLoaded && other.childrenDto == childrenDto;
  }

  @override
  int get hashCode => childrenDto.hashCode;
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
