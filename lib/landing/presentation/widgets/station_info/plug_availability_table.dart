import 'package:flutter/material.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';
import 'package:zogx_ev_app_2/landing/model/station_overview_model.dart';

List<String> plugAvailabilityTableColumn = [
  "Port type",
  "Station",
  "Price/Min",
];

class PlugAvailabilityTable extends StatelessWidget {
  final List<StationPort> portDetails;
  const PlugAvailabilityTable({super.key, required this.portDetails});

  Widget buildDots(int index, int availablePorts) {
    Widget point = const Icon(
      Icons.adjust,
      size: 16,
      color: Colors.green,
    );
    if (index >= availablePorts) {
      point = const Icon(
        Icons.adjust,
        size: 16,
        color: Colors.grey,
      );
    }
    return point;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kDefaultClipRRectRadius),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(kDefaultAllSidePadding),
            child: DataTable(
              columns: plugAvailabilityTableColumn
                  .map(
                    (title) => DataColumn(
                      label: Text(
                        title,
                      ),
                    ),
                  )
                  .toList(),
              rows: portDetails
                  .map(
                    (port) => DataRow(
                      cells: [
                        DataCell(
                          Text(
                            port.portType,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(
                          Row(
                            children: List.generate(
                              port.totalnumberOfPorts,
                              (index) => buildDots(
                                index,
                                port.portsAvailable,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            port.price,
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
