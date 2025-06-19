import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final TextStyle sans20Bold = GoogleFonts.dmSans(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle whiteRubik30Bold = GoogleFonts.rubik(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  
  
 static final TextStyle rubik28W500 = GoogleFonts.rubik(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    
  );
   static final TextStyle greyRubik14W400  = GoogleFonts.rubik(
    fontSize: 14,
    color: AppColors.greyColor,
    fontWeight: FontWeight.w400,
  );
  static final  TextStyle whiteRubik20 = GoogleFonts.rubik(
    fontSize: 20,
    color: AppColors.whiteColor,
  );

}
