require 'test_helper'

class ExplorerTest < ActionDispatch::IntegrationTest
  def setup
    10.times do
      FactoryGirl.create(:note_with_tags)
    end
  end

  def test_it_should_return_the_proper_list
    get '/api/notes.json'
    assert_equal 200, status
    json = JSON.parse(response.body)
    assert json['notes']
    assert json['notes'].length == 10
  end

  def test_it_should_be_in_the_correct_format
    get '/api/notes.json'
    json = JSON.parse(response.body)
    assert json['notes'].first == example_note(Note.first),
      json['notes'].first.inspect + "\n\n" + example_note(Note.first).inspect
  end

  def test_tag_lists_are_correct
    note = Note.first
    get "/api/notes/tag/#{note.tags.first.name}"
    json = JSON.parse(response.body)
    assert_equal note.tags.first.name, json['tag']['name']
    assert_equal example_note(Note.first), json['notes'].first
  end

  def test_tag_create_is_correct
    post '/api/notes',
      params: {
        title:  "My created post",
        body:   "My created body",
        tags:   "api, machine, first"
      }
    json = JSON.parse(response.body)
    assert_equal "My created post", json['note']['title']
    assert_equal 11, Note.count
    assert_equal 3, json['note']['tags'].length
  end

  def test_improper_note
    post '/api/notes',
      params: {
        title:  "",
        body:   "My created body",
        tags:   "api, machine, first"
      }
    assert_equal 400, status
    json = JSON.parse(response.body)
    assert_equal "Title can't be blank", json['errors'].first['error']
  end


  private

  def example_note(note)
    {
      "title"       => note.title,
      "body"        => note.body,
      "created_at"  => note.created_at.to_formatted_s(:iso8601),
      "updated_at"  => note.updated_at.to_formatted_s(:iso8601),
      "tags"        => note.tags.map { |t| {"name" => t.name} }
    }
  end

end
