class Question
  attr_accessor :id, :title, :body, :author

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        questions
      WHERE 
        id = ?
    SQL

    Question.new(data.first)
  end

  def self.find_by_author_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        questions
      WHERE 
        author = ?
    SQL

    Question.new(data.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author = options['author']
  end
end