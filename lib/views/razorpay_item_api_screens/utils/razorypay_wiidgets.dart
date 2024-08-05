import 'package:flutter/material.dart';

class AppWidgets{
  PreferredSizeWidget? appBarView(String label,{Color? backgroundColor,bool? centerTitle,double? elevation,double? titleSpacing}){
    return AppBar(
      title: Text(label),
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      elevation: elevation,
      titleSpacing: titleSpacing,
    );

  }
  Widget textFormField({required TextEditingController? controller,TextInputType? keyboardType,String? Function(String?)? validator,int? maxLength,bool expands = false,required String? hintText}){
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      maxLength: maxLength,
      expands: expands,
      decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );
  }
  Widget elevatedButton(String text,{required void Function()? onPressed,}){
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
  Widget textButton(String text,{required void Function()? onPressed}){
    return TextButton(onPressed: onPressed, child: Text(text));
  }
  Widget sizedBox({double? height,double? width,Widget? child}){
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
  Widget defaultButton(String text,{double? height,double? width,Color? color,void Function()? onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color
        ),
        height: height,
        width: width,
        // color: color,
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}