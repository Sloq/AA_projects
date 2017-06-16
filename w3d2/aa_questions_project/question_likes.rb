require_relative 'questions_database'

class QuestionLike
  attr_reader :id, :question_id, :liker_id, :count

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @liker_id = options['liker_id']
    @count = options['count']
  end

  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM question_likes
      WHERE id = ?
    SQL

    return nil if results.empty?

    QuestionLike.new(results.first)
  end
end
