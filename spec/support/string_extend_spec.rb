describe 'String' do

  describe "#titleize" do

    it "capitalizes each word in a string" do
      lowercase = "avengers: age of ultron"
      capitalized = "Avengers: Age Of Ultron"
      expect(lowercase.titleize).to eq capitalized
    end
    
    it "works with single-word strings" do
      single = "thor"
      capitalized = "Thor"
      expect(single.titleize).to eq capitalized
    end
    
    it "capitalizes all uppercase strings" do
      uppercase = "CAPTIAN AMERICA THE WINTER SOLDIER"
      capitalized = "Captian America The Winter Soldier"
      expect(uppercase.titleize).to eq capitalized
    end
    
    it "capitalizes mixed-case strings" do
      mixed = "guArdianS OF the GALaXy"
      capitalized = "Guardians Of The Galaxy"
      expect(mixed.titleize).to eq capitalized
    end
    
  end
  
  describe '#blank?' do

    it "returns true if string is empty" do
      empty_string = ""
      expect(empty_string.blank?).to be true
      expect(empty_string.blank?).to be_truthy
      expect(empty_string).to be_empty
    end

    it "returns true if string contains only spaces" do
      only_spaces = "    "
      expect(only_spaces.blank?).to be true
      expect(only_spaces.blank?).to be_truthy
    end

    it "returns true if string contains only tabs" do
      only_tabs = "\t\t\t"
      expect(only_tabs.blank?).to be true
      expect(only_tabs.blank?).to be_truthy
    end
    # Get a tab using a double-quoted string with \t
    # example: "\t\t\t"

    it "returns true if string contains only spaces and tabs" do
      mixed = " \t \t"
      expect(mixed.blank?).to be true
      expect(mixed.blank?).to be_truthy
    end
    
    it "returns false if string contains a letter" do
      has_letter = "   a   "
      expect(has_letter.blank?).to be false
      expect(has_letter.blank?).to be_falsey
    end

    it "returns false if string contains a number" do
      has_number = "   1   "
      expect(has_number.blank?).to be false
      expect(has_number.blank?).to be_falsey
    end
    
  end
  
end
