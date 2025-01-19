import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
    MenuItem(
        title: 'Botones',
        subTitle: 'Varios botones en Flutter',
        icon: Icons.smart_button_outlined,
        link: '/buttons'),

  
    MenuItem(
          title: 'Tarjetas',
          subTitle: 'Un contenedor estilizado',
          icon: Icons.credit_card,
          link: '/cards'),

    MenuItem(
        title: 'ProgressIndicators',
        subTitle: 'Generales y controlados',
        icon: Icons.refresh_rounded,
        link: '/progress'),

    MenuItem(
        title: 'Snackbars y diálogos',
        subTitle: 'Indicadores en pantalla',
        icon: Icons.info_outline,
        link: '/snackbar'),

    MenuItem(
        title: 'Animated container',
        subTitle: 'Stateful widget animado',
        icon: Icons.check_box_outline_blank,
        link: '/animated'),
     MenuItem(
        title: 'UI Controls + Tiles',
        subTitle: 'Una serie de controles de Flutter',
        icon: Icons.car_rental_rounded,
        link: '/ui-controls'),
      MenuItem(
        title: 'Intruducción a la aplicación',
        subTitle: 'Pequeño tutorial introductorio',
        icon: Icons.accessible_forward_sharp,
        link: '/tutorial'),
      MenuItem(
        title: 'InfiniteScroll y Pull',
        subTitle: 'Listas infinitas y pull to refresh',
        icon: Icons.list_sharp,
        link: '/infinite'),
];
