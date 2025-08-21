import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static final TextStyle style10greyM = GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.colorGreyText);

  static final TextStyle style12greyM = GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.colorGreyText);
  static final TextStyle style14greyM = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.colorGreyText);
  static final TextStyle style14greyL = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.colorGreyText);
  static final TextStyle style12mainClrL = GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.mainColor);
  static final TextStyle style12mainClrM = GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.mainColor);
  static final TextStyle style12mainClrS = GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.mainColor);
  static final TextStyle style14mainClrM = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.mainColor);
  static final TextStyle style14mainClrL = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.mainColor);
  static final TextStyle style16mainClrL = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.mainColor);
  static final TextStyle style20mainClrL = GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.mainColor);
  static final TextStyle style24mainClrL = GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.mainColor);
  static final TextStyle style14whiteM = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.colorWhiteLight);
  static final TextStyle style14whiteL = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.colorWhite);
}