import 'package:flutter/material.dart';

// class CurrencyConverterMaterialPage extends StatelessWidget {
//   const CurrencyConverterMaterialPage({super.key});
class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPage();
}

class _CurrencyConverterMaterialPage
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  double exchangeRate = 100;
  var textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void updateResult() {
      setState(() {
        result = double.parse(textEditingController.text) * exchangeRate;
      });
    }

    const border = OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.white,
          width: 2,

          // style: BorderStyle.none,
          strokeAlign: BorderSide.strokeAlignOutside),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromRGBO(52, 53, 76, 0.881),
        elevation: 0,
        title: const Text(
          'Currency Converter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle:
            true, //especially for android for ios by defaault it is centered
      ),
      backgroundColor: const Color.fromRGBO(52, 53, 76, 0.881),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('../assets/images/*'),
            //Text container
            Text(
              '${result.toString()} birr',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: result < 5000 ? Colors.white : Colors.red),
            ),

            //TextField container

            //u can also use container here instead of padding
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                decoration: const InputDecoration(
                  hintText: 'please enter the amount in USD',
                  hintStyle: TextStyle(color: Colors.black38),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black38,
                  fillColor: Color.fromARGB(255, 157, 229, 244),
                  filled: true,

                  // border  for the text-field
                  enabledBorder:
                      border, // border is variable i defined at the top
                  // border when focused
                  focusedBorder: border,
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ), //to make the background color we need to make filled true

            //Buttons can be of 2 types 1.raised (action) ElevatedButton()  the only d/nce is it has an elevation property and is raised     2 text like   TextButton()

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  //we have 3 modes for our app 1. debug 2. release  3. profile
                  //to use print in debug mode we use 2 methods  `. debugPrint(onlystring)  ,if(kdebugMode)print)()
                  // debugPrint('button clicked');
                  // if (kDebugMode) print('button clicked');
                  updateResult();
                },
                // style: ButtonStyle(
                //if u use fixedSize it won't be same on s/nt devices givee fixed siz for all devices
                // fixedSize: WidgetStatePropertyAll(Size(double.infinity, 50)),   //double.infinity will occupy the max space but to see the effect don;t use fixed size
                // shape: WidgetStatePropertyAll(CircleBorder()),   //b/c circle border extends OutlinedBorder  w/c is an abstract class  we can also use RectangleBorder
// shape: WidgetStatePropertyAll(
//                     RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(7)),
//                   ),
//                   minimumSize: const WidgetStatePropertyAll(
//                     Size(double.infinity, 50),
//                   ),
//                   backgroundColor: const WidgetStatePropertyAll(Colors.black),
//                   foregroundColor: const WidgetStatePropertyAll(Colors.white),
//                  ),

                // instead of writing all this (above )to remoge widgetStatePropertyAll() there is another alternative i.e TextButton.styleFrom()

                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
