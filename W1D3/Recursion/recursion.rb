def range(start, endd)
  if endd-start <=1
    return []
  end
  empty = [start+1]
  return empty if endd-start <= 2
  empty + range(start+1, endd)
end

def exp1(num, power)
  return 1 if power == 0
  return num if power == 1
  num * exp1(num, power-1)
end

def exp2(num, power)
  return 1 if power == 0
  return num if power == 1
  if num.even?
    exp2(num, power/2) * exp2(num, power/2)
  else
    num * exp2(num, (power-1)/2) * exp2(num, (power-1)/2)
  end
end
