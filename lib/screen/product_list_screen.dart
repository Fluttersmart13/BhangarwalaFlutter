import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/cubit/product_list_cubit.dart';
import 'package:flutter_demo/logic/states/product_list_state.dart';
class ProductListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(child : BlocBuilder<ProductListCubit, ProductListState>(
       builder: (context, state) {
         if (state is InitialProductListState) {
           context.read<ProductListCubit>().getData();
           return CircularProgressIndicator();
         }
         else if (state is ErrorProductListState){
           return Container(child: Text(state.error),);
         }
         else if (state is LoadedProductListState) {
           return ListView.builder(
             itemCount: state.data.length,
             itemBuilder: (BuildContext context, int index) {
               return InkWell(
                 onTap :(){
                   // Navigator.of(context).push(MaterialPageRoute(
                   //   builder: (routeContext) => TestListPage(),
                   // ));
                 },
                 child: Card(
                   child: ListTile(
                     title: Text(state.data[index].itemName!!),
                     subtitle: Text(state.data[index].categories.toString()),
                     //trailing: CheckBoxWidget(value:state.data[index].completed),
                     //trailing: Text(state.data[index].completed.toString()),

                   ),
                 ),
               ) ;
             },
           );
         }
         else {
           return Container();
         }
       },
     )),
   );
  }
}