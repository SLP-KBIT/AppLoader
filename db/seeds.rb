
engineer = User.create(name: 'Engineer', account: 'engineer', password_digest: 'hoge', icon: 'hoge.png')
group = engineer.groups.create(name: 'engineer', summary: 'hoge', icon: 'icon.png')

tag = Tag.create(name: '富永研究室')

game = group.games.create(title: '眠れるラボのなおすけ', summary: 'naosuke', version: '1.0', game_file: 'sample.exe', format: 'web', icon: 'sample.png')
tag.games << game

(1..30).to_a.each do |i|
  game = group.games.create(title: "Game#{i}", summary: 'naosuke', version: '1.0', game_file: 'sample.exe', format: 'web', icon: 'sample.png')
  tag.games << game
end
