import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get poppinsSemiBoldExtraLarge {
  return GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );
}

///////////////////////////////////////////////////////////////////////////////////////////

TextStyle get poppinsSemiBoldLarge {
  return GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
}

///////////////////////////////////////////////////////////////////////////////////////////

TextStyle get poppinsSemiBoldNormal {
  return GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18);
}

///////////////////////////////////////////////////////////////////////////////////////////

TextStyle get poppinsMediumNormal {
  return GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16);
}

///////////////////////////////////////////////////////////////////////////////////////////

TextStyle get poppinsMediumSmall {
  return GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 13);
}

///////////////////////////////////////////////////////////////////////////////////////////

TextStyle get poppinsRegularNormal {
  return GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12);
}

TextStyle get poppinsRegularSmall {
  return GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10);
}
