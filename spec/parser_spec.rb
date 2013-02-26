require 'spec_helper'

describe 'Parser' do
  before do
    @parser = MarxGrammarParser.new
    @output = nil
  end
  subject { @output }

  describe 'Comrade' do
    describe 'declaring one' do
      let(:input) { 'Comrade Dmitri has ability 5' }
      before { @output = @parser.parse(input).transform }

      its(:name) { should == 'Dmitri' }
      its(:ability) { should == 5 }
    end
  end

  describe 'Union' do
    describe 'with one Comrade' do
      let(:input) { 'Union Trade has Comrade Dmitri' }
      let(:dmitri) { FactoryGirl.create(:union, comrades: ['Dmitri']) }
      before { @output = @parser.parse(input).transform }

      its(:comrades) { should == :dmitri }
    end

    context 'with multiple Comrades' do
      let(:input) { 'Union Trade has Comrades Alexei, Grigori' }
      let(:union) do
        FactoryGirl.create(:union, comrades: ['Alexei', 'Grigori'])
      end
      before { @output = @parser.parse(input).transform }

      its(:name) { should == 'Trade' }
      its(:comrades) { should == union) }
    end

    context 'including unions' do
      let(:input) { 'Union Trade includes Fishing Union, Meat Union' }
      let(:fishing) { FactoryGirl.create(:union, comrades: ['Alexei', 'Grigori']) }
      let(:meat) { FactoryGirl.create(:union, comrades: ['Dmitri', 'Grigori']) }

      before { @output = @parser.parse(input).transform }

      its(:comrades) { should match_array(fishing.comrades | meat.comrades) }
    end

    context 'performing duty' do
      let(:input) { 'Union Trade has Comrade Dmitri; performs Fishing Duty' }
      before { @output = @parser.parse(input).transform }

      @output.duty.name.should == 'Fishing'
    end

    context 'full declaration' do
      let(:input) { 'Union Trade has Comrade Dmitri; includes Meat Union; performs Fishing Duty' }
      let(:meat) { FactoryGirl.create(:union, comrades: ['Alexei', 'Grigori']) }
      before { @output = @parser.parse(input).transform }

      its(:name) { should == 'Trade' }
      its(:comrades) { should match_array(meat.comrades | ['Dmitri']) }
      @output.duty.name.should == 'Fishing'
    end
  end
end
