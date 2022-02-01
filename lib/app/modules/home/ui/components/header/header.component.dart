import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:value_panel/app/shared/utils.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(100)),
              child: Row(
                children: [
                  Icon(
                    LineAwesomeIcons.search,
                    color: primaryColor,
                    size: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextFormField(
                        style: GoogleFonts.cairo(textStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Pesquise aqui", hintStyle: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 14, color: Colors.grey))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Badge(
                    badgeColor: gradientColors[0],
                    padding: const EdgeInsets.all(5),
                    badgeContent: Text("12",
                        style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 10))),
                    child: SvgPicture.asset(
                      'assets/images/menu/notificacoes.svg',
                      width: 20,
                      color: greyColor,
                    )),
              ),
              IconButton(
                onPressed: () {},
                icon: Badge(
                    badgeColor: gradientColors[0],
                    padding: const EdgeInsets.all(5),
                    badgeContent: Text("14",
                        style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 10))),
                    child: SvgPicture.asset(
                      'assets/images/menu/monitoramento.svg',
                      width: 20,
                      color: greyColor,
                    )),
              ),
              IconButton(
                onPressed: () {},
                icon: Badge(
                    badgeColor: gradientColors[1],
                    padding: const EdgeInsets.all(5),
                    badgeContent: Text("12",
                        style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 10))),
                    child: SvgPicture.asset('assets/images/menu/agendamento.svg', width: 23, color: greyColor)),
              )
            ],
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.only(left: 20),
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)))),
              child: Padding(
                padding: EdgeInsets.zero,
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: ImageNetwork(
                        borderRadius: BorderRadius.circular(100),
                        height: 40,
                        width: 40,
                        onLoading: Container(),
                        imageCache: const CachedNetworkImageProvider("http://uploaddeimagens.com.br/images/003/636/566/original/unnamed.png?1642545325"),
                        image: "http://uploaddeimagens.com.br/images/003/636/566/original/unnamed.png?1642545325",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "São Lucas",
                      style: GoogleFonts.cairo(textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            ),
          ),
          const VerticalDivider(
            indent: 15,
            endIndent: 15,
            width: 60,
            thickness: 0.5,
          ),
          Row(
            children: [
              SizedBox(
                width: 55,
                height: 55,
                child: ImageNetwork(
                  borderRadius: BorderRadius.circular(10),
                  height: 55,
                  width: 55,
                  onLoading: Container(),
                  imageCache: const CachedNetworkImageProvider("https://uploaddeimagens.com.br/images/003/700/538/original/272146181_6804132162995563_4295433218327981100_n.jpg"),
                  image: "https://uploaddeimagens.com.br/images/003/700/538/original/272146181_6804132162995563_4295433218327981100_n.jpg",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vagner Willian",
                      style: GoogleFonts.cairo(textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "Administrador",
                      style: GoogleFonts.cairo(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey[400])),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
