import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../model/home_crud_model.dart';
import '../service_controller/home_crud_service_controller.dart';

part 'home_crud_event.dart';
part 'home_crud_state.dart';

class HomeCrudBloc extends Bloc<HomeCrudEvent, HomeCrudState> {
  final HomeCrudServiceController homeCrudServiceController;
  HomeCrudBloc(this.homeCrudServiceController) : super(HomeCrudInitial()) {
    on<HomeCrudInitialFetchEvent>(_homeCrudInitialFetchEvent);
    on<DataSubmitted>(_onSubmitted);
  }

  Future<void> _homeCrudInitialFetchEvent(HomeCrudInitialFetchEvent event, Emitter<HomeCrudState> emit ) async {
    try{
      emit(HomeCrudLoading());
      final userData = await homeCrudServiceController.homeCrudControllerApi();
      emit(HomeCrudSuccess(
          userData: userData
      ));
    } catch(e){
      print(e);
      emit(HomeCrudError());
      rethrow;
    }
  }

  Future<void> _onSubmitted(DataSubmitted event, Emitter<HomeCrudState> emit) async {
    try {
      final isSuccess = await homeCrudServiceController.createUserControllerApi(
        event.userName,
        event.userContact,
        event.userEmail,
        event.userAddress,
      );

      if (isSuccess) {
        emit(HomeCrudUserCreateSuccess());

        add(HomeCrudInitialFetchEvent());
      } else {
        emit(HomeCrudUserNotCreateError());
      }
    } catch (e) {
      print("API error: $e");
      emit(HomeCrudUserNotCreateError());
    }
  }

}

