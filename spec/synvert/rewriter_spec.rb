require 'spec_helper'

module Synvert
  describe Rewriter do
    it 'sets description' do
      rewriter = Rewriter.new 'this is description' do; end
      expect(rewriter.description).to eq 'this is description'
    end

    describe '#process' do
      it 'does nothing if gem_spec not match' do
        expect_any_instance_of(Rewriter::GemSpec).to receive(:match?).and_return(false)
        expect_any_instance_of(Rewriter::Instance).not_to receive(:process)
        rewriter = Rewriter.new 'description' do
          gem_spec 'synvert', '1.0.0'
          within_file 'config/routes.rb' do; end
        end
        rewriter.process
      end

      it 'delegates process to instances if gem_spec not exist' do
        expect_any_instance_of(Rewriter::Instance).to receive(:process)
        rewriter = Rewriter.new 'description' do
          within_file 'config/routes.rb' do; end
        end
        rewriter.process
      end

      it 'delegates process to instances if gem_spec matches' do
        expect_any_instance_of(Rewriter::GemSpec).to receive(:match?).and_return(true)
        expect_any_instance_of(Rewriter::Instance).to receive(:process)
        rewriter = Rewriter.new 'description' do
          gem_spec 'synvert', '1.0.0'
          within_file 'config/routes.rb' do; end
        end
        rewriter.process
      end
    end
  end
end
