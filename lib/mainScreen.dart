
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var tfControl = TextEditingController();
  String receivedData = "";
  String pictureName = "happy.png";
  String pictureName2 = "kofte.png";
  bool switchControl = false;
  bool checkboxControl = false;
  int radioValue = 0;
  bool progressControl = false;
  double sliderCount = 30.0;
  var tfTime = TextEditingController();
  var tfDate = TextEditingController();
  var allCountry = <String>[];
  var selectedCountry = "Turkey";


  @override
  void initState() {
    super.initState();
    allCountry.add("Turkey");
    allCountry.add("Japan");
    allCountry.add("Italy");
    allCountry.add("Spain");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widgets"),),
      body: SingleChildScrollView( // for scroll feature
        child: Center(child: Column(children: [
          Text(receivedData),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: tfControl, 
              decoration: const InputDecoration(hintText: "Lütfen Giriniz"),
              keyboardType: TextInputType.number,
              obscureText: true, // maskeleme için
              ),
          ),
            ElevatedButton(onPressed: (){
              setState(() {
                receivedData = tfControl.text;
              });
            }, child: const Text("Veri AL")),
        
            
        
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    pictureName = "happy.png";
                  });
                }, child: const Text("Picture 1")),
        
                Image.asset("pictures/$pictureName"),
                
        
                ElevatedButton(onPressed: (){
                  setState(() {
                    pictureName = "unhappy.png";
                  });
                }, child: const Text("Picture 2")),
              ],
            ),
            
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    pictureName2 = "kofte.png";
                  });
                }, child: const Text("Picture 1")),
                
                SizedBox(width: 48, height: 48,
                child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/$pictureName2"),
                ),
                
        
                ElevatedButton(onPressed: (){
                  setState(() {
                    pictureName2 = "pizza.png";
                  });
                }, child: const Text("Picture 2")),
              ],
            ),
        
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 150,
                  child: SwitchListTile(
                    title: const Text("dart"),
                    controlAffinity: ListTileControlAffinity.leading,
                    inactiveThumbColor: Colors.amber,
                    inactiveTrackColor: Colors.blue,
                    activeTrackColor: Colors.black,
                    activeColor: Colors.blueGrey,
                    value: switchControl, 
                    onChanged: (veri){
                      setState(() {
                        switchControl = veri;
                      });
                    }
                    ),
                ),
                SizedBox(width: 150,
                  child: CheckboxListTile(
                    title: const Text("flutter"),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: checkboxControl, 
                    onChanged: (veri){
                      setState(() {
                        checkboxControl = veri ?? false;
                      });
                    }
                    ),
                ),
              ],
            ),
        
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 180,
                  child: RadioListTile(
                    title: const Text("Barcelona"),
                    value: 1,
                    groupValue: radioValue, 
                    onChanged: (veri){
                      setState(() {
                        radioValue = veri!;
                      });
                    }
                    ),
                ),
                SizedBox(width: 180,
                  child: RadioListTile(
                    title: const Text("Madrid"),
                    value: 2,
                    groupValue: radioValue,  
                    onChanged: (veri){
                      setState(() {
                        radioValue = veri!;
                      });
                    }
                    ),
                ),
              ],
            ),
        
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    progressControl = true;
                  });
                }, child: const Text("START")),
                
                Visibility(visible: progressControl, child: const CircularProgressIndicator(
                  color: Colors.amber,
                )),
        
                ElevatedButton(onPressed: (){
                  setState(() {
                    progressControl = false;
                  });
                }, child: const Text("STOP")),
              ],
            ),
        
            Text(sliderCount.toInt().toString()),
            Slider(max: 100.0, min: 0.0, value: sliderCount, onChanged: (veri){
              setState(() {
                sliderCount = veri;
              });
            }),
        
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox( width: 120,
                  child: TextField(controller: tfTime, decoration: InputDecoration(hintText: "Time"),)
                ),
                IconButton(onPressed: (){
                  showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now())).
                  then((value) {
                    tfTime.text = "${value!.hour} : ${value.minute}";
                  });
                }, icon: const Icon(Icons.timer_outlined)),
        
                SizedBox( width: 120,
                  child: TextField(controller: tfDate, decoration: InputDecoration.collapsed(hintText: "Date"),)
                ),
                IconButton(onPressed: (){
                  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100)).
                  then((value) {
                    tfDate.text = "${value!.day}/${value.month}/${value.year}";
                  });
                }, icon: const Icon(Icons.date_range_outlined)),
        
              ],
            ),
        
            DropdownButton(
              value: selectedCountry,
              icon: const Icon(Icons.arrow_drop_down),
              items: allCountry.map((country) {
                return DropdownMenuItem(value: country ,child: Text(country));
              }).toList(), 
              onChanged: (veri){
                setState(() {
                  selectedCountry = veri!;
                });
              }
            ),
        
            GestureDetector(
              onTap: () {
                print("one click");
              },
              onDoubleTap: () {
                print("double click");
              },
              onLongPress: (){
                print("long click");
              },
              child: Container(width: 200, height: 200, color: Colors.amber,)),
        
            ElevatedButton(onPressed: (){
                  //setState(() {
                    print("****************");
                    print("Switch Control: $switchControl");
                    print("Checkbox Control: $checkboxControl");
                    print("RadioButton Control: $radioValue");
                    print("Slider Control: $sliderCount");
                    print("SelectedCountry Control: $selectedCountry");
                  //});
                }, child: const Text("Print")),
        
        ],)),
      ),
    );
  }
}