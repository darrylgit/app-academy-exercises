class QuestionLike
  attr_accessor :id, :question_id, :user_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLike.new(datum) }
  end

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        question_likes
      WHERE 
        id = ?
    SQL

    QuestionLike.new(data.first)
  end

  def self.likers_for_question_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        users.id, fname, lname
      FROM 
        users
      JOIN 
        question_likes ON question_likes.user_id = users.id
      WHERE
        question_likes.question_id = ?
    SQL

    return "No user found" if data.length == 0

    data.length == 1 ? User.new(data.first) : data.map { |datum| User.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end