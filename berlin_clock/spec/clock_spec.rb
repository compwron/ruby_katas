require_relative "../clock.rb"

describe Clock do
  context "yellow light" do
    it "is on, every other second" do
      assert_row_equals("Y")
      assert_row_equals("OOOO")
      assert_row_equals("OOOO")
      assert_row_equals("OOOOOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new("00:00:00")
    end

    it "is off on odd-numbered seconds" do
      assert_row_equals("O")
      assert_row_equals("OOOO")
      assert_row_equals("OOOO")
      assert_row_equals("OOOOOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new("00:00:01")
    end
  end

  context "hour lamps" do
    it "shows four lamps on row 2 for 10am" do
      assert_row_equals("Y")
      assert_row_equals("RROO")
      assert_row_equals("OOOO")
      assert_row_equals("OOOOOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new("10:00:00")
    end

    it "shows lamps on both rows for 11am" do
      assert_row_equals("Y")
      assert_row_equals("RROO")
      assert_row_equals("ROOO")
      assert_row_equals("OOOOOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new("11:00:00")
    end

    it "shows lamps on both rows for 2pm" do
      assert_row_equals("Y")
      assert_row_equals("RROO")
      assert_row_equals("RRRR")
      assert_row_equals("OOOOOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new("14:00:00")
    end
  end

  context "minute lamps" do
    it "shows two yellow minute lamps for ten minutes past the hour" do
      assert_row_equals("Y")
      assert_row_equals("OOOO")
      assert_row_equals("OOOO")
      assert_row_equals("YYOOOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new("00:10:00")
    end

    it "shows red lamps for minutes on the quarter-hour" do
      assert_row_equals("Y")
      assert_row_equals("OOOO")
      assert_row_equals("OOOO")
      assert_row_equals("YYROOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new("00:15:00")
    end

    it "shows yellow lamps for minutes not divisible by five" do
      assert_row_equals("Y")
      assert_row_equals("OOOO")
      assert_row_equals("OOOO")
      assert_row_equals("YYROOOOOOOO")
      assert_row_equals("YYYO")
      Clock.new("00:18:00")
    end

    it "shows time paired" do
      assert_row_equals("O")
      assert_row_equals("OOOO")
      assert_row_equals("RROO")
      assert_row_equals("YYRYYROOOOO")
      assert_row_equals("OOOO")
      Clock.new("02:30:01")
    end
  end

  def assert_row_equals(string)
    $stdout.should_receive(:puts).with(string)
  end
end