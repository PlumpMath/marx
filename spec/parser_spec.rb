require 'spec_helper'

describe 'Parser' do
  before do
    @parser = MarxGrammarParser.new
    @output = nil
  end
  subject { @output }

  describe 'Comrade' do
    describe 'declaring one' do
      let(:input) { 'comrade Dmitri has ability 5' }
      before { @output = @parser.parse(input).transform }

      its(:name) { should == 'Dmitri' }
      its(:ability) { should == 5 }
    end
  end

  describe 'Union' do
    describe 'with one Comrade' do
      let(:input) { 'union Trade has comrade Dmitri' }
      let(:dmitri) { } # mock(:union, comrades: ['Dmitri']) }
      before { @output = @parser.parse(input).transform }

      its(:comrades) { should == :dmitri }
    end

    context 'with multiple Comrades' do
      let(:input) { 'union Trade has comrades Alexei, Grigori' }
      let(:union) do
        #mock (:union, comrades: ['Alexei', 'Grigori'])
      end
      before { @output = @parser.parse(input).transform }

      its(:name) { should == 'Trade' }
      its(:comrades) { should == union) }
    end

    context 'including unions' do
      let(:input) { 'union Trade includes Fishing union, Meat union' }
      let(:fishing) {} #mock (:union, comrades: ['Alexei', 'Grigori']) }
      let(:meat) { } #mock (:union, comrades: ['Dmitri', 'Grigori']) }

      before { @output = @parser.parse(input).transform }

      its(:comrades) { should match_array(fishing.comrades | meat.comrades) }
    end

    context 'full declaration' do
      let(:input) { 'union Trade has comrade Dmitri; includes Meat union' }
      let(:meat) {} #mock (:union, comrades: ['Alexei', 'Grigori']) }
      before { @output = @parser.parse(input).transform }

      its(:name) { should == 'Trade' }
      its(:comrades) { should match_array(meat.comrades | ['Dmitri']) }
    end
  end
end
