import 'package:get/get.dart';

class Employee {
 final String name;
 var isSelected = false.obs;
 Employee({required this.name,required this.isSelected});
}