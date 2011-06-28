# coding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Russian(Русский)" do

  it "should parse something" do
    Chronic18n.parse("следующий понедельник", :ru).should be_a Time
  end

  it "should parse hour" do
    Chronic18n.parse("в 7 часов", :ru).hour.should eql((Time.now.hour + 7) % 24)
  end

  it "should parse hour" do
    Chronic18n.parse("в 7 минут", :ru).min.should eql((Time.now.min + 7) % 60)
  end

  it "should parse sunday" do
    Chronic18n.parse("воскресенье", :ru).wday.should eql(0)
  end

  it "should parse monday" do
    Chronic18n.parse("понедельник", :ru).wday.should eql(1)
  end

  it "should parse monday" do
    Chronic18n.parse("пон.", :ru).day.should eql 1
  end

  it "should parse month" do
    Chronic18n.parse("3 мая", :ru).month.should eql(5)
  end

  it "should parse next month" do
    Chronic18n.parse("следующий месяц", :ru).month.should eql((Time.now.month + 1 % 12))
  end

  it "should parse today" do
    Chronic18n.parse("сегодня", :ru).day.should eql((Time.now.day))
  end

  it "should parse today at time" do
    time = Chronic18n.parse("сегодня at 6pm", :ru)
    time.day.should eql Time.now.day
    time.hour.should eql 18
  end

end