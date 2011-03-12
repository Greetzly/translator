# encoding: UTF-8
require 'spec_helper'

describe Translator::MongoStore do
  before :each do
    @store = Translator.current_store
    @store.clear_database
  end

  it "should be possible to set translation value" do
    @store["pl.hello.world"] = "Witaj, świecie!"
    @store["pl.hello.world"].should eql("Witaj, świecie!")
  end

  it "should list all keys" do
    @store["pl.hello.world"] = "Witaj, świecie!"
    @store["en.hello.world"] = "Hello, World!"
    @store.keys.should include("pl.hello.world")
    @store.keys.should include("en.hello.world")
  end
end
