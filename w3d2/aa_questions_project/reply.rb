require_relative 'questions_database'

class Reply
  attr_reader :id, :question_id, :parent_reply_id, :author_id, :body

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @author_id = options['author_id']
    @body = options['body']
  end

  def self.find_by_id(id)
    result = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM replies
      WHERE replies.id = ?
    SQL
    return nil if result.empty?
    Reply.new(result.first)
  end

  def self.find_by_user_id(user_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM replies
      WHERE replies.author_id = ?
    SQL
    return nil if result.empty?
    Reply.new(result.first)
  end

  def self.find_by_question_id(question_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM replies
      WHERE replies.question_id = ?
    SQL
    return nil if result.empty?

    result.map { |record| Reply.new(record) }
  end

  def author
    result = QuestionsDatabase.instance.execute(<<-SQL, @author_id)
      SELECT *
      FROM replies
      JOIN users ON users.id = replies.author_id
      WHERE replies.author_id = ?
    SQL
    return nil if result.empty?

    "#{User.new(result.first).fname} #{User.new(result.first).lname}"
  end

  def question
    result = QuestionsDatabase.instance.execute(<<-SQL, @question_id)
      SELECT *
      FROM replies
      JOIN questions ON replies.question_id = questions.id
      WHERE replies.question_id = ?
    SQL
    return nil if result.empty?

    Question.new(result.first)
  end

  def parent_reply
    result = QuestionsDatabase.instance.execute(<<-SQL, @parent_reply_id)
      SELECT *
      FROM replies
      -- JOIN questions ON replies.question_id = questions.id
      WHERE replies.id = ?
    SQL
    return nil if result.empty?

    Reply.new(result.first)
  end

  def child_reply
    result = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT *
      FROM replies
      WHERE replies.parent_reply_id = ?
    SQL
    return nil if result.empty?

    Reply.new(result.first)
  end

  

end
