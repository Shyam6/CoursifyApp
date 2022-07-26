import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class stats extends StatefulWidget {
  const stats({ Key? key,required this.noOfLectures,required this.lecturesFinished,required this.noOfWeeks,required this.weekdata,required this.remvlec}) : super(key: key);
   final int noOfLectures;
   final int lecturesFinished;
   final int noOfWeeks;
  final Map weekdata;
  final Map remvlec;
  @override
  State<stats> createState() => _statsState();
}

class _statsState extends State<stats> {
   @override
  
  Widget build(BuildContext context) {
    List<graphC> dat = [];
    for(var k in widget.remvlec.keys){
       dat.add(graphC(ydata: widget.remvlec[k], xdata: k));
    }
    return SafeArea (child:Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          title: Text('Current Courses',style: TextStyle(
            fontSize : 24,
            fontWeight: FontWeight.bold,
          ),),   
        ),
      body: Container(
        child: SingleChildScrollView(child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
           children:[SizedBox(height: 15),
           Text("Total Number of Lectures :"+widget.noOfLectures.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10),
          Divider(color: Colors.grey,indent: 20,endIndent: 20,),
          SizedBox(height: 10,),
            Text("Total Number of Weeks :"+widget.noOfWeeks.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            weekData(widget.weekdata,widget.lecturesFinished),
            new Divider(color: Colors.grey,indent: 20,endIndent: 20,),
             SizedBox(height: 10),
             Text('Statistic Graphs',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
             SfCartesianChart(
        
              title: ChartTitle(text: 'Reminder vs Lectures Number'),
              primaryXAxis: CategoryAxis(),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries>[
                LineSeries<graphC,String>(dataSource: dat, xValueMapper: (graphC grp ,_)=> grp.xdata, yValueMapper: (graphC grp ,_)=> grp.ydata)
              ]
             )
           ]
        )),
      ),
     

    ));
  }
}
Widget weekData(Map weekdata,num lecFin){
  List<Widget> weeks = [];
  num x = 0;
  Color tickColor = Colors.grey;
  for(var k in weekdata.keys){
    x+=weekdata[k];
    if(lecFin>=x){
      tickColor = Colors.green;
    }
     weeks.add(Row(mainAxisAlignment : MainAxisAlignment.center,children: [Text("Week "+k.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(width: 10,),Text(":",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(width: 10,),Text(weekdata[k].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(width: 10,),Icon(Icons.check,color: tickColor,)],));
     weeks.add(SizedBox(height: 30,));
     tickColor = Colors.grey;
  }
return Container(
  child: Column(crossAxisAlignment:CrossAxisAlignment.center,children: weeks,),
);
}

class graphC {
  final int ydata;
  final String xdata;
  
  graphC({required this.ydata,required this.xdata});
}




