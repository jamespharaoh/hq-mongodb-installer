db.abc.insert({a:"hello world\n"});
print (db.abc.find().next().a);
