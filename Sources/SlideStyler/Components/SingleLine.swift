import Foundation

public typealias CodeLocation = SingleLine
public typealias CodeResult = SingleLine
public typealias Info = SingleLine

public struct SingleLine: Codable, Identifiable {
  public private(set) var id = UUID()
  public private(set) var segments = [StyledSegment]()
}

extension SingleLine {
  public init(contents: String,
       startingStyle style: SegmentStyle = .standard) {
    let dividers = dividers(from: contents)
      var style = style
      var index = contents.startIndex
      for component in dividers {
        addSegment(contents: contents[index..<component.range.lowerBound],
                   style: style)
        style = SegmentStyle.from(tag: component.tag)
        index = component.range.upperBound
      }
    addSegment(contents: contents[index...],
               style: style)
  }
  
  public init(startingStyle style: SegmentStyle = .standard,
              contents: () -> String) {
    self.init(contents: contents(),
              startingStyle: style)
  }
}

extension SingleLine {
  private func dividers(from string: String) ->  [(range: Range<String.Index>, tag: String)] {
    SegmentStyle.tags
      .compactMap {tag in range(of: tag, in: string)}
      .sorted{$0.0.lowerBound < $1.0.lowerBound}
  }
  
  func range(of tag: String, in string: String) -> (range: Range<String.Index>, tag: String)? {
    guard let range = string.range(of: tag) else {return nil}
    return (range, tag)
  }
}


extension SingleLine {
  mutating private func addSegment(contents: Substring = "",
                                   style: SegmentStyle = .standard) {
    segments.append(StyledSegment(contents: String(contents),
                             style: style))
  }
}

extension SingleLine: CustomStringConvertible {
  public var description: String {
    segments.reduce(""){lineDescription, segment in
      lineDescription + segment.description
    }
  }
}
