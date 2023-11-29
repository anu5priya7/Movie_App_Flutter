import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html';



 class ModifiedText  extends StatelessWidget {
   final String text;
   final Color color;
   final double size;
   final FontWeight fontWeight; // Add this line



   const ModifiedText({super.key, required this.text, required this.color,
     this.fontWeight = FontWeight.normal, required this.size, required TextOverflow overflow});


   @override
   Widget build(BuildContext context) {
     return    Text(
       text, style: GoogleFonts.breeSerif(
       color: color, fontSize: size,
       fontWeight: fontWeight,
     ),

     );

   }
 }
