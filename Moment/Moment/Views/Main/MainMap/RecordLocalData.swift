//
//  LocalName.swift
//  Moment
//
//  Created by Minjae Kim on 12/12/23.
//

import Foundation
import CoreLocation

enum LocalName: String, CaseIterable {
	case seoul = "서울특별시"
	case busan = "부산광역시"
	case daegu = "대구광역시"
	case incheon = "인천광역시"
	case gwangju = "광주광역시"
	case daejeon = "대전광역시"
	case ulsan = "울산광역시"
	case sejong = "세종특별자치시"
	case gyeonggi = "경기도"
	case gangwon_do = "강원도"
	case chungcheongbuk_do = "충청북도"
	case chungcheongnam_do = "충청남도"
	case jeollabuk_do = "전라북도"
	case jeollanam_do = "전라남도"
	case gyeongsangbuk_do = "경상북도"
	case gyeongsangnam_do = "경상남도"
	case jeju = "제주특별자치도"
	
	var coodinate: CLLocationCoordinate2D {
		switch self {
		case .seoul:
			return CLLocationCoordinate2D(latitude: 37.5518911, longitude: 126.9917937)
		case .busan:
			return CLLocationCoordinate2D(latitude: 35.2100142, longitude: 129.0688702)
		case .daegu:
			return CLLocationCoordinate2D(latitude: 35.8294374, longitude: 128.5655119)
		case .incheon:
			return CLLocationCoordinate2D(latitude: 37.4562557, longitude: 126.7052062)
		case .gwangju:
			return CLLocationCoordinate2D(latitude: 35.1557358, longitude: 126.8354271)
		case .daejeon:
			return CLLocationCoordinate2D(latitude: 36.3398175, longitude: 127.3940486)
		case .ulsan:
			return CLLocationCoordinate2D(latitude: 35.5537228, longitude: 129.2380554)
		case .sejong:
			return CLLocationCoordinate2D(latitude: 36.5606976, longitude: 127.2587334)
		case .gyeonggi:
			return CLLocationCoordinate2D(latitude: 37.5289145, longitude: 127.1727772)
		case .gangwon_do:
			return CLLocationCoordinate2D(latitude: 37.724962, longitude: 128.3009629)
		case .chungcheongbuk_do:
			return CLLocationCoordinate2D(latitude: 36.7378449, longitude: 127.8305242)
		case .chungcheongnam_do:
			return CLLocationCoordinate2D(latitude: 36.5296003, longitude: 126.8590621)
		case .jeollabuk_do:
			return CLLocationCoordinate2D(latitude: 35.7197198, longitude: 127.1243977)
		case .jeollanam_do:
			return CLLocationCoordinate2D(latitude: 34.9402001, longitude: 126.9565003)
		case .gyeongsangbuk_do:
			return CLLocationCoordinate2D(latitude: 36.3436011, longitude: 128.7401566)
		case .gyeongsangnam_do:
			return CLLocationCoordinate2D(latitude: 35.369563, longitude: 128.2570135)
		case .jeju:
			return CLLocationCoordinate2D(latitude: 33.3846216, longitude: 126.5534925)
		}
	}
}

struct RecordLocalData: Identifiable {
	let id = UUID()
	let localName: LocalName
	let coordinate: CLLocationCoordinate2D
	let imageNames: String
	
