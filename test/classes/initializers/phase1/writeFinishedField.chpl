class Foo {
  var x: bool;

  proc init(xVal) {
    x = xVal;
    writeln(x); // This should be allowed
  }
}

var foo = new Foo(true);
writeln(foo);
delete foo;
