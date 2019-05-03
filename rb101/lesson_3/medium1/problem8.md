QUESTION:

One day Spot was playing with the Munster family's home computer and
he wrote a small program to mess with their demographic data:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```

After writing this method, he typed the following...and before Grandpa
could stop him, he hit the Enter key with his tail:

```ruby
mess_with_demographics(munsters)
```

Did the family's data get ransacked? Why or why not?


ANSWER:

Yes. This is because item reassignment, though not mutating the item
itself, mutates the collection because the collection itself retains
the same object id while its values have been changed (reassigned to
different Integer and String objects in this case).

Also, Ruby passes in the object id of `munsters` to be used locally
as `demo_hash`'s id. If Spot had initialized a new hash within his
method and then used the `demo_hash` to build the `new_hash` iteratively
he would've been in the clear because `new_hash`'s object id would have
been unique and thus the original `munsters` hash would have been safe.
But, unfortunately for Spot, he did not, and the hash object being used
in the method IS the original `munsters` hash.
