//
//  BookInfoDialog.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI

// MARK: - Dialog
struct BookInfodialog: View {
    @State private var offset: CGFloat = 1000
    @Binding var isActive: Bool
    let bookInfo: MomentBook

    var body: some View {
        ZStack {
            Color.black
                .opacity(0.15)
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .top) {
                    Text(bookInfo.title)
                        .font(.bold20)
                        .lineLimit(2)
                    Spacer()
                    Button {
                        withAnimation(.spring()) {
                            offset = 1000
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + CATransaction.animationDuration()) {
                            isActive = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .frame(width: 24, height: 24)
                    }
                    .tint(Color.darkBrown)
                }
                Divider()
                    .background(.darkBrown)
                    .frame(height: 1)
                HStack(alignment: .top, spacing: 10) {
                    Text("지은이")
                        .font(.medium16)
                    Text(bookInfo.author)
                        .font(.light16)
                        .lineLimit(2)
                }
                HStack(alignment: .top, spacing: 10) {
                    Text("출판사")
                        .font(.medium16)
                    Text(bookInfo.publisher)
                        .font(.light16)
                        .lineLimit(2)
                }
                HStack(alignment: .top, spacing: 10) {
                    Text("줄거리")
                        .font(.medium16)
                    ScrollView {
                        VStack {
                            Text(bookInfo.plot)
                                .font(.light16)
                        }
                    }
                    .frame(minHeight: 0, maxHeight: 200)
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal, 25)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BookInfodialog(isActive: .constant(true),
                   bookInfo: MomentBook(bookISBN: "1234",
                                        theCoverOfBook: "",
                                        title: "??????????????????????????????????????????",
                                        author: "??????",
                                        publisher: "???????",
                                        plot: """
                                            대법관은 대법원장의 제청으로 국회의 동의를 얻어 대통령이 임명한다. 모든 국민은 통신의 비밀을 침해받지 아니한다. 국회의원이 회기전에 체포 또는 구금된 때에는 현행범인이 아닌 한 국회의 요구가 있으면 회기중 석방된다.
                                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다. 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다.
                                            대한민국의 경제질서는 개인과 기업의 경제상의 자유와 창의를 존중함을 기본으로 한다. 대한민국의 국민이 되는 요건은 법률로 정한다. 헌법개정안은 국회가 의결한 후 30일 이내에 국민투표에 붙여 국회의원선거권자 과반수의 투표와 투표자 과반수의 찬성을 얻어야 한다.
                                            위원은 정당에 가입하거나 정치에 관여할 수 없다. 국회는 선전포고, 국군의 외국에의 파견 또는 외국군대의 대한민국 영역안에서의 주류에 대한 동의권을 가진다.
                                            국회는 상호원조 또는 안전보장에 관한 조약, 중요한 국제조직에 관한 조약, 우호통상항해조약, 주권의 제약에 관한 조약, 강화조약, 국가나 국민에게 중대한 재정적 부담을 지우는 조약 또는 입법사항에 관한 조약의 체결·비준에 대한 동의권을 가진다.
                                            국가의 세입·세출의 결산, 국가 및 법률이 정한 단체의 회계검사와 행정기관 및 공무원의 직무에 관한 감찰을 하기 위하여 대통령 소속하에 감사원을 둔다.
                                            선거와 국민투표의 공정한 관리 및 정당에 관한 사무를 처리하기 위하여 선거관리위원회를 둔다. 대한민국의 주권은 국민에게 있고, 모든 권력은 국민으로부터 나온다.
                                            """
                                       ))
}
