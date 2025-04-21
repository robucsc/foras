extension ForasVM {
    public func pop<T>() -> T? {
        return stack.popLast() as? T
    }

    public func push(_ value: Any) {
        stack.append(value)
    }

    public func peek() -> Any? {
        return stack.last
    }

    public func popInt() -> Int? {
        return pop()
    }
    
    public func popAny() -> Any? {
        return stack.popLast()
    }
}
