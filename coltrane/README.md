# Coltrane PoC

In this folder you will find a proof of concept.
An Auto generated partiture.

Coltrane is a ruby gem that is very useful to musicians developers.

```ruby
require 'coltrane'

def random_note
  base_note = Coltrane::Theory::Note['A']
  some_random_note = base_note + (rand * 12).to_i
  normalized = some_random_note.pitch_class
  text = normalized.name.downcase.gsub('#', 'is')
end
```

