require 'spec_helper'
require 'open3'

command = "bundle exec redpygments"
md = "spec/test.md"
template = "template/default.slim"

def exec(*cmd)
  yield Open3.capture3 *cmd
end

describe command do
  it "not args" do
    exec command do |o, e, s|
      expect(s.success?).to be false
    end
  end

  it md do
    exec "#{command} #{md}" do |o, e, s|
      expect(s.success?).to be true
      expect(o).to match /highlight/
    end
  end

  it "#{md} -s #{template}}" do
    exec "#{command} #{md} -s #{template}" do |o, e, s|
      expect(s.success?).to be true
      expect(o).to match /html.*highlight/m
    end
  end

  it "#{md} -d -o template/output.html" do
    exec "#{command} #{md} -s #{template} -o template/output.html" do |o, e, s|
      expect(s.success?).to be true
      expect(o).to eq ""
    end
  end
end

describe Redpygments do
  it 'has a version number' do
    expect(Redpygments::VERSION).not_to be nil
  end
end
