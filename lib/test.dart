import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/shared/components/constants.dart';
import 'package:untitled1/shared/network/remote/crud.dart';

class MyDataTable extends StatefulWidget {
  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable>with Crud {
  List _dataList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    print('gggg');
    //final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final response = await postRequest(linkViewNotes,{
      "empId":"1"
    });
    //final jsonData = json.decode(response.body);
    setState(() {
      _dataList = response['data'];
    });
    print(response);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Data Table'),
        ),
        body: SingleChildScrollView(
            child: DataTable(
              columns: [
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