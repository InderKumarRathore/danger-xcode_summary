# frozen_string_literal: true

# rubocop:disable Layout/LineLength

require File.expand_path('spec_helper', __dir__)

module Danger
  describe Danger::DangerXcodeSummary do
    it 'should be a plugin' do
      expect(Danger::DangerXcodeSummary.new(nil)).to be_a Danger::Plugin
    end

    # Second environment with different request_source
    describe 'with bitbucket request_source' do
      before do
        @dangerfile = testing_bitbucket_dangerfile
        @xcode_summary = @dangerfile.xcode_summary
        @xcode_summary.env.request_source.pr_json = JSON.parse(File.read('spec/fixtures/bitbucket_pr.json'), symbolize_names: true)
        @xcode_summary.project_root = '/Users/diogo/src/danger-xcode_summary'
      end

      describe 'where request source' do
        it 'should be bitbucket' do
          path = @xcode_summary.send(:format_path, 'lib/xcode_summary/plugin.rb', 3)
          expect(path).to eq 'lib/xcode_summary/plugin.rb'
        end
      end
    end
  end
end
# rubocop:enable Layout/LineLength
