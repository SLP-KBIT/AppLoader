engineer = User.create(name:"Engineer", account:"engineer", password_digest:"hoge")

group = engineer.groups.create(name:"engineer", summary:"hoge")

game = group.games.create(title:"眠れるラボのなおすけ", summary:"naosuke", version:"1.0", game_file:"dammy", format:"web", icon:"dammy")

game.tags.create(name:"富永研究室")
