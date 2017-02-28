import UIKit

extension UITableView {
    
    func height(forRowCount count: Int, isPrintable: Bool = false) -> CGFloat {
        var tableViewHeight: CGFloat = 0
        
        for index in 0..<count {
            let cellRect = rectForRow(at: IndexPath(row: index, section: 0))
            print(cellRect)
            tableViewHeight += cellRect.height
        }
        
        if isPrintable {
            print(rect(forSection: 0))
            print(rectForHeader(inSection: 0))
            print(rectForFooter(inSection: 0))
        }
        
        return tableViewHeight
    }
    
    func height(rowsBySection: [Int], isPrintable: Bool = false) -> CGFloat {
        var tableViewHeight: CGFloat = 0
        
        rowsBySection.enumerated().forEach {
            let sectionIndex = $0.offset
            let headerHeight = rectForHeader(inSection: sectionIndex).height
            tableViewHeight += headerHeight
            if isPrintable { print("Section: \(sectionIndex), Header: \(headerHeight)") }
            (0..<$0.element).forEach {
                let rect = rectForRow(at: IndexPath(row: $0, section: sectionIndex))
                if isPrintable { print("Section: \(sectionIndex), RowHeight: \(rect.height)") }
                tableViewHeight += rect.height
            }
            
            let footerHeight = rectForFooter(inSection: sectionIndex).height
            tableViewHeight += footerHeight
            if isPrintable { print("Section: \(sectionIndex), Footer: \(headerHeight)") }
        }
        
        return ceil(tableViewHeight)
    }
    
    func height(rowsBySection: Int...) -> CGFloat {
        return height(rowsBySection: rowsBySection.map { $0 })
    }
    
    func height(atIndexPath indexPath: IndexPath) -> CGFloat {
        return ceil(rectForRow(at: indexPath).height)
    }
    
//    func register(types: [ContentNodeRendererCell.Type]) {
//        types.forEach {
//            register($0.nib, forCellReuseIdentifier: $0.identifier)
//        }
//    }
    
    func isIdentifierRegistered(identifier: String) -> Bool {
        return dequeueReusableCell(withIdentifier: identifier) != nil
    }
}

extension UITableView {
    func reloadData(with animation: UITableViewRowAnimation) {
        reloadSections(IndexSet(integersIn: 0..<numberOfSections), with: animation)
    }
}



