# codecov.io
require 'simplecov'

if ENV['CI']=='true'
  SimpleCov.start do
    add_filter '/spec/'
  end
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'japi'

if ENV['CI']=='true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

def clue_resp
  '[{"id":107165,"answer":"a bishop","question":"...of chess pieces","value":200,"airdate":"2010-11-03T12:00:00.000Z","created_at":"2014-02-14T02:13:56.847Z","updated_at":"2014-02-14T02:13:56.847Z","category_id":300,"game_id":null,"invalid_count":null,"category":{"id":300,"title":"alphabetically first","created_at":"2014-02-11T22:48:12.011Z","updated_at":"2014-02-11T22:48:12.011Z","clues_count":20}}]'
end

def category_resp
  '{"id":8056,"title":"i promised you the rose garden","clues_count":5,"clues":[{"id":62857,"answer":"Richard Nixon","question":"This presidents daughter Tricia was married in the White House Rose Garden","value":200,"airdate":"2005-07-12T12:00:00.000Z","category_id":8056,"game_id":null,"invalid_count":null},{"id":62863,"answer":"a turkey","question":"If the prospective \"pardonee\" one of these cant fulfill his duties at an annual Rose Garden event, an alternate is ready","value":400,"airdate":"2005-07-12T12:00:00.000Z","category_id":8056,"game_id":null,"invalid_count":null},{"id":62869,"answer":"magnolia","question":"Rose Garden trees include this tree--Mississippis state tree, flower \u0026 by golly, its in the state nickname too","value":600,"airdate":"2005-07-12T12:00:00.000Z","category_id":8056,"game_id":null,"invalid_count":null},{"id":62875,"answer":"(Ruth) Ginsburg","question":"Many Supreme Court justices have been introduced in the Rose Garden, including her, Clintons 1st pick","value":800,"airdate":"2005-07-12T12:00:00.000Z","category_id":8056,"game_id":null,"invalid_count":null},{"id":62881,"answer":"(Andrei) Gromyko","question":"JFKs first guest in the Rose Garden was this foreign minister of the USSR who held his job from 1957 to 1985","value":1000,"airdate":"2005-07-12T12:00:00.000Z","category_id":8056,"game_id":null,"invalid_count":null}]}'
end

def categories_resp
  '[{"id":10044,"title":"classic lit","clues_count":10},{"id":11507,"title":"bay o wolf","clues_count":5},{"id":11508,"title":"gullible travels","clues_count":5}]'
end

