//
//  Login.swift
//  UI-140
//
//  Created by にゃんにゃん丸 on 2021/03/08.
//

import SwiftUI



struct Login: View {
    @State var offset : CGSize = .zero
    @State var showHome = false
   
   
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: .init(colors: [.blue,.red]), startPoint: .top, endPoint: .bottom)
                .overlay(
                    VStack(alignment: .leading, spacing: 15, content: {
                        Text("JD")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .kerning(2)
                            
                        Text("An average of 99 is dicided in the corner")
                            .font(.title)
                            .multilineTextAlignment(.center)
                           
                    })
                    .foregroundColor(.white)
                    .padding(.horizontal,30)
                    .offset(y: -20)
                
                
                
                )
                .clipShape(LiquipSwip(offset: offset))
                .ignoresSafeArea()
                .overlay(
                
                    Image(systemName:"chevron.left")
                        .font(.largeTitle)
                        .frame(width: 55, height: 55)
                        .contentShape(Rectangle())
                        .offset(x: 15, y: 58)
                        .gesture(DragGesture().onChanged({ (value) in
                            
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.7)){
                                
                                offset = value.translation
                            }
                            
                        }).onEnded({ (value) in
                            
                            let screen = UIScreen.main.bounds
                            withAnimation(.spring()){
                                
                                if -offset.width > screen.width / 2{
                                    
                                    offset.width = -screen.height
                                    showHome.toggle()
                                    
                                    
                                    
                                    
                                }
                                else{
                                    
                                    offset = .zero
                                }
                                
                                
                                
                            }
                        }))
                        .opacity(offset == .zero ? 1 : 0)
                    ,alignment: .topTrailing
                
                )
                .padding(.trailing)
            if showHome{
                
                Home()
            }
               
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

struct LiquipSwip : Shape {
    var offset : CGSize
    
    var animatableData: CGSize.AnimatableData{
        
        get{return offset.animatableData}
        set{offset.animatableData = newValue}
    }
    func path(in rect: CGRect) -> Path {
        return Path {path in
            
            let width = rect.width + (-offset.width > 0 ? offset.width : 0)
            
            path.move(to: CGPoint(x: 0, y: 0))
            
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let frome = 80 + (offset.width)
            
            path.move(to: CGPoint(x: rect.width, y: frome > 80 ? 80 : frome))
            
            var  to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to
            let mid : CGFloat = 80 + ((to - 80) / 2)
           
            
            path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width - 50, y: mid), control2: CGPoint(x: width - 50, y: mid))
            
            
            
            
            
        }
    }
}
