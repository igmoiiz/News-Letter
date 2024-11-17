import 'package:flutter/material.dart';
import 'package:news_letter/Models/Services/API/api_services.dart';
import 'package:provider/provider.dart';

class InterfacePage extends StatefulWidget {
  const InterfacePage({super.key});

  @override
  State<InterfacePage> createState() => _InterfacePageState();
}

class _InterfacePageState extends State<InterfacePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      // ! APP BAR OF THE APPLICATION
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      // ! BODY OF THE APPLICATION
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ApiServices>(
            builder: (context, value, child) {
              return FutureBuilder(
                future: value.fetchNews(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Align(
                      alignment: Alignment.center,
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (!snapshot.hasData ||
                      snapshot.data!.articles.isEmpty) {
                    return const Align(
                      alignment: Alignment.center,
                      child:
                          Text('Failed To Fetch Articles! Please try again!'),
                    );
                  } else {
                    final articles = snapshot.data!.articles;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Theme.of(context).colorScheme.primary,
                            child: Column(
                              children: [
                                SizedBox(height: height * 0.01),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.03),
                                  child: Text(articles[index].content),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.03),
                                  child: Divider(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.03),
                                  child: Divider(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                // ! row for source
                                Row(
                                  children: [
                                    SizedBox(width: width * 0.03),
                                    Text(
                                      'Author: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: height * 0.02,
                                      ),
                                    ),
                                    SizedBox(width: width * 0.05),
                                    Expanded(
                                      child: Text(
                                        articles[index].author.toString() ==
                                                'null'
                                            ? "Unknown Author"
                                            : articles[index].author.toString(),
                                        style: TextStyle(
                                          fontSize: height * 0.02,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
