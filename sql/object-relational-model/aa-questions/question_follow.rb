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
        id = ?;
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
        question_follows.question_id = ?;
    SQL

    return "No user found" if data.length == 0

    data.length == 1 ? User.new(data.first) : data.map { |datum| User.new(datum) }
  end

  def self.followed_questions_for_user_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        questions.id, author, body, title
      FROM
        questions
      JOIN 
        question_follows ON question_follows.question_id = questions.id
      JOIN 
        users ON question_follows.user_id = users.id
      WHERE 
        users.id = ?;
    SQL

    return "No questions found" if data.length == 0

    data.length == 1 ? Question.new(data.first) : data.map { |datum| Question.new(datum) }
  end

  def self.most_followed_questions(n)
    data = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        questions.id, author, body, title
      FROM
        questions
      JOIN 
        question_follows ON question_follows.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY 
        COUNT(question_follows.id) DESC
      LIMIT 
        ?
    SQL

    return "No questions found" if data.length == 0

    data.length == 1 ? Question.new(data.first) : data.map { |datum| Question.new(datum) }
  end


  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end