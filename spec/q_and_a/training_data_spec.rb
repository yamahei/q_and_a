RSpec.describe QAndA::TrainingData do
  it "consts" do
    expect(QAndA::TrainingData::ROOT_DIR_NAME).to eq("root")
    expect(QAndA::TrainingData::ANSWER_FILE_NAME).to eq("answer.txt")
    expect(QAndA::TrainingData::QUESTIONS_FILE_NAME).to eq("questions.txt")
  end

  it "initialize" do
    d = QAndA::TrainingData.new("/path", "hoge", ["a"], ["b"])

    expect(d.id).not_to be nil
    expect(d.path).to eq("/path")
    expect(d.answer).to eq("hoge")
    expect(d.questions).to eq(["a"])
    expect(d.resources).to eq(["b"])
  end

  it "from_hash_list" do
    list = QAndA::TrainingData.from_hash_list([
      { path: "/p", answer: "a", questions: [1, 2], resources: ["r"] },
      { answer: "x", questions: ["y"] },
    ])
    expect(list.length).to eq(2)

    item1 = list[0]
    expect(item1.id).not_to be nil
    expect(item1.path).to eq("/p")
    expect(item1.answer).to eq("a")
    expect(item1.questions).to eq([1, 2])
    expect(item1.resources).to eq(["r"])

    item2 = list[1]
    expect(item2.id).not_to be nil
    expect(item2.path).to be nil
    expect(item2.answer).to eq("x")
    expect(item2.questions).to eq(["y"])
    expect(item2.resources).to eq([])
  end
end
  