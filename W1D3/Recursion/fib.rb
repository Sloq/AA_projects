def fibonacci(n)
  answer = [1, 1]
  return answer.take(n) if n <= 2
  fibs = fibonacci(n-1)
  fibs << fibs[-2] + fibs[-1]
end
