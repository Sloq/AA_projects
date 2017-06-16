def first_anagram?(str1, str2)
  chars1 = str1.chars
  perms = chars1.permutation(str1.length).to_a
  perms.each do |perm|
    return true if perm.join == str2
  end
  false
end
# time: O(n!)
# space: O(n!)

def second_anagram?(str1, str2)
  until str1.empty? || str2.empty?
    last_char = str1.slice!(-1)
    if str2.chars.include?(last_char)
      match_idx = str2.index(last_char)
      str2.slice!(match_idx)
    else
      return false
    end
  end
  str1 == str2
end
#O(n**2)

def third_anagram?(str1, str2)
  str1.sort == str2.sort
end

#O(nlogn)

def fourth_anagram?(str1, str2)
  hash = Hash.new(0)
  str1.chars.each do |char|
    hash[char] += 1
  end
  str2.chars.each do |char|
    hash[char] -= 1
  end
  hash.values.all? { |v| v == 0}
end
# O(n)
