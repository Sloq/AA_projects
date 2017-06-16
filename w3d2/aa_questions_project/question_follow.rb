require_relative 'questions_database'
require_relative 'user'
require_relative 'question'

class QuestionFollow
  attr_reader :id, :question_id, :user_id

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def self.find_by_id(id)
    result = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM question_follows
      WHERE id = ?
    SQL
    return nil if result.length == 0
    QuestionFollow.new(result.first)
  end

  def self.followers_for_question_id(question_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM users
      JOIN question_follows ON question_follows.user_id = users.id
      JOIN questions ON  questions.id = question_follows.question_id
      WHERE questions.id = ?
    SQL
    return nil if result.empty?

    result.map { |record| User.new(record) }
  end

  def self.followed_questions_for_user_id(user_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM questions
      JOIN question_follows ON question_follows.question_id = questions.id
      WHERE question_follows.user_id = ?
    SQL
    return nil if result.empty?

    result.map { |record| Question.new(record) }
  end

end