	static let dummyDatas = [
		RecordLocalData(localName: .seoul, coordinate: CLLocationCoordinate2D(latitude: 37.5111158, longitude: 127.098167), imageNames: "hoon"),
		RecordLocalData(localName: .seoul, coordinate: CLLocationCoordinate2D(latitude: 37.498097, longitude: 127.0252657), imageNames: "bono"),
		RecordLocalData(localName: .busan, coordinate: CLLocationCoordinate2D(latitude: 35.1531696, longitude: 129.118666), imageNames: "hoon"),
		RecordLocalData(localName: .busan, coordinate: CLLocationCoordinate2D(latitude: 35.1964215, longitude: 129.2153664), imageNames: "bono"),
		RecordLocalData(localName: .daegu, coordinate: CLLocationCoordinate2D(latitude: 35.8577321, longitude: 128.6251586), imageNames: "hoon"),
		RecordLocalData(localName: .daegu, coordinate: CLLocationCoordinate2D(latitude: 35.8596852, longitude: 128.4909276), imageNames: "bono"),
		RecordLocalData(localName: .incheon, coordinate: CLLocationCoordinate2D(latitude: 37.4516923, longitude: 126.7019408), imageNames: "hoon"),
		RecordLocalData(localName: .incheon, coordinate: CLLocationCoordinate2D(latitude: 37.4619316, longitude: 126.7014995), imageNames: "bono"),
		RecordLocalData(localName: .gwangju, coordinate: CLLocationCoordinate2D(latitude: 35.1542933, longitude: 126.8544584), imageNames: "hoon"),
		RecordLocalData(localName: .gwangju, coordinate: CLLocationCoordinate2D(latitude: 35.1428153, longitude: 126.8750229), imageNames: "bono"),
		RecordLocalData(localName: .daejeon, coordinate: CLLocationCoordinate2D(latitude: 36.3381738, longitude: 127.4458014), imageNames: "hoon"),
		RecordLocalData(localName: .daejeon, coordinate: CLLocationCoordinate2D(latitude: 36.3276642, longitude: 127.4272908), imageNames: "bono"),
		RecordLocalData(localName: .ulsan, coordinate: CLLocationCoordinate2D(latitude: 35.562012, longitude: 129.2301815), imageNames: "hoon"),
		RecordLocalData(localName: .ulsan, coordinate: CLLocationCoordinate2D(latitude: 35.556479, longitude: 129.2625956), imageNames: "bono"),
		RecordLocalData(localName: .sejong, coordinate: CLLocationCoordinate2D(latitude: 36.5046979, longitude: 127.2654033), imageNames: "hoon"),
		RecordLocalData(localName: .sejong, coordinate: CLLocationCoordinate2D(latitude: 36.5040885, longitude: 127.2716325), imageNames: "bono"),
		RecordLocalData(localName: .gyeonggi, coordinate: CLLocationCoordinate2D(latitude: 37.3401906, longitude: 126.7335293), imageNames: "hoon"),
		RecordLocalData(localName: .gyeonggi, coordinate: CLLocationCoordinate2D(latitude: 37.6355584, longitude: 127.2160832), imageNames: "hoon"),
		RecordLocalData(localName: .gangwon_do, coordinate: CLLocationCoordinate2D(latitude: 37.4538118, longitude: 129.1623725), imageNames: "bono"),
		RecordLocalData(localName: .gangwon_do, coordinate: CLLocationCoordinate2D(latitude: 37.8694561, longitude: 127.7444707), imageNames: "hoon"),
		RecordLocalData(localName: .chungcheongbuk_do, coordinate: CLLocationCoordinate2D(latitude: 36.9494546, longitude: 127.9083146), imageNames: "bono"),
		RecordLocalData(localName: .chungcheongbuk_do, coordinate: CLLocationCoordinate2D(latitude: 36.7219682, longitude: 127.4958842), imageNames: "hoon"),
		RecordLocalData(localName: .chungcheongnam_do, coordinate: CLLocationCoordinate2D(latitude: 36.819908, longitude: 127.1565357), imageNames: "bono"),
		RecordLocalData(localName: .chungcheongnam_do, coordinate: CLLocationCoordinate2D(latitude: 36.117623, longitude: 127.1038948), imageNames: "hoon"),
		RecordLocalData(localName: .jeollabuk_do, coordinate: CLLocationCoordinate2D(latitude: 35.8042209, longitude: 127.1024972), imageNames: "bono"),
		RecordLocalData(localName: .jeollabuk_do, coordinate: CLLocationCoordinate2D(latitude: 35.4072366, longitude: 127.3721176), imageNames: "hoon"),
		RecordLocalData(localName: .jeollanam_do, coordinate: CLLocationCoordinate2D(latitude: 35.3911021, longitude: 126.9142839), imageNames: "bono"),
		RecordLocalData(localName: .jeollanam_do, coordinate: CLLocationCoordinate2D(latitude: 35.0064798, longitude: 126.8256908), imageNames: "hoon"),
		RecordLocalData(localName: .gyeongsangbuk_do, coordinate: CLLocationCoordinate2D(latitude: 35.1596815, longitude: 128.2942985), imageNames: "bono"),
		RecordLocalData(localName: .gyeongsangbuk_do, coordinate: CLLocationCoordinate2D(latitude: 35.2036105, longitude: 128.1456443), imageNames: "hoon"),
		RecordLocalData(localName: .gyeongsangnam_do, coordinate: CLLocationCoordinate2D(latitude: 36.4379438, longitude: 128.2263061), imageNames: "bono"),
		RecordLocalData(localName: .gyeongsangnam_do, coordinate: CLLocationCoordinate2D(latitude: 36.5760207, longitude: 128.5055956), imageNames: "hoon"),
		RecordLocalData(localName: .jeju, coordinate: CLLocationCoordinate2D(latitude: 33.5070537, longitude: 126.492776), imageNames: "bono"),
		RecordLocalData(localName: .jeju, coordinate: CLLocationCoordinate2D(latitude: 33.3942945, longitude: 126.2398813), imageNames: "hoon")
	]
}


