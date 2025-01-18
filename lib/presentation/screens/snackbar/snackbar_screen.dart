import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo!'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
      title: const Text('Estas segudo?'),
      content: const Text('Incididunt ullamco cupidatat pariatur aliquip dolore. Ipsum deserunt elit esse duis non nulla magna sunt ullamco. Velit ullamco cupidatat ut non minim mollit dolor ex quis cillum amet ullamco labore sit. Laborum laborum pariatur dolore tempor sint. Excepteur culpa duis labore nulla esse occaecat labore. Pariatur eu in dolore irure et incididunt do enim nostrud culpa ut in officia. Labore reprehenderit ea commodo veniam id.'),
      actions: [
        TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
        FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbard y diálogos'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,


        
        children: [

          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Exercitation ipsum voluptate veniam duis sit non pariatur. Esse incididunt et proident irure labore ipsum. Pariatur est id laboris non eu exercitation sunt voluptate consectetur do non adipisicing velit. Ullamco nostrud minim id ad est culpa excepteur et. Quis incididunt aute ut aliqua ut Lorem sit mollit proident irure.')
                ]);
              },
              child: Text('Licencias usadas')),
              
          FilledButton.tonal(onPressed: () => openDialog(context), child: Text('Mostrar diálogo')),

        ],
      )),






      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showCustomSnackBar(context),
          icon: Icon(Icons.remove_red_eye_outlined),
          label: const Text('Mostrar Snackbars')),
    );
  }
}
