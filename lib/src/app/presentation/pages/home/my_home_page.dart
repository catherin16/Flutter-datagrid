import 'dart:html';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Employee> _employees;
  late EmployeeDataSource _employeeDataSource;

  @override
  void initState() {
    _employees = geetEmployeData();
    _employeeDataSource = EmployeeDataSource(_employees);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfDataGrid(
        
        source: _employeeDataSource,
      
        columns: [
          GridTextColumn(columnName: 'id', label: 
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19.0),
           alignment: Alignment.centerRight,
          child: Text('ID', overflow: TextOverflow.ellipsis,),
           )
          ),
          GridTextColumn(columnName: 'name', label: 
           Container(
             padding:  EdgeInsets.symmetric(horizontal: 19.0),
             alignment: Alignment.centerLeft,
             child: Text('Name', overflow: TextOverflow.ellipsis,),
           )
          ),
          GridTextColumn(columnName: 'designation', label: 
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19.0),
            alignment: Alignment.centerLeft,
            child: Text('Designation', overflow: TextOverflow.ellipsis,),
          )
          ),
          GridTextColumn(columnName: 'salary', label: 
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19.0),
            alignment: Alignment.centerRight,
            child: Text('Salary', overflow: TextOverflow.ellipsis,),
          )
          
          )
        ],
      ),
    ));
  }

  List<Employee> geetEmployeData() {
    return [
      Employee(10002, 'Juana', 'Proyect lead', 2500),
      Employee(10063, 'Pablo', 'Developer', 4000),
      Employee(10082, 'Jose', 'Designer', 1500),
      Employee(10982, 'Maria', 'Sr Develpoper', 2555),
    ];
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(List<Employee> employees) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRows) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: dataGridRows.id),
              DataGridCell<String>(columnName: 'name', value: dataGridRows.name),
              DataGridCell<String>(columnName: 'designation', value: dataGridRows.designation),
              DataGridCell<int>(columnName: 'salary', value: dataGridRows.salary),
            ]))
        .toList();
  }
  late List<DataGridRow> dataGridRows;

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 19.0),
        alignment: (dataGridCell.columnName == 'id' ||
        dataGridCell.columnName == 'salary')
        ? Alignment.centerRight
        :Alignment.centerLeft,
        child: Text(dataGridCell.value.toString(),
        overflow: TextOverflow.ellipsis,
        ),
        
      );
    }).toList());
  }
}

class Employee {
  final int id;
  final String name;
  final String designation;
  final int salary;

  Employee(this.id, this.name, this.designation, this.salary);
}
