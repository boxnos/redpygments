require 'spec_helper'
require 'open3'

command = "bundle exec redpygments"
markdown = "spec/test.md"
template = "template/default.slim"

def exec(*cmd)
  yield Open3.capture3 *cmd
end

def exec_success_and(*cmd)
  exec *cmd do |o, e, s|
    expect(s.success?).to be true
    yield o, e
  end
end

describe command do
  it "not args" do
    exec_success_and command, stdin_data: "# hello" do |o, e|
      expect(o).to eq "<h1>hello</h1>\n\n"
    end
  end

  it markdown do
    exec_success_and "#{command} #{markdown}" do |o, e|
      expect(o).to match /highlight/
    end
  end

  it "#{markdown} -s #{template}}" do
    exec_success_and "#{command} #{markdown} -s #{template}" do |o, e|
      expect(o).to match /html.*highlight/m
    end
  end

  it "#{markdown} -d -o template/output.html" do
    exec_success_and "#{command} #{markdown} -s #{template} -o template/output.html" do |o, e|
      expect(o).to eq ""
    end
  end
end

describe Redpygments do
  it 'has a version number' do
    expect(Redpygments::VERSION).not_to be nil
  end
end
