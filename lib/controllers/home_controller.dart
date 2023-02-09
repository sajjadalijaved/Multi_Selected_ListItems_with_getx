import 'package:get/get_instance/src/lifecycle.dart';
import 'package:get/state_manager.dart';
import 'package:handle_list_with_bloc/data/employee.dart';

class HomeController extends GetxController {

  List<Employee> list = [];

  @override
  void onInit() {
    List.generate(20, (index) => list.add(Employee(name: "Sajjad  Ali", isSelected: false.obs)));
    super.onInit();
  }

  @override
  void onReady() {
   
    super.onReady();
  }
  
  @override
  void onClose() {
    super.onClose();
}

@override
  InternalFinalCallback<void> get onDelete => super.onDelete;

  @override
  InternalFinalCallback<void> get onStart => super.onStart;
}