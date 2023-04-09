import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/shared/components/components.dart';
import 'package:untitled1/shared/components/constants.dart';
import 'package:untitled1/shared/network/remote/crud.dart';

class CheckIOHistoryScreen extends StatefulWidget  {
     const CheckIOHistoryScreen({Key? key,}) : super(key: key);

  @override
  State<CheckIOHistoryScreen> createState() => _CheckIOHistoryScreenState();
}

class _CheckIOHistoryScreenState extends State<CheckIOHistoryScreen> with Crud{

  List _dataList = [];
  bool isloading=true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try{
      final response = await postRequest(linkViewNotes,{
        "empId":"${sharedPref.get('id')}"
      });
      if(response['status']=="Success!!"){
        setState(() {
          _dataList = response['data'];
          isloading=false;
        });
      }else{

      }
    }catch(error){
      defaultDialog(context: context, msg: 'Network Error', title: 'Error', type: DialogType.error);
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check IN/Out History'),
      ),
      body:isloading==true?const Center(child: CircularProgressIndicator()): SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('IN')),
            DataColumn(label: Text('Out')),
          ],
          rows: _dataList.map((data) {
            return DataRow(cells: [
              DataCell(Text(data['emp_id'].toString())),
              DataCell(Text(data['check_in_time'])),
              DataCell(Text(data['check_out_time'])),
            ]);
          }).toList(),
        ),),
    );
  }
}
