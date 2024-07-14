import 'package:bloc/bloc.dart';
import 'package:route_eco_task/cubit/product_state.dart';

import '../core/dio_helper.dart';
import '../core/strings.dart';
import '../data/models/product_model.dart';

class ProductCubit extends Cubit<ProductState>{
  ProductCubit():super(InitProductState());
  final dio =DioHelper.dio;

  List<Product> products=[];
  
  
  Future<void> getProducts()async{
    try {
      emit(GetProductLoadingState());
      final response=await dio.get(getAllProducts);
      products= Product.fromJsonList(response.data['products']);
      emit(GetProductSuccessState());
    } on Exception catch (e) {
      print(e);
      emit(GetProductErrorState());    }
  }

}





// initstate
// loading
