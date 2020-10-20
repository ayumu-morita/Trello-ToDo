require 'trello'
require 'pry'

def puts_todos
  
  configure
  cards = get_cards
  
  puts '----------------------'
  puts '【ToDo】'
  cards.each do |card|
    puts card.name
  end
  puts '----------------------'
end

def configure
  Trello.configure do |config|
    config.developer_public_key = '1eadaec3a7249d92af45a75030eb1793' # The "key" from step 1
    config.member_token = '7cb86bd3437f6860a1fef82de6aec9ddaec79eb425141e5c831e8f3f3c831f8d' # The token from step 2.
  end
end

def get_cards
  member = Trello::Member.find('mayumusou@gmail.com')
  boards = member.boards
  board = boards.find { |board| board.name == 'ToDo' }
  list = board.lists[0]
  cards = list.cards
  cards
end

puts_todos