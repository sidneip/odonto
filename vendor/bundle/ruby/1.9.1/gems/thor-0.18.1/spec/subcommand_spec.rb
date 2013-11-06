# -*- encoding : utf-8 -*-
require 'helper'

describe Thor do

  describe "#subcommand" do

    it "maps a given subcommand to another Thor subclass" do
      barn_help = capture(:stdout) { Scripts::MyDefaults.start(%w[barn]) }
      expect(barn_help).to include("barn help [COMMAND]  # Describe subcommands or one specific subcommand")
    end

    it "passes commands to subcommand classes" do
      expect(capture(:stdout) { Scripts::MyDefaults.start(%w[barn open]) }.strip).to eq("Open sesame!")
    end

    it "passes arguments to subcommand classes" do
      expect(capture(:stdout) { Scripts::MyDefaults.start(%w[barn open shotgun]) }.strip).to eq("That's going to leave a mark.")
    end

    it "ignores unknown options (the subcommand class will handle them)" do
      expect(capture(:stdout) { Scripts::MyDefaults.start(%w[barn paint blue --coats 4])}.strip).to eq("4 coats of blue paint")
    end

    it "passes parsed options to subcommands" do
      output = capture(:stdout) { TestSubcommands::Parent.start(%w[sub print_opt --opt output]) }
      expect(output).to eq("output")
    end
  end

end
