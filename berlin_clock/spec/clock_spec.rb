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

  it "prints an eleven-lamp row for 10 minutes, i.e. pass in 2" do
    assert_row_equals("YYOOOOOOOOO")
    Clock.new.print_eleven_lamps(2)
  end

  it "shows time paired" do
    assert_row_equals("O")
    assert_row_equals("OOOO")
    assert_row_equals("RROO")
    assert_row_equals("YYRYYROOOOO")
    assert_row_equals("OOOO")
    Clock.new.lamps("02:30:01")
  end

  def assert_row_equals(string)
    $stdout.should_receive(:puts).with(string)
  end
end