//
//  ContentView.swift
//  MyResume
//
//  Created by A Leng on 2023/6/4.
//

import SwiftUI

struct ContentView: View {
    
    let me = Resume.shared
    @State var isShowingContact = false
    
    var body: some View {
        ScrollView{
            VStack (spacing: 30)/*此VStack內,每隔間距:30*/{
                
                cardView
                
                Text(me.bio).font(.title2).lineSpacing(10)  //字體大小,行距:10
                
                Button{
                    isShowingContact = true
                } label: {
                    Text("Contact Me")
                        .foregroundColor(.white)  //字體顏色
                        .font(.title.weight(.heavy))  //字體大小,粗體
                        .frame(maxWidth: .infinity)  //調整大小:最大寬度
                        .padding(.vertical, 10)  //垂直留白:10
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.brown))  //背景:圓角20,顏色:咖啡色)
                }
                
                Text("Skill")
                    .font(.title.weight(.heavy))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                //let skill = me.skills.first!
                
                skillView
                
                Text("Interest")
                    .font(.title.weight(.heavy))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                interestView
                
                Text("Experience")
                    .font(.title.weight(.heavy))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                experienceView
                
            }.padding()//此VStack內,預設間隔
                .overlay(Color.black.opacity(isShowingContact ? 0.3 : 0))
                .onTapGesture { isShowingContact = false }
                .overlay(alignment: .top ){
                    contactView
                }
                .animation(.spring(), value: isShowingContact)
        }.background(Color(uiColor: .secondarySystemBackground))
    }
    
    // MARK: - subViews
    
    var cardView: some View{
        HStack{
            Image("avatar")
                .resizable().aspectRatio(contentMode: .fit)  //圖片可調整,依比例
                .clipShape(Circle())  //才切圖片:圓形
                .frame(width: 200)  //調整大小:200
            VStack (spacing: 20)/*此VStack內,每隔間距:20*/{
                Text(me.name)
                    .font(.title.bold())  //字體大小,粗體
                Text(me.title)
                Label(me.location, systemImage:"location.fill")
                    .foregroundColor(.secondary)  //systemImage使用圖片:圖面名稱,顏色:淡色
            }
        }
    }
    
    var skillView: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(me.skills, id: \.self){ skill in
                    VStack{
                        Image(skill).resizable().aspectRatio(contentMode: .fit)
                            .frame(width:  50)
                        Text(skill)
                    }.frame(width: 100)
                }
            }
        }
    }
    
    var interestView: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(me.interest, id: \.self){ skill in
                    VStack{
                        Image(skill).resizable().aspectRatio(contentMode: .fit)
                            .frame(width:  50)
                        Text(skill)
                    }.frame(width: 100)
                }
            }
        }
    }
    
    var experienceView: some View{
        VStack{
            ForEach(me.experiences.indices, id: \.self){ index in
                
                HStack(spacing: 0){
                    
                        DotLineShape(lineWidth: 3,
                                     dotSize: 12,
                                     style: index == 0 ? .bottomHalf : index == me.experiences.count - 1 ? .topHalf : .full)
                        .frame(width: 70)
                        .foregroundColor(.secondary)
                    
                    let experience = me.experiences[index]
                    
                    VStack(spacing: 8){
                        Group{
                            Text("\(experience.start) - \(experience.end)")
                                .foregroundColor(.secondary)
                            Text(experience.title)
                                .bold()
                            Text(experience.company)
                                .padding(.bottom, 30)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }
    
    var contactView: some View{
        Group{
            if (isShowingContact){
                ContactView(isShowing: $isShowingContact)
                .offset(y: UIScreen.main.bounds.maxY * 0.38)
                .transition(.slide)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
