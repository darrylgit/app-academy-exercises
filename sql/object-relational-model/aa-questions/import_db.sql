PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
)

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL
)

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (user_id) REFERENCES users(id)
)

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  FOREIGN KEY (parent_reply) REFERENCES replies(id)
  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (user_id) REFERENCES users(id)
)

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (user_id) REFERENCES users(id)
)

INSERT INTO 
  users (fname, lname)
VALUES
  ('Mike', 'Portnoy'),
  ('John', 'Petrucci'),
  ('James', 'Labrie'),
  ('Jordan', 'Rudess'),
  ('John', 'Myung')
  