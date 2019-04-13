QUESTION:

Locate the ruby documentation for methods `File::path` and `File#path`. How are they different?


ANSWER:

`File::path` returns the string representation of the path. Also, you call it on the `File` class
itself rather on an instance of the class.

`File#path` returns the pathname used to create that file as a string. This is called on an object 
(or instance) of the `File` class.
