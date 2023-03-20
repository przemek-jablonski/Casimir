import Combine
import Entwine
import EntwineTest

public extension TestSequence {
  var subscriptions: TestSequence {
    self.filter { if case Signal.subscription = $0.1 { return true } else { return false } }
  }

  var inputs: TestSequence {
    self.filter { if case Signal.input = $0.1 { return true } else { return false } }
  }

  var completions: TestSequence {
    self.filter { if case Signal.completion = $0.1 { return true } else { return false } }
  }

  var finishes: TestSequence {
    self.filter {
      if case Signal.completion(let completion) = $0.1,
         case Subscribers.Completion.finished = completion {
        return true
      } else {
        return false
      }
    }
  }

  var failures: TestSequence {
    self.filter {
      if case Signal.completion(let completion) = $0.1,
         case Subscribers.Completion.failure = completion {
        return true
      } else {
        return false
      }
    }
  }
}
