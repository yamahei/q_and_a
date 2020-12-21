RSpec.describe QAndA::Factory do

  it "success ByNbayes" do
    e = QAndA::Factory.get_instance :nbayes
    expect(e).not_to be nil
    expect(e).to be_a(QAndA::Engine::ByNbayes)
    expect(e).to be_a(QAndA::Interface)
  end

  it "fail Hoge" do
    expect {
      QAndA::Factory.get_instance :hoge
    }.to raise_error(QAndA::Error, "unknown engine: hoge.")
  end
end
  