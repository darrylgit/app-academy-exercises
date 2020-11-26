class Reply
  attr_accessor :id, :parent_reply, :body, :author, :question_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        replies
      WHERE 
        id = ?
    SQL

    return "No replies found" if data.length == 0

    Reply.new(data.first)
  end

  def self.find_by_question_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        replies
      WHERE 
        question_id = ?
    SQL

    return "No replies found" if data.length == 0

    data.length == 1 ? Reply.new(data.first) : data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_user_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        replies
      WHERE 
        author = ?
    SQL

    return "No replies found" if data.length == 0

    data.length == 1 ? Reply.new(data.first) : data.map { |datum| Reply.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @parent_reply = options['parent_reply']
    @body = options['body']
    @author = options['author']
    @question_id = options['question_id']
  end
end