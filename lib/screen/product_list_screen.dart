import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:flutter_demo/logic/cubit/product_list_cubit.dart';
import 'package:flutter_demo/logic/states/product_list_state.dart';
import 'package:flutter_demo/widgets/text_widgets.dart';
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
                 },
                 child: Card(
                   color: color2,
                   child: ListTile(
                     title: SimpleTextWidget(title: state.data[index].itemName!!, fontSize: 24, color: color1, fontWeight: FontWeight.bold,),
                     trailing: Container(
                         width: 50,
                         height: 50,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color: color3
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Image.network(state.data[index].image.toString()),
                         )),

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