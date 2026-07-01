import 'package:assets_mgs/config/themes/color_theme.dart';
import 'package:assets_mgs/core/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/search_entity.dart';
import '../cubit/search_cubit.dart';
import 'searched_details.dart';

class AllSearching extends StatefulWidget {
  const AllSearching({super.key});

  @override
  State<AllSearching> createState() => _AllSearchingState();
}

class _AllSearchingState extends State<AllSearching> {
  final TextEditingController searchController = TextEditingController();

  List<SearchEntity> allResults = [];
  List<SearchEntity> filteredResults = [];

  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().getAllSearch();
  }

  void filterSearch(String value) {
    if (value.trim().isEmpty) {
      setState(() {
        filteredResults = List.from(allResults);
      });
      return;
    }

    final query = value.toLowerCase();

    setState(() {
      filteredResults = allResults.where((e) {
        return (e.title ?? "").toLowerCase().contains(query) ||
            (e.subtitle ?? "").toLowerCase().contains(query) ||
            (e.type ?? "").toLowerCase().contains(query) ||
            (e.status ?? "").toLowerCase().contains(query);
      }).toList();
    });
  }

  Color getColor(String type) {
    switch (type) {
      case "ASSET":
        return Colors.blue;

      case "RISK":
        return Colors.orange;

      case "INCIDENT":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  IconData getIcon(String type) {
    switch (type) {
      case "ASSET":
        return Icons.apartment;

      case "RISK":
        return Icons.security;

      case "INCIDENT":
        return Icons.warning_amber_rounded;

      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeSurfaceColor(context),

      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text("Global Search"),
        centerTitle: true,
        backgroundColor: const Color(0xff0000BA),
        foregroundColor: Colors.white,
      ),

      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state is SearchLoaded) {
            allResults = state.search;
            filteredResults = List.from(state.search);
          }
        },

        builder: (context, state) {
          if (state is SearchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SearchError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is SearchLoaded) {
            return Column(
              children: [
                Padding(

                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: searchController,
                    onChanged: filterSearch,
                    cursorColor: themeSurfaceColor(context),
                    decoration: InputDecoration(
                      hintText:
                      "Search Asset, Risk, Incident...",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: searchController.text.isEmpty
                          ? null
                          : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          searchController.clear();
                          filterSearch("");
                        },
                      ),
                      filled: true,
                      fillColor: themeSurfaceColor(context),
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: filteredResults.isEmpty
                      ? const Center(
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 80,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "No results found",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                      : ListView.builder(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    itemCount:
                    filteredResults.length,
                    itemBuilder:
                        (context, index) {
                      final item =
                      filteredResults[index];

                      return Container(
                        margin:
                        const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color:themeSurfaceColor(context),
                          borderRadius:
                          BorderRadius.circular(
                              18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(.12),
                              blurRadius: 10,
                              offset:
                              const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding:
                          const EdgeInsets.all(
                              15),

                          leading: CircleAvatar(
                            radius: 28,
                            backgroundColor:
                            getColor(
                                item.type ??
                                    "")
                                .withOpacity(.15),
                            child: Icon(
                              getIcon(
                                  item.type ?? ""),
                              color: getColor(
                                  item.type ?? ""),
                            ),
                          ),

                          title: Text(
                            item.title ?? "",
                            style:
                            const TextStyle(
                              fontWeight:
                              FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          subtitle: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                            children: [
                              const SizedBox(
                                  height: 4),

                              Text(
                                  item.subtitle ??
                                      ""),

                              const SizedBox(
                                  height: 6),

                              Row(
                                children: [
                                  Container(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal:
                                        10,
                                        vertical:
                                        4),
                                    decoration:
                                    BoxDecoration(
                                      color: getColor(item
                                          .type ??
                                          "")
                                          .withOpacity(
                                          .15),
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          30),
                                    ),
                                    child: Text(
                                      item.type ??
                                          "",
                                      style:
                                      TextStyle(
                                        color:
                                        getColor(item.type ??
                                            ""),
                                        fontWeight:
                                        FontWeight
                                            .bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      width: 8),
                                  Text(
                                    item.status ??
                                        "",
                                    style:
                                    const TextStyle(
                                      color:
                                      Colors.grey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),

                          trailing:
                          const Icon(
                            Icons
                                .arrow_forward_ios_rounded,
                            size: 18,
                          ),

                          onTap: () {
                            // Call the static helper method instantly
                            SearchedDetails.open(item);

                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }

          return const SizedBox();
        },
      ),
      drawer: DrawerWidget(),
    );
  }
}