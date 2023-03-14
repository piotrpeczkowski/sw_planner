import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            right: 20,
            top: 15,
            bottom: 5,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text('Ostatnia aktualizacja: 10.03.2023'),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0.2,
                blurRadius: 1.0,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    //Text('Ostatnia aktualizacja:'),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('Przykładowy tytuł zadania'),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Opis zadania:'),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      'To przykładowy opis zadania, które zostanie wykonane w przyszłości lub anulowane. Można tu zawrzeć wszystkie niezbędne informacje związane z taskiem.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
