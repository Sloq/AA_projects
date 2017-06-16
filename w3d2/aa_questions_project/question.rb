require_relative 'questions_database'
require_relative 'user'

class Question

  attr_reader :id, :title, :body, :author_id

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM questions
      WHERE id = ?
    SQL
    return nil if results.empty?

    Question.new(results.first)
  end

  def self.find_by_author_id(author_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT *
      FROM questions
      WHERE author_id = ?
    SQL
    return nil if results.empty?

    results.map { |record| Question.new(record) }
  end

  def author
    result = QuestionsDatabase.instance.execute(<<-SQL, @author_id)
      SELECT *
      FROM questions
        JOIN users ON users.id = questions.author_id
      WHERE questions.author_id = ?
    SQL

    return nil if result.empty?

    "#{User.new(result.first).fname} #{User.new(result.first).lname}"
  end

  def replies
    Reply.find_by_question_id(@id)
  end

end
