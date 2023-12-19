//
//  ShelfRecordCellView.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//

import SwiftUI
import SwiftData

struct ShelfRecordCellView: View {
	@Query var recordList: [MomentRecord]
	
    let recordId: UUID
    var recordData: MomentRecord? {
        recordList.first { $0.id == self.recordId }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top, spacing: 15) {
                if let recordData = self.recordData {
					if let photoData = recordData.photos.first, let uiImage = UIImage(data: photoData) {
						Image(uiImage: uiImage)
							.resizable()
							.aspectRatio(contentMode: .fill)
							.frame(width: 90, height: 90)
							.clipShape(
								.rect(topLeadingRadius: 10.0, bottomLeadingRadius: 10.0, bottomTrailingRadius: 10.0, topTrailingRadius: 10.0)
							)
					} else {
						Image("defaultImage") // 임시 이미지
							.resizable()
							.aspectRatio(contentMode: .fill)
							.frame(width: 90, height: 90)
							.clipShape(
								.rect(topLeadingRadius: 10.0, bottomLeadingRadius: 10.0, bottomTrailingRadius: 10.0, topTrailingRadius: 10.0)
							)
					}
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(alignment: .lastTextBaseline) {
                            Text(recordData.monthAndDay)
                                .font(.medium16)
                                .foregroundStyle(Color.darkBrown)
                            Text(formattedTimeToTimeZone(timeString: recordData.time))
                                .font(.medium14)
                                .foregroundStyle(Color.darkBrown)
                                .foregroundStyle(Color.black)
                        }
                        Text("“" + recordData.paragraph + "“")
                            .font(.regular16)
                            .foregroundStyle(Color.black)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        
    }
    
    func formattedTimeToTimeZone(timeString: String) -> String {
        switch Int(timeString.prefix(2)) ?? 0 {
        case 0...5: return "새벽"
        case 6...11: return "아침"
        case 12...16: return "낮"
        case 17...23: return "밤"
        default: return "새벽"
        }
    }
}

//#Preview {
//    ShelfRecordCellView(bookdata: RecordDataStruct(date: testDate, image: "roofi", contents: "줄거리입니다.. 예.. 트렌드 코리아.."))
//}
