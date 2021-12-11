import Foundation

public typealias Bullet = StyledComponent
public typealias ThoughtBubble = StyledComponent
public typealias CodeListing = StyledComponent
public typealias CallOut = StyledComponent
public typealias Title = StyledComponent
public typealias Subtitle = StyledComponent

public struct StyledComponent: Codable, Identifiable {
  public private(set) var id = UUID()
  public private(set) var singleLines = [StyledLine]()
}

extension StyledComponent {
  public init(contents: String) {
    for line in lines(from: contents) {
      singleLines
        .append(StyledLine(contents: line,
                         startingStyle: startingLineStyle))
    }
  }
  public init(contents: () -> String) {
    self.init(contents: contents())
  }
}

extension StyledComponent {
  private func lines(from string: String) -> [String] {
    string.components(separatedBy: .newlines)
  }
  
  private var startingLineStyle: SegmentStyle {
    singleLines.last?.segments.last?.style ?? .standard
  }
}

extension StyledComponent: CustomStringConvertible {
  public var description: String {
    singleLines.reduce(""){listingDescription, line in
      listingDescription + "\n" + line.description
    }
  }
}
