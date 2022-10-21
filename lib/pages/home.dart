import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DataTableSource _data = PaymentData();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: Column(
        children: [
          _searchPart(),
          Expanded(child: _paginatedDataTable()),
          Text("addf"),
          Text("addf"),
          Text("addf"),
          Text("addf"),
          Text("addf"),
        ],
      ),
    );
  }

  Widget _searchPart() => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter customer name",
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: TextField(
              decoration: InputDecoration(
                labelText: "Enter hint2",
              ),
            ),
          ),
        ],
      );

  Widget _paginatedDataTable() => SingleChildScrollView(
        child: PaginatedDataTable(
          source: _data,
          columns: const [
            DataColumn(
              label: Expanded(
                child: Text('ID'),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text('Name'),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text('P'),
              ),
            ),
          ],
          header: const Center(
            child: Text('Reservation'),
          ),
          columnSpacing: 100,
          horizontalMargin: 60,
          rowsPerPage: 10,
        ),
      );
}

class PaymentData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "id": index,
            'title': "Item $index",
            'price': Random().nextInt(10000),
          });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]['title'])),
      DataCell(Text(_data[index]['price'].toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
