import Foundation

public typealias BulletedList = MultipleLineComponent
public typealias ThoughtBubble = MultipleLineComponent
public typealias MultipleLineCallout = MultipleLineComponent

public struct MultipleLineComponent: Codable, Identifiable {
  public private(set) var id = UUID()
  public private(set) var singleLines = [SingleLineComponent]()
}

extension MultipleLineComponent {
  public init(contents: String) {
    for line in lines(from: contents) {
      singleLines
        .append(SingleLineComponent(contents: line,
                         startingStyle: startingLineStyle))
    }
  }
}

extension MultipleLineComponent {
  private func lines(from string: String) -> [String] {
    string.components(separatedBy: .newlines)
  }
  
  private var startingLineStyle: ComponentStyle {
    singleLines.last?.segments.last?.style ?? .standard
  }
}

extension MultipleLineComponent: CustomStringConvertible {
  public var description: String {
    singleLines.reduce(""){listingDescription, line in
      listingDescription + "\n" + line.description
    }
  }
}
