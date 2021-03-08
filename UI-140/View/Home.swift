//
//  Home.swift
//  UI-140
//
//  Created by にゃんにゃん丸 on 2021/03/08.
//

import SwiftUI
var orange = Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))

struct Home: View {
    @StateObject var model = HomeViewModel()
    @Namespace var animation
    var body: some View {
        ZStack(alignment:.bottom){
            VStack{
                
                HStack{
                    
                    Button(action: {
                        
                        
                    }, label: {
                        Image(systemName: "rectangle.3.offgrid")
                            .font(.title2)
                            .foregroundColor(.black)
                            
                    })
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "bag.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                            .overlay(
                            
                            
                                Text("\(model.cartitems)")
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(orange)
                                    .clipShape(Circle())
                                    .offset(x: 15, y: -10)
                                    .opacity(model.cartitems != 0 ? 1 : 0)
                                    
                            )
                            
                    })
                    
                }
                .overlay(
                
                Text("NIKE")
                    .font(.title)
                    .foregroundColor(.black)
                    .kerning(1.5)
                
                )
                .padding()
                
                ScrollView{
                    
                    VStack(alignment: .leading, spacing: 15, content: {
                        Text("Air Max")
                            .bold()
                            .foregroundColor(.black)
                        
                        Text("Nike")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.black)
                        
                        Image("shoe")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.horizontal,30)
                        
                        
                        Text("Price")
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                        
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                         
                            Rectangle()
                                .stroke(Color.red,lineWidth: 2)
                                .font(.title)
                                .background(Color.red)
                                .frame(width: 110, height: 5)
                                
                            Text("1万5000円")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.black)
                                
                            HStack{
                                
                                Text("→")
                                    .font(.title)
                                    .bold()
                                    .frame(width: 100)
                                    .offset(x: 100)
                                
                                
                                Text("9000円")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.red)
                                    .padding(.vertical,5)
                                    .padding(.horizontal,5)
                                    .frame(maxHeight: .infinity)
                                    .background(
                                    RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color.red,lineWidth: 8)
                                        
                                    )
                                    
                                    
                                   
                                    .offset(x: 80)
                                    
                                
                            }
                            
                            
                        })
                        
                        
                        
                        
                    })
                    .padding(.horizontal)
                    .padding(.vertical,20)
                    .background(Color.black.opacity(0.06))
                    .overlay(
                    
                       Capsule()
                        .fill(Color.green)
                        .frame(width: 4, height: 45)
                        .offset(y: 20)
                        ,alignment: .topLeading
                    )
                    .cornerRadius(20)
                    .padding()
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            model.showcart.toggle()
                            model.selectSize = ""
                            
                            
                        }
                    }
                    
                }
                    
                
            }
            .blur(radius: model.showcart ? 50 : 0)
            
        AddtoCart(animation: animation)
                
                .offset(y:model.showcart ? model.startAnimation ? 500 : 0 : 500)
           
                .environmentObject(model)
        
        if model.startAnimation{
            
            
            VStack{
                
                
                Spacer()
                
                ZStack{
                    
                    Color.red
                        .frame(width: model.shoeAniamtion ? 100 : getrect().width * 1.2, height:model.shoeAniamtion ? 100 : getrect().width * 1.2)
                        .clipShape(Circle())
                        .opacity(model.shoeAniamtion ? 1 : 0)
                    
                    
                    Image("shoe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "SHOE", in: animation)
                        .frame(width: 80, height: 80)
                        
                }
                .offset(y:model.SaveCart ? 70 : -120)
                .scaleEffect(model.SaveCart ? 0.6 : 1)
                .onAppear(perform: model.performAnimation)
                
                
                if !model.SaveCart{
                    
                    Spacer()

                }
                   
                Image(systemName: "bag\(model.addditemtoCart ? ".fill" : "")")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(model.addditemtoCart ? Color.purple : orange)
                    .clipShape(Circle())
                    .offset(y: model.shobag ? -50 : 300)
                
               
            }
            .frame(width: getrect().width)
            
            
        }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.black.opacity(0.02).ignoresSafeArea())
        .onChange(of: model.endAnimation) { (value) in
            
            if model.endAnimation{
                
                model.resetAll()
            }
            
        }
    }
}

extension View {
    
    func getrect()->CGRect{
        
        return UIScreen.main.bounds
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AddtoCart : View {
    @EnvironmentObject var model : HomeViewModel
    var animation : Namespace.ID
    var body: some View{
        
        
        VStack{
            
            
            HStack(spacing:15){
                
                if !model.startAnimation{
                    
                    Image("shoe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal)
                        .matchedGeometryEffect(id: "SHOE", in: animation)
                    
                }
                VStack(alignment: .trailing, spacing: 15, content: {
                    Text("Air Max")
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                    
                    Text("9000円")
                        .bold()
                        .foregroundColor(.black)
                })
                
                
            }
            .padding()
            Divider()
            
            
            Text("Select Size")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .kerning(1.3)
                .padding(.vertical)
            
            let columns = Array(repeating: GridItem(.flexible(),spacing: 15), count: 4)
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 15, content: {
               
                ForEach(sizes,id:\.self){size in
                    
                    Button(action: {
                        
                        withAnimation{
                            
                            model.selectSize = size
                        }
                        
                    }, label: {
                        
                        Text("\(size)")
                            .fontWeight(.semibold)
                            .foregroundColor(model.selectSize == size ? . white : .black)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(model.selectSize == size ? orange : Color.black.opacity(0.3))
                            .cornerRadius(15)
                    })
                    
                }
                
            })
            .padding(.top)
            
            Button(action: {
                
                withAnimation(.easeInOut(duration: 0.7)){
                    
                    model.startAnimation.toggle()
                }
                
            }, label: {
                Text("Add to Cart")
                    .font(.title)
                    .bold()
                    .foregroundColor(model.selectSize == "" ? .black : .white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(model.selectSize == "" ? Color.black.opacity(0.3) : orange)
                    .cornerRadius(18)
            })
            .disabled(model.selectSize == "")
            
            
            
        }
        .padding()
        .background(Color.white.clipShape(CustomShape(corners: [.topRight,.topLeft], radius: 35)))
        
        
        
        
    }
}



let sizes = ["23","26","28","29","30"]

struct CustomShape : Shape {
    var corners : UIRectCorner
    var radius : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
