DROP TABLE IF EXISTS question_tags;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author INTEGER NOT NULL,

  FOREIGN KEY (author) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  parent_reply INTEGER,
  question_id INTEGER NOT NULL,
  author INTEGER NOT NULL,

  FOREIGN KEY (parent_reply) REFERENCES replies(id)
  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (author) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO 
  users (fname, lname)
VALUES
  ('Mike', 'Portnoy'),
  ('John', 'Petrucci'),
  ('James', 'Labrie'),
  ('Jordan', 'Rudess'),
  ('John', 'Myung');


INSERT INTO
  questions (title, body, author)
VALUES
  ('How do I shred like John Myung?', 
  'Please guys help I wanna shred like John, he''s the best.', 
  (SELECT id FROM users WHERE lname = 'Labrie')),
  ('Can we add more time signatures?', 
  'Hear me out, I think our next single would be rockin'' with like 43 more time signature changes.', 
  (SELECT id FROM users WHERE lname = 'Portnoy'));


INSERT INTO
  question_follows (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'How do I shred like John Myung?'), 
  (SELECT id FROM users WHERE lname = 'Rudess')),
  ((SELECT id FROM questions WHERE title = 'How do I shred like John Myung?'), 
  (SELECT id FROM users WHERE lname = 'Petrucci')),
  ((SELECT id FROM questions WHERE title = 'How do I shred like John Myung?'), 
  (SELECT id FROM users WHERE lname = 'Myung')),
  ((SELECT id FROM questions WHERE title = 'Can we add more time signatures?'), 
  (SELECT id FROM users WHERE lname = 'Rudess')),
  ((SELECT id FROM questions WHERE title = 'Can we add more time signatures?'), 
  (SELECT id FROM users WHERE lname = 'Petrucci'));


INSERT INTO 
  replies (body, parent_reply, question_id, author)
VALUES
  ('What?? I thought I was the best shredder.', 
  NULL, 
  (SELECT id FROM questions WHERE title = 'How do I shred like John Myung?'), 
  (SELECT id FROM users WHERE lname = 'Petrucci'));

INSERT INTO 
  replies (body, parent_reply, question_id, author)
VALUES
  ('I still love you John', 
  (SELECT id FROM replies WHERE body = 'What?? I thought I was the best shredder.'), 
  (SELECT id FROM questions WHERE title = 'How do I shred like John Myung?'), 
  (SELECT id FROM users WHERE lname = 'Rudess'));

INSERT INTO 
  replies (body, parent_reply, question_id, author)
VALUES
  ('No worries James, I''ll show you the way.', 
  NULL, 
  (SELECT id FROM questions WHERE title = 'How do I shred like John Myung?'), 
  (SELECT id FROM users WHERE lname = 'Myung'));

INSERT INTO 
  replies (body, parent_reply, question_id, author)
VALUES
  ('Thanks bro!',
  (SELECT id FROM replies WHERE body = 'No worries James, I''ll show you the way.'),
  (SELECT id FROM questions WHERE title = 'How do I shred like John Myung?'),
  (SELECT id FROM users WHERE lname = 'Labrie'));

INSERT INTO 
  replies (body, parent_reply, question_id, author)
VALUES
  ('Aww yes', 
  NULL, 
  (SELECT id FROM questions WHERE title = 'Can we add more time signatures?'), 
  (SELECT id FROM users WHERE lname = 'Rudess'));

INSERT INTO 
  replies (body, parent_reply, question_id, author)
VALUES
  ('Let''s do it', 
  NULL, 
  (SELECT id FROM questions WHERE title = 'Can we add more time signatures?'), 
  (SELECT id FROM users WHERE lname = 'Petrucci'));


INSERT INTO
  question_likes (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'How do I shred like John Myung?'), 
  (SELECT id FROM users WHERE lname = 'Rudess')),
  ((SELECT id FROM questions WHERE title = 'How do I shred like John Myung?'), 
  (SELECT id FROM users WHERE lname = 'Myung')),
  ((SELECT id FROM questions WHERE title = 'Can we add more time signatures?'), 
  (SELECT id FROM users WHERE lname = 'Rudess')),
  ((SELECT id FROM questions WHERE title = 'Can we add more time signatures?'), 
  (SELECT id FROM users WHERE lname = 'Petrucci')),
  ((SELECT id FROM questions WHERE title = 'Can we add more time signatures?'), 
  (SELECT id FROM users WHERE lname = 'Labrie')),
  ((SELECT id FROM questions WHERE title = 'Can we add more time signatures?'), 
  (SELECT id FROM users WHERE lname = 'Myung')),
  ((SELECT id FROM questions WHERE title = 'Can we add more time signatures?'), 
  (SELECT id FROM users WHERE lname = 'Portnoy'));

  




  