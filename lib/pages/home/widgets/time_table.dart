import 'package:flutter/material.dart';
import 'package:homework5/models/Beers.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:homework5/models/Beers.dart';


class BeerDetailDialog extends StatelessWidget {
  final Beers beer;

  const BeerDetailDialog({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              beer.name ?? '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('ABV: ${beer.abv ?? ''}'),
            SizedBox(height: 8),
            Text('Price: ${beer.price ?? ''}'),
            SizedBox(height: 8),
            Image.network(
              beer.image ?? '',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Icon(Icons.error, color: const Color.fromARGB(255, 3, 100, 179));
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<Beers> _beers = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            var dio = Dio(BaseOptions(responseType: ResponseType.plain));
            var response = await dio.get('https://api.sampleapis.com/beers/ale');

            setState(() {
              var list = jsonDecode(response.data.toString()) as List<dynamic>;
              _beers = list.map((item) => Beers.fromJson(item)).toList();
            });
          },
          child: Text('Test API'),
        ),
        Expanded(
          child: _beers.isEmpty
              ? SizedBox.shrink()
              : ListView.builder(
                  itemCount: _beers.length,
                  itemBuilder: (context, index) {
                    var beer = _beers[index];
                    var imageURL = beer.image ?? '';
                    return ListTile(
                      title: Text(beer.name ?? ''),
                      subtitle: Text(beer.abv != null ? 'ABV: ${beer.abv}' : ''),
                      trailing: imageURL.isNotEmpty
                          ? SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                imageURL,
                                fit: BoxFit.cover,
                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  return Icon(Icons.error, color: const Color.fromARGB(255, 3, 100, 179));
                                },
                              ),
                            )
                          : SizedBox.shrink(),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => BeerDetailDialog(beer: beer),
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
