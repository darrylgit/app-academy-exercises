class QuestionFollow
  attr_accessor :id, :question_id, :user_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        question_follows
      WHERE 
        id = ?
    SQL

    QuestionFollow.new(data.first)
  end

  def self.followers_for_question_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        users.id, fname, lname
      FROM
        users
      JOIN
        question_follows 
      ON 
        users.id = question_follows.user_id
      WHERE
        question_follows.question_id = ?
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