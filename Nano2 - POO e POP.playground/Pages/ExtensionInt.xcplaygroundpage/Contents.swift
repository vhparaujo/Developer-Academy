extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

func print() -> Void {
  print("Hello")
}

3.repetitions(task: print)
