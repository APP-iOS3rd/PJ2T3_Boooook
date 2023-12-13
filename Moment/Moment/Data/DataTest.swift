//
//  DataTest.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import Foundation

struct UserData {
	var recordList: [MyRecord]
	var bookList: [MyBook]
	
	static let mangjaeData: UserData = UserData(
		recordList: [
			MyRecord(latitude: 37.5111158, longitude: 127.098167, localName: "서울특별시", myLocation: "어디지", dateTime: Date(), paragraph: "없어", page: 0, commentary: "생각안나..", bookISBN: "1"),
			MyRecord(latitude: 35.1531696, longitude: 129.118666, localName: "부산광역시", myLocation: "어딜까", dateTime: Date(), paragraph: "없어", page: 0, commentary: "안읽을래...", bookISBN: "2"),
			MyRecord(latitude: 37.4516923, longitude: 126.7019408, localName: "인천광역시", myLocation: "거기야", dateTime: Date(), paragraph: "인용아..", page: 0, commentary: "줄거리...", bookISBN: "3"),
			MyRecord(latitude: 35.1542933, longitude: 126.8544584, localName: "광주광역시", myLocation: "맞을거야", dateTime: Date(), paragraph: "인용이니?", page: 0, commentary: "도너츠먹을래?", bookISBN: "4"),
			MyRecord(latitude: 36.3381738, longitude: 127.4458014, localName: "대전광역시", myLocation: "대한민국 어딘가..", dateTime: Date(), paragraph: "인용엄마..", page: 0, commentary: "여기 재미없죠..? 아이스크림 먹으러갈래요?", bookISBN: ""),
			MyRecord(latitude: 35.562012, longitude: 129.2301815, localName: "울산광역시", myLocation: "지구안에..", dateTime: Date(), paragraph: "국이짜...", page: 0, commentary: "인생..쓰다..", bookISBN: "5"),
			MyRecord(latitude:  37.45766217985301, longitude: 126.68091719342598, localName: "인천광역시", myLocation: "영화가 더 즐거웠던 곳", dateTime: Date(), paragraph: "왜 울었는데.. 양파 때문에..", page: 0, commentary: "봄이 사람으로 내어난다면.. 어쩌면 그 사람은 바로 김민재가 아닐까?", bookISBN: "1"),
			MyRecord(latitude: 37.445627353698406, longitude: 126.44907825009803, localName: "인천광역시", myLocation: "여행가기 전 설레였던 곳", dateTime: Date(), paragraph: "창준 좋아하지마. 그게 뭔데", page: 0, commentary: "나 몰랐는데 이창준 좋아하네", bookISBN: "2"),
			MyRecord(latitude: 37.4366018335973, longitude: 126.69311955289342, localName: "인천광역시", myLocation: "랜더스가 승리할 랜더스필드", dateTime: Date(), paragraph: "세희 넌 뭐랄까.. 마치 베를린 같아. 왜냐하면 치명적인 독일 수도.", page: 0, commentary: "홍세희 MBTI 검사하면 SEXY 나온다며", bookISBN: "3"),
			MyRecord(latitude: 37.44019903953789, longitude: 126.69745533078294, localName: "인천광역시", myLocation: "내가 나온 고등학교", dateTime: Date(), paragraph: "짜장면한테 대홍 음악을 들려 줬더니 짜장면이 저절로 비벼졌습니다.", page: 0, commentary: "백대홍이 승마장 출입금지당했어요... 왜인지 알아요?  백대홍이 외모 보면 말이 안 나와서...", bookISBN: "4"),
			MyRecord(latitude: 37.53275998815964, longitude: 126.63404101767888, localName: "인천광역시", myLocation: "인천에서 가는데 한시간 반 걸리는 인천", dateTime: Date(), paragraph: "민재 사진 보다가 심장 녹을까봐 냉동실에서 사진 보는 중이에요;;", page: 0, commentary: "김민재 땜에 전쟁 났어요. 아름다워(war), 귀여워(war), 사랑스러워(war)", bookISBN: "5"),
			
			MyRecord(latitude: 37.5111158, longitude: 127.098167,
					 localName: "서울특별시", myLocation: "나의 기억 01",
					 dateTime: Date(), paragraph: "가나다라마바사", page: 123,
					 commentary: "하하하ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ", bookISBN: "5"),
			MyRecord(latitude: 37.498097, longitude: 127.0252657,
					 localName: "서울특별시", myLocation: "나의 기억 02",
					 dateTime: Date(), paragraph: "아자차카타파하", page: 11,
					 commentary: "더미데이터 만들기도 힘들어", bookISBN: "1"),
			
			MyRecord(latitude: 33.3942945, longitude: 126.2398813,
					 localName: "제주특별자치도", myLocation: "나의 기억 03",
					 dateTime: Date(), paragraph: "인생은 실전이다", page: 42,
					 commentary: "듣고있나 잼민이들?", bookISBN: "5"),
			MyRecord(latitude: 33.5070537, longitude: 126.492776,
					 localName: "제주특별자치도", myLocation: "나의 기억 04",
					 dateTime: Date(), paragraph: "사람을 화나게 하는데에는..", page: 18,
					 commentary: "말을 끝까지 해야 할거 아냐....", bookISBN: "4"),
			
			MyRecord(latitude: 36.4379438, longitude: 128.2263061,
					 localName: "경상남도", myLocation: "나의 기억 05",
					 dateTime: Date(), paragraph: "떨어진 돌을 줍지마라", page: 34,
					 commentary: "도대체 어떤 놈이 떨어진 돌을 줍고 다닐까..?", bookISBN: "3"),
			MyRecord(latitude: 36.5760207, longitude: 128.5055956,
					 localName: "경상남도", myLocation: "나의 기억 06",
					 dateTime: Date(), paragraph: "선빵필승", page: 54,
					 commentary: "경남에서 읽기 좋은 구절이다 참..", bookISBN: "4"),
			
			MyRecord(latitude: 35.2036105, longitude: 128.1456443,
					 localName: "경상북도", myLocation: "나의 기억 07",
					 dateTime: Date(), paragraph: "거너더러머버서", page: 78,
					 commentary: "어저처커터퍼허", bookISBN: "2"),
			MyRecord(latitude: 35.1596815, longitude: 128.2942985,
					 localName: "경상북도", myLocation: "나의 기억 08",
					 dateTime: Date(), paragraph: "엄마!!!!!!!!", page: 1,
					 commentary: "엄매!!!!!!!!!!!!!!!!!!!", bookISBN: "4"),
			
			MyRecord(latitude: 35.0064798, longitude: 126.9142839,
					 localName: "전라남도", myLocation: "나의 기억 09",
					 dateTime: Date(), paragraph: "패딩 없는 거 킹받아요", page: 198,
					 commentary: "by 정인선", bookISBN: "1"),
			MyRecord(latitude: 35.3911021, longitude: 128.5055956,
					 localName: "전라남도", myLocation: "나의 기억 10",
					 dateTime: Date(), paragraph: "타입으로 만들 수 있다.", page: 74,
					 commentary: "앞 뒤 없이 뭘 만든다는거람..", bookISBN: "2"),
			
			MyRecord(latitude: 35.4072366, longitude: 127.3721176,
					 localName: "전라북도", myLocation: "나의 기억 11",
					 dateTime: Date(), paragraph: "자니..?", page: 44,
					 commentary: "미친놈인가.. 자니는 좀 에 - 바", bookISBN: "1"),
			MyRecord(latitude: 35.8042209, longitude: 127.1024972,
					 localName: "전라북도", myLocation: "나의 기억 12",
					 dateTime: Date(), paragraph: "아.. 맥도날드", page: 28,
					 commentary: "맥날은 맥모닝과 해시브라운이지", bookISBN: "4"),
			
			MyRecord(latitude: 36.117623, longitude: 127.1038948,
					 localName: "충청남도", myLocation: "나의 기억 13",
					 dateTime: Date(), paragraph: "이 책을 마무리하며...", page: 347,
					 commentary: "후 슈바 드디어 다 읽었다..", bookISBN: "4"),
			MyRecord(latitude: 36.819908, longitude: 127.1565357,
					 localName: "충청남도", myLocation: "나의 기억 14",
					 dateTime: Date(), paragraph: "장사를 망치는 법", page: 120,
					 commentary: "망치고 싶지 않아..", bookISBN: "3"),
			
			MyRecord(latitude: 36.9494546, longitude: 127.9083146,
					 localName: "충청북도", myLocation: "나의 기억 15",
					 dateTime: Date(), paragraph: "ㄴㅁㅇㄹㄴㅎㅁㄴㅇ", page: 232,
					 commentary: "ㅁㄴㅇ로노먀홈나ㅣ허ㅣ", bookISBN: "3"),
			MyRecord(latitude: 36.7219682, longitude: 127.4958842,
					 localName: "충청북도", myLocation: "나의 기억 16",
					 dateTime: Date(), paragraph: "ㄴ머ㅗ야려화ㅣㅎㄴㅁ", page: 11,
					 commentary: "ㄴㅁㅇ햐ㅓㅙ먀넏너ㅣㅈㅂ,ㅡ", bookISBN: "1"),
			
			MyRecord(latitude: 37.8694561, longitude: 127.7444707,
					 localName: "강원도", myLocation: "나의 기억 17",
					 dateTime: Date(), paragraph: "마ㅓㅣ히ㅏㅁ낳어ㅣㅏ", page: 37,
					 commentary: "ㅁㄴㅇ허ㅣㅏㅁ넝하ㅣㅓ;멓;'ㅣ하ㅓㅁ니;ㅏㅓ허ㅣㅏㅁ;", bookISBN: "2"),
			MyRecord(latitude: 37.4538118, longitude: 129.1623725,
					 localName: "강원도", myLocation: "나의 기억 18",
					 dateTime: Date(), paragraph: "아우 드디어 됐네 ㅆ", page: 77,
					 commentary: "2023년 12월 13일 수요일 14:50 홍세희 발언", bookISBN: "5"),
			
			MyRecord(latitude: 37.6355584, longitude: 127.2160832,
					 localName: "경기도", myLocation: "나의 기억 19",
					 dateTime: Date(), paragraph: "김민재", page: 85,
					 commentary: "짜장면한테 김민재 음악을 들려 줬더니 짜장면이 저절로 비벼졌습니다.", bookISBN: "5"),
			MyRecord(latitude: 37.3401906, longitude: 126.7335293,
					 localName: "경기도", myLocation: "나의 기억 20",
					 dateTime: Date(), paragraph: "김민재재", page: 234,
					 commentary: "김민재는 미술관 입장료 안받고 들어가도 돼 왜냐면 김민재가 작품이야", bookISBN: "3"),
			
			MyRecord(latitude: 36.5046979, longitude: 127.2654033,
					 localName: "세종특별자치시", myLocation: "나의 기억 21",
					 dateTime: Date(), paragraph: "홍세희", page: 145,
					 commentary: "홍세희 넌 뭐랄까.. 마치 베를린 같아. 왜냐하면 치명적인 독일 수도.", bookISBN: "4"),
			MyRecord(latitude: 36.5040885, longitude: 127.2716325,
					 localName: "세종특별자치시", myLocation: "나의 기억 22",
					 dateTime: Date(), paragraph: "밥세희", page: 34,
					 commentary: "봄이 사람으로 내어난다면.. 어쩌면 그 사람은 바로 홍세희가 아닐까?", bookISBN: "2"),
			
			MyRecord(latitude: 35.556479, longitude: 129.2625956,
					 localName: "울산광역시", myLocation: "나의 기억 23",
					 dateTime: Date(), paragraph: "백대홍", page: 27,
					 commentary: "백대홍 그거 기억나요? 사람들 한테 백대홍 좋아하는 사람 손 접어 했더니 지구가 반으로 접힌거 \n그거 겨우겨우 되돌렸잖아요 나 그 때 내 눈 앞에 브라질 있어서 깜짝 놀랐잖아", bookISBN: "4"),
			MyRecord(latitude: 35.562012, longitude: 129.2301815,
					 localName: "울산광역시", myLocation: "나의 기억 24",
					 dateTime: Date(), paragraph: "넬츄파파", page: 88,
					 commentary: "백대홍이한테는 벽이 느껴져, 완벽", bookISBN: "1"),
			
			MyRecord(latitude: 36.3276642, longitude: 127.4272908,
					 localName: "대전광역시", myLocation: "나의 기억 25",
					 dateTime: Date(), paragraph: "정인선", page: 23,
					 commentary: "정인선씨 예민한 질문일 수 도 있지만 너무 궁금해서 물어봅니다.\n정인선씨는 천국에서 쫓겨난 건가요 자발적으로 내려온 건가요\n아님 추락 사고 였나요?", bookISBN: "3"),
			MyRecord(latitude: 36.3381738, longitude: 127.4458014,
					 localName: "대전광역시", myLocation: "나의 기억 26",
					 dateTime: Date(), paragraph: "인센", page: 0,
					 commentary: "정인선이 좋아하는 사람 손들어보라고 하니까 지구가 성게가 됐대", bookISBN: "2"),
			
			MyRecord(latitude: 35.1531696, longitude: 129.118666,
					 localName: "부산광역시", myLocation: "나의 기억 27",
					 dateTime: Date(), paragraph: "타코", page: 99,
					 commentary: "산타가 나에게 물었다. '얘야, 어떤 선물을 갖고 싶니?' 나는 웃으며 말했다. \n'100억이요!' 그러자 산타는 '좀 더 특별한건 없니?' 라고 되물었다. \n나는 대답했다. '... 정인선을 그만 사랑하는 방법이요..'\n그러자 산타는 미소지으며 말했다. '계좌번호좀 불러줄래?'", bookISBN: "1"),
			MyRecord(latitude: 35.1964215, longitude: 129.2153664,
					 localName: "부산광역시", myLocation: "나의 기억 28",
					 dateTime: Date(), paragraph: "강치우", page: 72,
					 commentary: "봄이 사람으로 내어난다면.. 어쩌면 그 사람은 바로 강치우가 아닐까?", bookISBN: "5"),
			
			MyRecord(latitude: 35.8577321, longitude: 128.6251586,
					 localName: "대구광역시", myLocation: "나의 기억 29",
					 dateTime: Date(), paragraph: "ㅇㅎㄴㄹㄹㄹㄹ", page: 231,
					 commentary: "ㄴㅇㄹㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅇㄹ농ㄹ노ㅓ", bookISBN: "5"),
			MyRecord(latitude: 35.8596852, longitude: 128.4909276,
					 localName: "대구광역시", myLocation: "나의 기억 30",
					 dateTime: Date(), paragraph: "ㅁSfasgearwe", page: 111,
					 commentary: "dfsgjkldsjgkldslknhkladsfasdgdsgsdsgdfgsdgdsgsdgfsdhr", bookISBN: "3"),
			
			MyRecord(latitude: 37.4516923, longitude: 126.7019408,
					 localName: "인천광역시", myLocation: "나의 기억 31",
					 dateTime: Date(), paragraph: "sjlklkk", page: 22,
					 commentary: "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", bookISBN: "3"),
			MyRecord(latitude: 37.4619316, longitude: 126.7014995,
					 localName: "인천광역시", myLocation: "나의 기억 32",
					 dateTime: Date(), paragraph: "11111111111111111111111111", page: 91,
					 commentary: "2222222222222222222222222222222222222222222", bookISBN: "1"),
			
			MyRecord(latitude: 35.1542933, longitude: 126.8544584,
					 localName: "광주광역시", myLocation: "나의 기억 33",
					 dateTime: Date(), paragraph: "헤헤헤헿", page: 64,
					 commentary: "ㄴㅁㅇ허ㅜ라ㅣㅁ노ㅓ하ㅣㅓ나ㅓ히ㅏㅓㅁ지ㅏㄷ", bookISBN: "2"),
			MyRecord(latitude: 35.1428153, longitude: 126.8750229,
					 localName: "광주광역시", myLocation: "나의 기억 34",
					 dateTime: Date(), paragraph: "ㄴㅁㅇㄹㅎㅁㄴㅎㄴㅁㅇㅎ", page: 98,
					 commentary: "호로로로로로로로로로ㅗㄹㄹ", bookISBN: "4"),
		],
		bookList: [
			MyBook(bookISBN: "1", theCoverOfBook: "dummyBookImage01", title: "햄버거", author: "이창준", publisher: "한빛미디어", plot: ""),
			MyBook(bookISBN: "2", theCoverOfBook: "bono", title: "피자", author: "김민재", publisher: "우렁찬", plot: ""),
			MyBook(bookISBN: "3", theCoverOfBook: "roofi", title: "치킨", author: "정인선", publisher: "신호등", plot: ""),
			MyBook(bookISBN: "4", theCoverOfBook: "hoon", title: "파스타", author: "백대홍", publisher: "RGB", plot: ""),
			MyBook(bookISBN: "5", theCoverOfBook: "bookex1", title: "샌드위치", author: "밥세희", publisher: "Apple", plot: "")
		])
}

struct MyRecord: Identifiable, Hashable {
	var id = UUID()
	var latitude: Double
	var longitude: Double
	var localName: String
	var myLocation: String
	var dateTime: Date
	var paragraph: String
	var page: Int
	var commentary: String
	var photos: [Data]?
	var bookISBN: String
}

struct MyBook: Hashable {
	var bookISBN: String
	var theCoverOfBook: String
	var title: String
	var author: String
	var publisher: String
	var plot: String
}
