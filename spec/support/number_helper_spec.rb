# encoding: UTF-8

describe 'NumberHelper' do

  include NumberHelper
  
  describe '#number_to_currency' do
    
    context 'using default values' do
      
      it "correctly formats an integer" do
        output = number_to_currency(50)
        expect(output).to eq("$50.00")
      end
      
      it "correctly formats a float" do
        output = number_to_currency(50.01)
        expect(output).to eq("$50.01")
      end

      it "correctly formats a string" do
        output1 = number_to_currency("50")
        output2 = number_to_currency("50.01")

        expect(output1).to eq("$50.00")
        expect(output2).to eq("$50.01")
      end
      
      it "uses delimiters for very large numbers" do
        output1 = number_to_currency(5000)
        output2 = number_to_currency(5000000)
        output3 = number_to_currency(5000.01)
        output4 = number_to_currency(5000000.01)
        output5 = number_to_currency("5000")
        output6 = number_to_currency("5000000")
        output7 = number_to_currency("5000.01")
        output8 = number_to_currency("5000000.01")

        expect(output1).to eq("$5,000.00")
        expect(output2).to eq("$5,000,000.00")
        expect(output3).to eq("$5,000.01")
        expect(output4).to eq("$5,000,000.01")
        expect(output5).to eq("$5,000.00")
        expect(output6).to eq("$5,000,000.00")
        expect(output7).to eq("$5,000.01")
        expect(output8).to eq("$5,000,000.01")

      end

      it "does not have delimiters for small numbers" do
        output1 = number_to_currency("50")
        output2 = number_to_currency("50.01")

        expect(output1).to eq("$50.00")
        expect(output2).to eq("$50.01")
      end

    end
    
    context 'using custom options' do
      
      it 'allows changing the :unit' do
        output = number_to_currency(500, { :unit => "£" })

        expect(output).to eq("£500.00")
      end


      it 'allows changing the :precision' do
        output1 = number_to_currency(500, { :precision => 5 })
        output2 = number_to_currency(500, { :precision => 0 })

        expect(output1).to eq("$500.00000")
        expect(output2).to eq("$500")
      end
      
      it 'omits the separator if :precision is 0' do
        output = number_to_currency(500, { :precision => 0 })

        expect(output).to eq("$500")
      end
      
      it 'allows changing the :delimiter' do
        output1 = number_to_currency(5000000, { :delimiter => "/" })
        output2 = number_to_currency(5000000, { :delimiter => ";" })

        expect(output1).to eq("$5/000/000.00")
        expect(output2).to eq("$5;000;000.00")
      end
      
      it 'allows changing the :separator' do
        output1 = number_to_currency(50, { :separator => "|" })
        output2 = number_to_currency(50.01, { :separator => "|"})

        expect(output1).to eq("$50|00")
        expect(output2).to eq("$50|01")
      end
            
      it 'correctly formats using multiple options' do
        output1 = number_to_currency(5000, { :unit => "£", :precision => 5 })
        output2 = number_to_currency(5000, { :unit => "£", :delimiter => "/" })
        output3 = number_to_currency(5000, { :unit => "£", :separator => "|" })
        output4 = number_to_currency(5000, { :precision => 5, :delimiter => "/" })
        output5 = number_to_currency(5000, { :precision => 5, :separator => "|" })
        output6 = number_to_currency(5000, { :delimiter => "/", :separator => "|" })
        output7 = number_to_currency(5000, { :unit => "£", :precision => 5, :delimiter => "/" })
        output8 = number_to_currency(5000, { :unit => "£", :precision => 5, :separator => "|" })
        output9 = number_to_currency(5000, { :unit => "£", :delimiter => "/", :separator => "|" })
        output10 = number_to_currency(5000, { :precision => 5, :delimiter => "/", :separator => "|" })
        output11 = number_to_currency(5000, { :unit => "£", :precision => 5, :delimiter => "/", :separator => "|" })

        expect(output1).to eq("£5,000.00000")
        expect(output2).to eq("£5/000.00")
        expect(output3).to eq("£5,000|00")
        expect(output4).to eq("$5/000.00000")
        expect(output5).to eq("$5,000|00000")
        expect(output6).to eq("$5/000|00")
        expect(output7).to eq("£5/000.00000")
        expect(output8).to eq("£5,000|00000")
        expect(output9).to eq("£5/000|00")
        expect(output10).to eq("$5/000|00000")
        expect(output11).to eq("£5/000|00000")
      end
      
    end
    
  end
  
end
