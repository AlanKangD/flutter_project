import 'package:flutter/material.dart';

/// Starbucks 메인 색상
Color starbucksPrimaryColor = Color.fromARGB(255, 83, 184, 138);

/// Starbucs 포인트 색상
Color starbucksAccentColor = Color.fromARGB(255, 199, 176, 121);

class Starbucks extends StatefulWidget {
  const Starbucks({Key? key}) : super(key: key);

  @override
  _StarbucksState createState() => _StarbucksState();
}

class _StarbucksState extends State<Starbucks> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex, // index 순서에 해당하는 child를 맨 위에 보여줌
        children: [
          StarbucksFirstPage(),
          StarbucksSecondPage(),
          StarbucksThirdPage(),
          Center(child: Text("Starbucks 네 번째 페이지")),
          Center(child: Text("Starbucks 다섯 번째 페이지")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // 현재 보여주는 탭
        onTap: (newIndex) {
          print("selected newIndex : $newIndex");
          // 다른 페이지로 이동
          setState(() {
            currentIndex = newIndex;
          });
        },
        selectedItemColor: starbucksPrimaryColor, // 선택된 아이콘 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이콘 색상
        showSelectedLabels: false, // 선택된 항목 label 숨기기
        showUnselectedLabels: false, // 선택되지 않은 항목 label 숨기기
        type: BottomNavigationBarType.fixed, // 선택시 아이콘 움직이지 않기
        backgroundColor: Colors.white.withOpacity(0.8),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.free_breakfast), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.redeem), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ""),
        ],
      ),
    );
  }
}

/// 첫 번째 페이지
class StarbucksFirstPage extends StatelessWidget {
  const StarbucksFirstPage({Key? key}) : super(key: key);

  /// 배경 이미지 URL
  final String backImg =
      "https://i.ibb.co/2Pz33q7/2021-12-16-12-21-42-cleanup.png";

  /// Frequency 이미지 URL
  final String frequencyImg = "https://i.ibb.co/QcVn97y/2021-12-16-1-33-11.png";

  /// 추천 메뉴
  final List<Map<String, String>> recommendMenu = const [
    {
      "name": "돌체쿠키라떼",
      "imgUrl": "https://i.ibb.co/SwGPpzR/9200000003687-20211118142543832.jpg",
    },
    {
      "name": "아이스 홀리데이 돌체 쿠키 라떼",
      "imgUrl": "https://i.ibb.co/JHVXZ72/9200000003690-20211118142702357.jpg",
    },
    {
      "name": "스노우 민트 초콜릿",
      "imgUrl": "https://i.ibb.co/M91G17c/9200000003693-20211118142933650.jpg",
    },
    {
      "name": "아이스 스노우 민트 초콜릿",
      "imgUrl": "https://i.ibb.co/jyZK4C9/9200000003696-20211118143125337.jpg",
    },
    {
      "name": "스노우 민트 초콜릿 블렌디드",
      "imgUrl": "https://i.ibb.co/DKkV0rw/9200000003699-20211118143249044.jpg",
    },
  ];

  /// 크리스마스 이벤트 이미지 URL
  final String eventImg = "https://i.ibb.co/Fb0q43T/IMG-F9-BA5-CBCB476-1.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        // 우측 하단에 Deliverys 아이콘을 띄우기 위해 Stack으로 구현
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // Tip : 스크롤시 배경이 사라지게 만들면 SliverAppBar 위젯을 사용하면 됩니다.
                SliverAppBar(
                  automaticallyImplyLeading: false, // 뒤로가기 버튼 숨기기
                  pinned: true, // 스크롤시 bottom 영역을 화면 상단에 남길지 여부
                  snap: false, // 중간에 멈출 때 자동으로 AppBar를 펼쳐서 배경을 모두 보여줄지
                  floating: true, // AppBar를 화면에 띄울지, 아니면 컬럼처럼 최 상단에 놓을지
                  expandedHeight: 252, // 최대 확장되었을때 높이
                  backgroundColor: Colors.white,

                  //스크롤시 사라지는 영역
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Stack(
                      children: [
                        Positioned.fill(
                            child: Image.network(
                          backImg,
                          fit: BoxFit.fill,
                        ))
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}

/// 두 번째 페이지
class StarbucksSecondPage extends StatelessWidget {
  const StarbucksSecondPage({Key? key}) : super(key: key);

  /// 카드 이미지
  final String cardImgUrl = "https://i.ibb.co/BgfYHg4/2021-12-16-1-49-51.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Starbucks 두 번째 페이지"),
      ),
    );
  }
}

/// 세 번째 페이지
class StarbucksThirdPage extends StatelessWidget {
  const StarbucksThirdPage({Key? key}) : super(key: key);

  /// 전체 메뉴
  final List<Map<String, String>> menu = const [
    {
      "ko": "추천",
      "en": "Recommend",
      "imgUrl": "https://i.ibb.co/SwGPpzR/9200000003687-20211118142543832.jpg",
    },
    {
      "ko": "리저브 에스프레소",
      "en": "Reserve Espresso",
      "imgUrl": "https://i.ibb.co/JHVXZ72/9200000003690-20211118142702357.jpg",
    },
    {
      "ko": "리저브 드립",
      "en": "Reserve Drip",
      "imgUrl": "https://i.ibb.co/M91G17c/9200000003693-20211118142933650.jpg",
    },
    {
      "ko": "콜드브루",
      "en": "ColdBrew",
      "imgUrl": "https://i.ibb.co/jyZK4C9/9200000003696-20211118143125337.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Starbucks 세 번째 페이지"),
      ),
    );
  }
}
