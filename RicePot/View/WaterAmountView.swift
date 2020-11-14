//
//  FillWaterView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/08.
//

import SwiftUI

struct WaterAmountView: View {
    
    @EnvironmentObject var model : RiceModel
    
    @State private var showAlert = false
    
    var body: some View {
        
        VStack(spacing : 10) {
            
           Text("下記の容量の水に浸します")
            .font(.system(size: 24))
            .font(.headline)
            .fontWeight(.bold)
            .padding()
            
            Spacer()

            WaterPotView(progress: $model.rice.waterAmount)
                .padding()
            
            Spacer()
            
            HStack(spacing : 10) {
                
                CustomButton(action: {
                    showAlert = true
                }, color: Color.red, text: "終了する")
                .alert(isPresented: $showAlert) { () -> Alert in
                    
                    Alert(title: Text("終了しますか?"), primaryButton: .cancel(Text("キャンセル")), secondaryButton: .destructive(Text("終了する"), action: {
                        
                        model.rice = .init(amount: 1)
                        model.state = .Home
                        
                    }))
                }
                
                CustomButton(action: {
                    model.nextPage(Optional<Never>.none)
                })
             
            }
            .padding()
        }
    
    }
}
struct WaterPotView : View {
    
    var w = CGFloat(250)
    var h = CGFloat(350)
    
    @Binding var progress : CGFloat
    @State var phase :CGFloat = 0.0
    
    @State private var a = false
    @State private var b = false
    @State private var c = false
    @State private var d = false
    
    var repeatingAnimation: Animation {
        
        Animation.linear(duration: 2)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 6)
                .fill(Color.black)
                .frame(width: w + 10, height: h + 10)
            
            Water_PotWave(progoress: progress, phase: self.phase, maxValue: 2000)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .frame(width: w, height: h, alignment: .center)
                .clipShape(Rectangle())
                .onAppear() {
                    
                    withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                        self.phase = .pi * 2
                    }

                }
            
            /// bubble aimation
            
            Group{

                Circle()
                    .frame(width: a ?  0 : w / 10, height: a ? 0 : w / 10)
                    .offset(x: w / 4, y: h / 2.8)
                    .foregroundColor(.blue)
                    .animation(Animation.easeInOut(duration: 0.7).delay(1.5).repeatForever(autoreverses: false))
                    .onAppear {
                        a.toggle()
                    }

                Circle()
                    .frame(width: b ?  0 : w / 11, height: b ? 0 : w / 11)
                    .offset(x: -w / 4, y: h / 4)
                    .foregroundColor(.blue)
                    .animation(Animation.easeInOut(duration: 0.5).delay(1.8).repeatForever(autoreverses: true))
                    .onAppear {
                        b.toggle()
                    }

                Circle()
                    .frame(width: c ? w / 10 : 0, height: c ? 0 : w / 10)
                    .offset(x: -w / 5.5, y: c ? -h / 5.5 : h / 3.5)
                    .foregroundColor(.blue)
                    .animation(Animation.easeInOut(duration: 2.5).delay(1).repeatForever(autoreverses: false))
                    .onAppear {
                        c.toggle()
                    }

                Circle()
                    .frame(width: d ? w / 10 : 0, height: d ? 0 : w / 10)
                    .offset(x: w / 5.5, y: d ? -h / 5.5 : h / 4)
                    .foregroundColor(.blue)
                    .animation(Animation.easeInOut(duration: 2.5).delay(1).repeatForever(autoreverses: false))
                    .onAppear {
                        d.toggle()
                    }

            }
//
     
            Text("\(Int(progress)) ml").bold().foregroundColor(.black)
            
        }
    }
}


struct Water_PotWave : Shape {
    
    
    let progoress : CGFloat
    var amplitude : CGFloat = 10
    var waterLength : CGFloat = 20
    var phase : CGFloat
    let maxValue : CGFloat
//
    var animatableDate : CGFloat {
        get{phase}
        set{phase = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        let midwidth =  width / 2
        let progressHeight = height * (1 - (progoress / maxValue))
        
        path.move(to: CGPoint(x: 0, y: progressHeight))
        
        for x in stride(from: 0, to: width + 15, by: 5) {
            let relativeX = x / waterLength
            let normalizeLength = (x - midwidth) / midwidth
            let y = progressHeight + sin(phase + relativeX) * amplitude + normalizeLength
            
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: width, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeight))
        
        return path
    }
}



struct FillWaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterAmountView()
    }
}
