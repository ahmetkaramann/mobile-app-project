import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.purple[900],
          title: Center(
            child: Text(
              'Gunun Falı',
              style:
                  GoogleFonts.bilboSwashCaps(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
        body: FalciUygulamasi(),
      ),
    );
  }
}

class FalciUygulamasi extends StatefulWidget {
  @override
  State<FalciUygulamasi> createState() => _FalciUygulamasiState();
}

class _FalciUygulamasiState extends State<FalciUygulamasi> {
  int falKodu = 0; // Aşk falı için gösterilecek varsayılan değer
  bool butonaTiklandi = false;

  List<String> yanitlar = [
    'TIKLA FALIN GELSİN',
    'AŞK: Bugün, aşk ve ilişki hayatınızda biraz daha temkinli olmalısın. Onu her konuda doğru anlamda anladığından da emin misin?',
    'AŞK: Aşk ve ilişki hayatınızda hakimiyeti eline almak ve birlikteliğinizi dilediğiniz gibi yönlendirmek isteyebilirsin. Bu isteğinin denge içerisindeki bir ilişkiye ne şekilde fayda edeceğini gözden geçirmelisin.',
    'AŞK: Duygularınızın bugün biraz düzensiz olduğunu görebilirsiniz. Güne, daha önce hiç yapmadığınız bir şekilde başlamanızı sağlayan doğal bir elektrik hissi var. Kalbiniz her zaman doğruyu söyler.',
    'AŞK: Duygularınız çoğu zaman rasyonel düşüncelerinize galip geliyor ve sonunda derinlerde duyguların beslediği bir karmaşa ortaya çıkıyor. Çok da mantıklı düşünerek kalbinizi görmezden gelmeyin. Amacınız bu ikisi arasında dengeyi bulmak.',
    'AŞK: Duygusal olarak kötü hissetmeyin, sezgileriniz güçlü durumda. Sevgilinizin hislerini bu sezgiler ile anlamaya çalışın. Bazen sadece eğlenmek gerekir, siz de rahatlayın ve birlikte eğlenin!',
    'PARA: Kafanıza uzun süredir koyduğunuz bazı harcamalar var, bugün kendinize bunlara gerçekten ne kadar ihtiyacınız olduğunu sorun ve bir kısmını iptal edin. Bugün bir hayır kurumuna küçücük bir bağış yapın, kendinizi çok daha iyi hissedeceksiniz.',
    'PARA: Nakit akışınızın dengesini bozabilecek dönemlere giriyoruz, bu aralar kesinlikle masa başına oturup bir bütçe hesabı yapmalısınız, önümüzdeki 3 ay boyunca gelir gider dengenizden emin olmadan hareket etmeyin',
    'PARA: Bugün, başkalarına yardım, destek ve hizmet duygunuzun yüksek olduğu bir gün olabilir, hayır, bağış işlerinde yer alabilirsiniz.',
    'PARA: Bugün kendinize güveniniz oldukça yüksek, ancak bu size pek fayda getirmeyebilir, bağlantılarınız size verdikleri destekten şüphelenebilirler. Sakin hareket edin, bir adım geri durun, ve paradan çok sağlığınızla ilgilenin.',
    'PARA: Para kaynaklarımız ile ilgili detaylar bu dönem dikkat etmelisiniz. Ayrıca maddi konularda ve harcamalarda uzun süredir sizi meşgul eden bir konuda karara varabilirsiniz, yakınlarınızdan veya eşinizden karar alırken yardım isteyin.',
    'TAVSİYE: Bugün meraklı kişiliğini ön plana çıkartarak insanlara soru sormaktan çekinme ',
    'TAVSİYE: Bugün daha önce hiç fark etmediğin şeylerin hep orada olduğunu fark edebilirsin, sadece biraz daha dikkatli olmaya çalış',
    'TAVSİYE: Bugün ikili ilişkilerinde daha aktif ve verici olmaya çalışabilirsin, aynı fikirde olduğun insanları daha dikkatli dinlemeye ve sorgulamaya başla',
    'TAVSİYE: Bugün sadece işine odaklan, dikkatini dağıtacak her türlü nesne ve sosyal medyadan uzaklaşmak kendini daha mutlu hissettirebilir',
    'TAVSİYE: Bugün tek başına biraz yürüyüş yap, çocukluğunda dinlediğin şarkıları aç ve o zamanlar oynadığın oyunları hayal et'
  ];

  void button() {
    setState(() {
      butonaTiklandi = true;

      falKodu = Random().nextInt(5) +
          1; // 2 ile 6 arasında rastgele bir sayı alıyoruz
    });
  }

  void button2() {
    setState(() {
      butonaTiklandi = true;
      falKodu = Random().nextInt(5) +
          6; // 7 ile 11 arasında rastgele bir sayı alıyoruz
    });
  }

  void button3() {
    setState(() {
      falKodu = Random().nextInt(5) +
          11; // 11 ile 15 arasında rastgele bir sayı alıyoruz
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 70.0,
            backgroundImage: AssetImage('images/falci.jpg'),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 200,
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  color: Colors.white,
                  child: TextButton(
                    onPressed: () {
                      button();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 20,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'AŞK',
                          style: GoogleFonts.adventPro(
                              color: Colors.black, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextButton(
                    onPressed: () {
                      button2();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 20,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Para Durumu',
                          style: GoogleFonts.adventPro(
                              color: Colors.black, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextButton(
                    onPressed: () {
                      button3();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.abc_sharp,
                          size: 20,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Tavsiye',
                          style: GoogleFonts.adventPro(
                              color: Colors.black, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          butonaTiklandi == false
              ? Text(
                  yanitlar[0],
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              : Text(
                  yanitlar[falKodu], // Yanıtı ekrana yazdırıyoruz
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
        ],
      ),
    );
  }
}
