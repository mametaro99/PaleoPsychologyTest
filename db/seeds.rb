# ユーザーのサンプルデータ作成
user1 = User.create!(email: "user1@example.com", password: "password123")
user2 = User.create!(email: "user2@example.com", password: "password123")

# テストのサンプルデータ作成
test1 = Test.create!(
  title: "カリスマ性テスト",
  description: "このテストでは、あなたのカリスマ性を6つの質問に基づいて評価します。",
  min_score: 1,
  max_score: 5,
  avg_score: 3.5,  # 仮の平均スコア
  created_at: Time.now,
  updated_at: Time.now
)

test2 = Test.create!(
  title: "リーダーシップテスト",
  description: "リーダーシップ能力を測るためのテストです。",
  min_score: 1,
  max_score: 5,
  avg_score: 4.0,  # 仮の平均スコア
  created_at: Time.now,
  updated_at: Time.now
)

# 質問のサンプルデータ作成 (反転する質問も含む)
question1 = Question.create!(content: "自分は、どこにいても存在感があると思う", test: test1, reverse: false)
question2 = Question.create!(content: "私は他人に影響をおよぼす能力を持っている", test: test1, reverse: false)
question3 = Question.create!(content: "私はグループの導き方をよくわかっている", test: test1, reverse: false)
question4 = Question.create!(content: "私は他人を良い気分にさせるのが得意だ", test: test1, reverse: true)  # 反転する質問
question5 = Question.create!(content: "私は他人によく笑いかける", test: test1, reverse: false)
question6 = Question.create!(content: "私は誰とでもうまくやることができる", test: test1, reverse: false)

# ユーザー1のテスト回答データ作成
test_answer1 = TestAnswer.create!(user: user1, test: test1, count: 1, timestamp: Time.now)

# TestAnswerDetail のサンプルデータ作成
TestAnswerDetail.create!(test_answer: test_answer1, question: question1, score: 4)
TestAnswerDetail.create!(test_answer: test_answer1, question: question2, score: 5)
TestAnswerDetail.create!(test_answer: test_answer1, question: question3, score: 3)
TestAnswerDetail.create!(test_answer: test_answer1, question: question4, score: 1)  # 反転する質問
TestAnswerDetail.create!(test_answer: test_answer1, question: question5, score: 4)
TestAnswerDetail.create!(test_answer: test_answer1, question: question6, score: 5)

# ユーザー2のテスト回答データ作成
test_answer2 = TestAnswer.create!(user: user2, test: test1, count: 1, timestamp: Time.now)

TestAnswerDetail.create!(test_answer: test_answer2, question: question1, score: 3)
TestAnswerDetail.create!(test_answer: test_answer2, question: question2, score: 2)
TestAnswerDetail.create!(test_answer: test_answer2, question: question3, score: 5)
TestAnswerDetail.create!(test_answer: test_answer2, question: question4, score: 4)  # 反転する質問
TestAnswerDetail.create!(test_answer: test_answer2, question: question5, score: 5)
TestAnswerDetail.create!(test_answer: test_answer2, question: question6, score: 3)
