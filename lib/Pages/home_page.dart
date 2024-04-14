import 'package:bmi_calculator/Widgets/custom_snack_bar.dart';
import 'package:bmi_calculator/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Widgets/custom_alert_dialogBox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  // Constrollers
  final TextEditingController weightEditingController = TextEditingController();
  final TextEditingController heightInFeetEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 3,
      ),
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              CustomTextField(textEditingController: weightEditingController, textFieldLabel: 'Weight in Kg', textFieldIcon: Icons.line_weight),

              CustomTextField(textEditingController: heightInFeetEditingController, textFieldLabel: 'Height in Feet', textFieldIcon: Icons.height_rounded),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: (){
                    _calculateBMI();
                  }, 
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    )
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  _calculateBMI(){
    String weight = weightEditingController.text;
    String heightInFt = heightInFeetEditingController.text;

    if(weight.isNotEmpty && heightInFt.isNotEmpty){

      int intWeight = int.parse(weight);
      int intHeightInFt = int.parse(heightInFt);

      int totalInches = intHeightInFt*12; // Getting total Inches
      double totalCentimeter = totalInches*2.54;    // Getting total Centimeter from total inches
      double totalMeter = totalCentimeter/100;  // Getting total meter from centimeter


      double bmiValue = intWeight/(totalMeter*totalMeter);   // Like : weight* height_in_meter^2
      String simpleResult;

      // Simplifying BMI result
      if(bmiValue>25){
        simpleResult = 'Overweighted';
      }else if(bmiValue>18){
        simpleResult = 'Healthy';
      }else{
        simpleResult = 'Underweighted';
      }
      CustomDialogBox.showDialogBox(context, bmiValue, simpleResult);
    }else{
      CustomSnackBar snackBarObject =  CustomSnackBar(snackBarContent: 'All fields must be required !!', snackBarBackgroundColor: Theme.of(context).colorScheme.inversePrimary);

      ScaffoldMessenger.of(context).showSnackBar(snackBarObject.showSnackBar());
    }
  }

  
}