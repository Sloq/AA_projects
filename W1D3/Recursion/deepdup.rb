class Array
  def deep_dup
    ans = []
    return ans if self.empty?
      self.each do |el|
        if el.is_a?(Array)
          ans << el.deep_dup
        else
          ans << el
        end
      end
    ans
  end
end
