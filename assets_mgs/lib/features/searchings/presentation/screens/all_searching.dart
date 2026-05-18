import 'package:assets_mgs/features/searchings/presentation/screens/searched_details.dart';
import 'package:flutter/material.dart';

class AllSearching extends StatefulWidget {
  const AllSearching({super.key});

  @override
  State<AllSearching> createState() => _AllSearchingState();
}

class _AllSearchingState extends State<AllSearching> {

  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> allData = [
    {
      'title': 'Lift A',
      'type': 'Asset',
    },
    {
      'title': 'Boiler Inspection',
      'type': 'Inspection',
    },
    {
      'title': 'Fire Incident',
      'type': 'Incident',
    },
    {
      'title': 'Electrical Shock Risk',
      'type': 'Risk',
    },
    {
      'title': 'Expired Fire Certificate',
      'type': 'Certification',
    },
  ];

  List<Map<String, String>> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = allData;
  }

  void searchItems(String query) {
    final results = allData.where((item) {
      final title = item['title']!.toLowerCase();
      final type = item['type']!.toLowerCase();

      return title.contains(query.toLowerCase()) ||
          type.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredData = results;
    });
  }

  Color getTypeColor(String type) {
    switch (type) {
      case 'Asset':
        return Colors.blue;

      case 'Inspection':
        return Colors.orange;

      case 'Incident':
        return Colors.red;

      case 'Risk':
        return Colors.purple;

      case 'Certification':
        return Colors.green;

      default:
        return Colors.grey;
    }
  }

  IconData getTypeIcon(String type) {
    switch (type) {
      case 'Asset':
        return Icons.apartment;

      case 'Inspection':
        return Icons.fact_check;

      case 'Incident':
        return Icons.warning;

      case 'Risk':
        return Icons.security;

      case 'Certification':
        return Icons.verified;

      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0000BA),
        leading: SizedBox.shrink(),
        elevation: 9,
        // backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        surfaceTintColor: Colors.white,
        foregroundColor: Colors.white,
        title: const Text('Global Search'),
      ),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: searchController,
              onChanged: searchItems,
              decoration: InputDecoration(
                hintText: 'Search assets, risks, incidents...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          Expanded(
            child: filteredData.isEmpty
                ? const Center(
              child: Text('No Results Found'),
            )
                : ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {

                final item = filteredData[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),

                  child: ListTile(

                    leading: CircleAvatar(
                      backgroundColor:
                      getTypeColor(item['type']!),

                      child: Icon(
                        getTypeIcon(item['type']!),
                        color: Colors.white,
                      ),
                    ),

                    title: Text(item['title']!),

                    subtitle: Text(item['type']!),

                    trailing: IconButton(onPressed: (){
                      searchedDetails(
                        title: item['title']!,
                        type: item['type']!,
                      );
                    },
                        icon:  Icon(Icons.arrow_forward_ios),
                    )

                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}