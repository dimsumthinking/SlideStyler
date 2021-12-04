import Foundation

public typealias Bullet = SlideComponent
public typealias ThoughtBubble = SlideComponent
public typealias CodeListing = SlideComponent
public typealias CallOut = SlideComponent
public typealias Title = SlideComponent
public typealias Subtitle = SlideComponent

public struct SlideComponent: Codable, Identifiable {
  public private(set) var id = UUID()
  public private(set) var singleLines = [SingleLine]()
}

extension SlideComponent {
  public init(contents: String) {
    for line in lines(from: contents) {
      singleLines
        .append(SingleLine(contents: line,
                         startingStyle: startingLineStyle))
    }
  }
}

extension SlideComponent {
  private func lines(from string: String) -> [String] {
    string.components(separatedBy: .newlines)
  }
  
  private var startingLineStyle: SegmentStyle {
    singleLines.last?.segments.last?.style ?? .standard
  }
}

extension SlideComponent: CustomStringConvertible {
  public var description: String {
    singleLines.reduce(""){listingDescription, line in
      listingDescription + "\n" + line.description
    }
  }
}
