

import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<List<String>> {
  ListCubit(super.initialState);
  

  void addToList(){
    state.add("Sajjad Ali");
    emit(List.of(state),);
  }

  void removeToList(){
    state.removeLast();
    emit(List.of(state));
  }
}

