part of 'home_crud_bloc.dart';

@immutable
abstract class HomeCrudEvent {}

class HomeCrudInitialFetchEvent extends HomeCrudEvent{}

class DataSubmitted extends HomeCrudEvent {
  final String userName;
  final String userContact;
  final String userEmail;
  final String userAddress;

  DataSubmitted({
    required this.userName,
    required this.userContact,
    required this.userEmail,
    required this.userAddress,
  });
}

