import 'package:flutter/material.dart';

import '../../core/models/assessment_model/assessment_model.dart';

class AssignmentDetails extends StatelessWidget {
  const AssignmentDetails({Key? key, required this.model}) : super(key: key);

  final AssessmentModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Subject: ${model.subject}',
                        style: const TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'Assignment: ${model.task}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 8.0),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Deadline ${model.deadline}',
                          style: const TextStyle(fontSize: 18.0)),
                      const SizedBox(width: 8.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* Card(
          child: ListTile(
            title: Text(
              widget.post.data['title'],
            ),
            subtitle: Text(widget.post.data['description']),
            trailing: Text(widget.post.data['date'.toString()]),
          ),
        ), */
