import 'package:flutter/material.dart';

class SetupModel {

  String? image;
  String title;
  String desc;

  SetupModel({ 
    
    this.image,
    required this.title,
    required this.desc
    
 });


List<SetupModel> setUpModel(BuildContext context){

  return[

    SetupModel(
      image: "assets/images/setUp1.png",
      title: "Tell us about your baby",
      desc: "Let's start with some basic information about your little one."
    ),

    SetupModel(
      image: "assets/images/setUp4.png",
      title: "How was your baby born?",
      desc: "This helps us provide more accurate growth and health recommendations."
    ),
    SetupModel(
      image: "assets/images/setUp3.png",
      title: "Has your baby been vaccinated?",
      desc: "Vaccination helps protect your baby from serious diseases."
    ),
    SetupModel(
      title: "Select past vaccines",
      desc: "Choose the vaccines your baby has already received (if any)."
    ),
    SetupModel(
      title: "Review selected vaccines",
      desc: "Here's a summary of the vaccines you've selected. You can go back and make changes if needed."
    ),
    SetupModel(
      image: "assets/images/setUp2.png",
      title: "All set!",
      desc: "Your baby's information has been saved."
    ),

  ];

}
}
