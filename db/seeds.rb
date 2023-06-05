c = User.create!(email: 'colette@covermymeds.com',
                 password: 'password', text_color: "#%06x" % (rand * 0xffffff))

r = User.create!(email: 'rosie@covermymeds.com',
                 password: 'password', text_color: "#%06x" % (rand * 0xffffff))

b = User.create!(email: 'brooke@covermymeds.com',
                 password: 'password', text_color: "#%06x" % (rand * 0xffffff))

Message.create!(body: 'Hello! Here to talk about puppies', user_id: c.id)
Message.create!(body: 'Hello! Here to talk about snacks', user_id: r.id)
Message.create!(body: 'Hello! Here to talk about working out', user_id: b.id)
