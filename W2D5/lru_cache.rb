class LRUCache
  def initialize(cache_size)
    @cache = []
    @cache_allowance = cache_size
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
    end
    if @cache.count == @cache_allowance
      @cache.shift
    end
    @cache << el
  end

  def show
    @cache
  end

  private
  #helper methods

end
