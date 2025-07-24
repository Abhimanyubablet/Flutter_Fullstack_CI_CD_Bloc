part of 'home_crud_bloc.dart';

@immutable
abstract class HomeCrudState {}

class HomeCrudInitial extends HomeCrudState {}

class HomeCrudLoading extends HomeCrudState {}

class HomeCrudSuccess extends HomeCrudState{
  final List<UserData> userData;
  HomeCrudSuccess({
    required this.userData
  });

  HomeCrudSuccess copyWith({List<UserData>? userData,}) {
    return HomeCrudSuccess(
      userData: userData ?? this.userData,
    );
  }
}

class HomeCrudError extends HomeCrudState{}


class HomeCrudUserCreateSuccess extends HomeCrudState{ }

class HomeCrudUserNotCreateError extends HomeCrudState{}


