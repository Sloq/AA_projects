require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    #should return an array of column names
    if @columns
      return @columns
    else
      data = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          "#{table_name}"
      SQL
      @columns = data[0].map(&:to_sym)
    end
  end

  def self.finalize!
    columns.each do |col|
      define_method("#{col}") do
        attributes[col]
      end
      define_method("#{col}=") do |arg|
        attributes[col] = arg
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    if @table_name
      @table_name
    else
      name_str = self.to_s
      @table_name = name_str.tableize
    end
  end

  def self.all
    class_hash = DBConnection.execute(<<-SQL)
      SELECT
        "#{self.table_name}".*
      FROM
        "#{self.table_name}"
    SQL
    parse_all(class_hash)
  end

  def self.parse_all(results)
    results.map { |el| self.new(el) }
  end

  def self.find(id)
    stuff = DBConnection.execute(<<-SQL, id)
      SELECT *
      FROM "#{self.table_name}"
      where id = ?
    SQL
    return nil if stuff.empty?
    self.new(stuff.first)
  end

  def initialize(params = {})
    # ...
    params.each do |key, val|
      # attributes
      if self.class.columns.include?(key.to_sym)
        # self.send :attributes, key, val
        # attributes[key] = val
        send("#{key}=", val)
      else
        raise "unknown attribute '#{key}'"
      end
    end
  end

  def attributes
    @attributes ||=  {}
  end

  def attribute_values
    # ...
  end

  def insert
    col_names = columns.join(", ")
    question_marks = Array.new(columns.count) { ["?"] }
    question_marks.join!(", ")
    col_values = columns.map { |el| send("#{el}") }
    pew_pew = DBConnection.execute(<<-SQL, *col_values)
      INSERT INTO
        #{table_name} #{col_names}
      VALUES
        question_marks
    SQL
    pew_pew
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
