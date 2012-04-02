require_relative "../clock.rb"

describe Clock do
  
  it "prints seconds lamp - yellow if even, off if odd" do
    assert_row_equals("Y")
    Clock.new.print_seconds(20)
    assert_row_equals("O")
    Clock.new.print_seconds(21)
  end

  it "prints hours- top row each lamp represents 5 hr botom row each lamp represents 1 hour" do
    assert_row_equals("RROO")
    assert_row_equals("ROOO")
    Clock.new.print_hours(11)

    assert_row_equals("RRRR")
    assert_row_equals("RRRR")
    Clock.new.print_hours(24)
  end

  # The two rows of lamps at the bottom count the minutes. The first of these rows has 11 lamps, the second 4. In the first row every lamp represents 5 minutes. In this first row the 3rd, 6th and 9th lamp are red and indicate the first quarter, half and last quarter of an hour. The other lamps are yellow. In the last row with 4 lamps every lamp represents 1 minute.
  it "prints minutes in two rows, 11 and 4. See note." do
    assert_row_equals("YYOOOOOOOOO")
    assert_row_equals("OOOO")
    Clock.new.print_minutes(10)

    assert_row_equals("YYROOOOOOOO")
    assert_row_equals("YYYO")
    Clock.new.print_minutes(18)
  end

  it "prints a four-red row" do
    assert_row_equals("RRRR")
    Clock.new.print_four_lamps(4, "R")
  end

  it "prints a three-yellow row" do
    assert_row_equals("YYYO")
    Clock.new.print_four_lamps(3, "Y")
  end

  it "prints an eleven-lamp row for 50 minutes, i.e. pass in 50/5" do
    assert_row_equals("YYRYYRYYRYO")
    Clock.new.print_eleven_lamps(10)
  end

  context "yellow light" do
    it "is on, every other second" do
      assert_row_equals("Y")
      assert_row_equals("OOOO")
      assert_row_equals("OOOO")
      assert_row_equals("OOOOOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new.lamps("00:00:00")
    end

    it "is off on odd-numbered seconds" do
      assert_row_equals("O")
      assert_row_equals("OOOO")
      assert_row_equals("OOOO")
      assert_row_equals("OOOOOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new.lamps("00:00:01")
    end
  end

  context "hour lamps" do
    it "shows four lamps on row 2 for 10am" do
      assert_row_equals("Y")
      assert_row_equals("RROO")
      assert_row_equals("OOOO")
      assert_row_equals("OOOOOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new.lamps("10:00:00")
    end

    it "shows lamps on both rows for 11am" do
      assert_row_equals("Y")
      assert_row_equals("RROO")
      assert_row_equals("ROOO")
      assert_row_equals("OOOOOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new.lamps("11:00:00")
    end

    it "shows lamps on both rows for 2pm" do
      assert_row_equals("Y")
      assert_row_equals("RROO")
      assert_row_equals("RRRR")
      assert_row_equals("OOOOOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new.lamps("14:00:00")
    end
  end

  context "minute lamps" do
    it "shows two yellow minute lamps for ten minutes past the hour" do
      assert_row_equals("Y")
      assert_row_equals("OOOO")
      assert_row_equals("OOOO")
      assert_row_equals("YYOOOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new.lamps("00:10:00")
    end

    it "shows red lamps for minutes on the quarter-hour" do
      assert_row_equals("Y")
      assert_row_equals("OOOO")
      assert_row_equals("OOOO")
      assert_row_equals("YYROOOOOOOO")
      assert_row_equals("OOOO")
      Clock.new.lamps("00:15:00")
    end

    it "shows yellow lamps for minutes not divisible by five" do
      assert_row_equals("Y")
      assert_row_equals("OOOO")
      assert_row_equals("OOOO")
      assert_row_equals("YYROOOOOOOO")
      assert_row_equals("YYYO")
      Clock.new.lamps("00:18:00")
    end

    it "shows time paired" do
      assert_row_equals("O")
      assert_row_equals("OOOO")
      assert_row_equals("RROO")
      assert_row_equals("YYRYYROOOOO")
      assert_row_equals("OOOO")
      Clock.new.lamps("02:30:01")
    end
  end

  def assert_row_equals(string)
    $stdout.should_receive(:puts).with(string)
  end
end