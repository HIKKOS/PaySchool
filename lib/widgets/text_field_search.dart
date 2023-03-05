import 'package:flutter/material.dart';
import 'package:hola_mundo/data/providers/services_provider.dart';
import 'package:provider/provider.dart';

import '../pages/global/app_colors.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({
    Key? key,
    required this.title,
    required this.funcion,
  }) : super(key: key);

  final String title;
  final Function(String) funcion;

  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesProvider>(
        builder: (context, ServiceProvider, child) => ServiceProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: AppColors.greyDark),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return List<String>.empty();
                          }
                          List<String>? options = ServiceProvider.services?.map((service) => service.nombre).toList().cast<String>();
                          return options?.where((String option) {
                                return option.toLowerCase().contains(
                                    textEditingValue.text.toLowerCase());
                              }).toList() ??
                              [];
                        },
                        onSelected: (String selection) {
                          funcion(selection);
                        },
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted) {
                          return SizedBox(
                            width: double.infinity,
                            child: TextField(
                              controller: textEditingController,
                              focusNode: focusNode,
                              onSubmitted: (_) => onFieldSubmitted(),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: title,
                                hintStyle: const TextStyle(
                                    color: AppColors.greyMedium),
                              ),
                            ),
                          );
                        },
                        optionsViewBuilder: (BuildContext context,
                            AutocompleteOnSelected<String> onSelected,
                            Iterable<String> options) {
                          final double width =
                              MediaQuery.of(context).size.width - 180;
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Material(
                              elevation: 4.0,
                              child: SizedBox(
                                width: width,
                                height: 200,
                                child: ListView.separated(
                                  separatorBuilder: (_, __) => const Divider(),
                                  padding: EdgeInsets.zero,
                                  itemCount: options.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final option = options.elementAt(index);
                                    return ListTile(
                                      title: Text(option),
                                      onTap: () {
                                        onSelected(option);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ));
  }
}
