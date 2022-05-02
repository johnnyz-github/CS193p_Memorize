//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Johnny Zhou on 2/5/2022.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where ItemView  : View, Item: Identifiable{
    var items : [Item]
    var aspectRatio : CGFloat
    var content : (Item) -> ItemView
    var body: some View {
        GeometryReader{ geometry in
            VStack{
            let width: CGFloat = widthThatFits(itemCount: items.count, in : geometry.size, itemAspectRatio: aspectRatio)
        LazyVGrid(columns:[GridItem(.adaptive(minimum: width))], spacing: 0){
            ForEach(items){ item  in
                content(item).aspectRatio(aspectRatio, contentMode:  .fit)
                    
            }
        }
            Spacer()
        }
        }
        }
    private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
            var columnCount = 1
            var rowCount = itemCount
            repeat {
                let itemWidth = size.width / CGFloat(columnCount)
                let itemHeight = itemWidth / itemAspectRatio
                if  CGFloat(rowCount) * itemHeight < size.height {
                    break
                }
                columnCount += 1
                rowCount = (itemCount + (columnCount - 1)) / columnCount
            } while columnCount < itemCount
            if columnCount > itemCount {
                columnCount = itemCount
            }
        print ("\(size.width) / \(columnCount) = \(floor(size.width / CGFloat(columnCount)))")
            return floor(size.width / CGFloat(columnCount))
        }
}

//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid<<#Item: Identifiable#>, <#ItemView: View#>>()
//    }
//}
