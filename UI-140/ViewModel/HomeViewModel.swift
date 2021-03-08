//
//  HomeViewModel.swift
//  UI-140
//
//  Created by にゃんにゃん丸 on 2021/03/08.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var showcart = false
    @Published var selectSize = ""
    
    @Published var startAnimation = false
    @Published var shoeAniamtion = false
    
    @Published var shobag = false
    
    
    @Published var SaveCart = false
    @Published var addditemtoCart = false
    @Published var endAnimation = false
    @Published var cartitems = 0
    
    
    
    func performAnimation(){
        
        withAnimation(.easeOut(duration: 0.8)){
            
            
            shoeAniamtion.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35){
            withAnimation(.easeInOut){
                self.shobag.toggle()
                
            }
        }
            
           
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75){
            
            withAnimation(.easeInOut(duration: 0.5)){
            
            self.SaveCart.toggle()
                
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1){
            self.addditemtoCart.toggle()
            
            
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25){
            
            
            withAnimation(.easeInOut(duration: 0.5)){
                
                self.endAnimation.toggle()
            }
        }
        
    }
    
    
    func resetAll(){
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){[self] in
            showcart = false
            startAnimation = false
            shoeAniamtion = false
            selectSize = ""
            shobag = false
            SaveCart = false
            addditemtoCart = false
            endAnimation = false
            cartitems += 1
            
            
            
            
        }
    }
}

