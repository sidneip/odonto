# -*- encoding : utf-8 -*-
require 'test_helper'

class HintTest < ActionView::TestCase

  def with_hint_for(object, attribute_name, type, options={}, &block)
    with_concat_form_for(object) do |f|
      options[:reflection] = Association.new(Company, :company, {}) if options.delete(:setup_association)
      SimpleForm::Inputs::Base.new(f, attribute_name, nil, type, options).hint.to_s
    end
  end

  test 'hint should not be generated by default' do
    with_hint_for @user, :name, :string
    assert_no_select 'span.hint'
  end

  test 'hint should be generated with input text' do
    with_hint_for @user, :name, :string, :hint => 'Use with care...'
    assert_select 'span.hint', 'Use with care...'
  end

  test 'hint uses the current component tag set' do
    swap SimpleForm, :hint_tag => :p do
      with_hint_for @user, :name, :string, :hint => 'Use with care...'
      assert_select 'p.hint', 'Use with care...'
    end
  end

  test 'hint should use i18n based on model, action, and attribute to lookup translation' do
    store_translations(:en, :simple_form => { :hints => { :user => {
      :edit => { :name => 'Content of this input will be truncated...' }
    } } }) do
      with_hint_for @user, :name, :string
      assert_select 'span.hint', 'Content of this input will be truncated...'
    end
  end

  test 'hint should use i18n with model and attribute to lookup translation' do
    store_translations(:en, :simple_form => { :hints => { :user => {
      :name => 'Content of this input will be capitalized...'
    } } }) do
      with_hint_for @user, :name, :string
      assert_select 'span.hint', 'Content of this input will be capitalized...'
    end
  end

  test 'hint should use i18n just with attribute to lookup translation' do
    store_translations(:en, :simple_form => { :hints => {
      :name => 'Content of this input will be downcased...'
    } }) do
      with_hint_for @user, :name, :string
      assert_select 'span.hint', 'Content of this input will be downcased...'
    end
  end

  test 'hint should use i18n with lookup for association name' do
    store_translations(:en, :simple_form => { :hints => {
      :user => { :company => 'My company!' }
    } } ) do
      with_hint_for @user, :company_id, :string, :setup_association => true
      assert_select 'span.hint', /My company!/
    end
  end

  test 'hint should generate properly when object is not present' do
    with_hint_for :project, :name, :string, :hint => 'Test without object'
    assert_select 'span.hint', 'Test without object'
  end

  test 'hint should be able to pass html options' do
    with_hint_for @user, :name, :string, :hint => 'Yay!', :hint_html => { :id => 'hint', :class => 'yay' }
    assert_select 'span#hint.hint.yay'
  end
end
