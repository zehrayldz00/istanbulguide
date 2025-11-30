import 'package:flutter/material.dart';

class TopWaveClipper extends CustomClipper<Path> {
  static const List<Offset> _wavePoints = <Offset>[
    Offset(0.0000, 0.9147),
    Offset(0.0137, 0.9225),
    Offset(0.0273, 0.9302),
    Offset(0.0410, 0.9302),
    Offset(0.0546, 0.9380),
    Offset(0.0683, 0.9302),
    Offset(0.0820, 0.9302),
    Offset(0.0956, 0.9302),
    Offset(0.1093, 0.9225),
    Offset(0.1230, 0.9225),
    Offset(0.1366, 0.9147),
    Offset(0.1503, 0.9070),
    Offset(0.1639, 0.8992),
    Offset(0.1776, 0.8915),
    Offset(0.1913, 0.8837),
    Offset(0.2049, 0.8760),
    Offset(0.2186, 0.8682),
    Offset(0.2322, 0.8605),
    Offset(0.2459, 0.8450),
    Offset(0.2596, 0.8450),
    Offset(0.2732, 0.8372),
    Offset(0.2869, 0.8295),
    Offset(0.3005, 0.8217),
    Offset(0.3142, 0.8140),
    Offset(0.3279, 0.8062),
    Offset(0.3415, 0.7984),
    Offset(0.3552, 0.7907),
    Offset(0.3689, 0.7829),
    Offset(0.3825, 0.7752),
    Offset(0.3962, 0.7752),
    Offset(0.4098, 0.7674),
    Offset(0.4235, 0.7597),
    Offset(0.4372, 0.7597),
    Offset(0.4508, 0.7519),
    Offset(0.4645, 0.7442),
    Offset(0.4781, 0.7442),
    Offset(0.4918, 0.7364),
    Offset(0.5055, 0.7364),
    Offset(0.5191, 0.7287),
    Offset(0.5328, 0.7287),
    Offset(0.5464, 0.7287),
    Offset(0.5601, 0.7287),
    Offset(0.5738, 0.7287),
    Offset(0.5874, 0.7287),
    Offset(0.6011, 0.7287),
    Offset(0.6148, 0.7364),
    Offset(0.6284, 0.7364),
    Offset(0.6421, 0.7442),
    Offset(0.6557, 0.7442),
    Offset(0.6694, 0.7519),
    Offset(0.6831, 0.7597),
    Offset(0.6967, 0.7597),
    Offset(0.7104, 0.7597),
    Offset(0.7240, 0.7597),
    Offset(0.7377, 0.7519),
    Offset(0.7514, 0.7519),
    Offset(0.7650, 0.7442),
    Offset(0.7787, 0.7364),
    Offset(0.7923, 0.7287),
    Offset(0.8060, 0.7132),
    Offset(0.8197, 0.7054),
    Offset(0.8333, 0.6977),
    Offset(0.8470, 0.6822),
    Offset(0.8607, 0.6667),
    Offset(0.8743, 0.6512),
    Offset(0.8880, 0.6279),
    Offset(0.9016, 0.6047),
    Offset(0.9153, 0.5659),
    Offset(0.9290, 0.5271),
    Offset(0.9426, 0.4651),
    Offset(0.9563, 0.4331),
    Offset(0.9650, 0.4001),
    Offset(0.9700, 0.3701),
    Offset(0.9790, 0.3401),
    Offset(0.9860, 0.3101),
    Offset(0.9900, 0.2828),
  ];

  @override
  Path getClip(Size size) {
    final path = Path();

    final double waveWidth = size.width * 0.8; // genişliğin 3/4'üne kadar çiz
    final first = _wavePoints.first;
    final last = _wavePoints.last;

    // 1) Üst kenar - soldan başla
    path.moveTo(0, 0);

    // 2) Sol kenardan dalganın başladığı noktaya in
    path.lineTo(0, size.height * first.dy);

    // 3) Dalga noktalarını soldan sağa çiz (x'ler 0..waveWidth aralığına ölçekleniyor)
    for (final p in _wavePoints) {
      final dx = waveWidth * p.dx;
      final dy = size.height * p.dy;
      path.lineTo(dx, dy);
    }

    // 4) Son noktadan, tam 3/4 genişlikte yukarıya "yumuşak" kapanış
    final double lastY = size.height * last.dy;

    path.quadraticBezierTo(
      waveWidth, lastY,   // kontrol noktası (dalganın sağ altı)
      waveWidth, 0,       // bitiş: üst kenarda, genişliğin 3/4 noktasında
    );

    // 5) Üst kenardan geri sola dön
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
