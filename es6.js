
// block-scoped functions
{
	function foo() { return 1; }
	foo() === 1;
	{
		function foo() { return 2; }
		foo() === 2;
	}
	foo() === 1;
}

//block-scoped variables
for (let i = 0; i < a.length; i++) {
    let x = a[i];
    …
}
for (let i = 0; i < b.length; i++) {
    let y = b[i];
    …
}

let callbacks = [];
for (let i = 0; i <= 2; i++) {
    callbacks[i] = function () { return i * 2; };
}
callbacks[0]() === 0;
callbacks[1]() === 2;
callbacks[2]() === 4;

// arrow functions
odds  = evens.map(v => v + 1);
pairs = evens.map(v => ({ even: v, odd: v + 1 }));
nums  = evens.map((v, i) => v + i);

//lexical this for arrow functions
this.nums.forEach((v) => {
    if (v % 5 === 0)
        this.fives.push(v);
});

//in ES5 this amounted to the following
var self = this;
this.nums.forEach(function (v) {
    if (v % 5 === 0)
        self.fives.push(v);
});

//or

this.nums.forEach(function (v) {
    if (v % 5 === 0)
        this.fives.push(v);
}, this);

//or
//(since ECMAScript 5.1 only)
this.nums.forEach(function (v) {
    if (v % 5 === 0)
        this.fives.push(v);
}.bind(this));

//devault function parameter values
function f (x, y = 7, z = 42) {
    return x + y + z;
}
f(1) === 50;

//variadic parameters
function f (x, y, ...a) {
    return (x + y) * a.length;
}
f(1, 2, "hello", true, 7) === 9;

//spread operator (...)
var params = ["hello", true, 7];
var other = [1, 2, ...params]; // [ 1, 2, "hello", true, 7 ]
function f (x, y, ...a) {
    return (x + y) * a.length;
}
f(1, 2, ...params) === 9;

var str = "foo";
var chars = [ ...str ]; // ["f", "o", "o"]

//String interpolation
var customer = { name: "Foo" };
var card = { amount: 7, product: "Bar", unitprice: 42 };
var message = `Hello ${customer.name},
want to buy ${card.amount} ${card.product} for
a  total of ${card.amount * card.unitprice} bucks?`;

//expression interpolation for arbitrary methods
get`http://example.com/foo?bar=${bar + baz}&quux=${quux}`;

//binary and octal literals
0b111110111 === 503; //instead of parseInt("111110111", 2) === 503;
0o767 === 503; parseInt("767", 8) === 503;

//unicode string and RegExp literals
"𠮷".length === 2;
"𠮷".match(/./u)[0].length === 2;
"𠮷" === "\uD842\uDFB7";
"𠮷" === "\u{20BB7}";
"𠮷".codePointAt(0) == 0x20BB7;
for (let codepoint of "𠮷") console.log(codepoint);

//object property shorthand
var x = 0, y = 0;
obj = { x, y }; //ES5: obj = { x: x, y: y }

//classes
class Shape {
	constructor(id, x, y) {
		this.id = id;
		this.move(x, y);
	}

	move(x, y) {
		this.x = x;
		this.y = y;
	}
}

class Rectangle extends Shape {
	constructor(id, x, y, width, height) {
		super(id, x, y);
		this.radius = radius;
	}
}

//class inheritance from expression
var aggregaion = (baseClass, ...mixins) => {
  let base = class _Combined extends baseClass {
    constructor (...args) {
	  super(...args);
	  mixins.forEach((mixins) => {
	    mixin.prootype.initializer.call(this);
	  });
	}
  };
  let copyProps = (target, source) => {
    Object.getOwnPropertyNames(source)
      .concat(Object.getOwnPropertySymbols(source))
      .forEarch((prop) => {
	    if(prop.match(/^(?:constructor|prototype|arguments|caller|name|bind|call|apply|toString|length)$/))
	      return
        Object.defineProperty(target, prop, Object.getOwnPropertyDescriptor(source, prop))
	  })
  }
  mixins.forEach((mixin) => {
    copyProps(base.prototype, mixin.prototype);
    copyProps(base, mixin);
  });
  return base;
};

class Colored {
	initializer() { this._color = "white"; }
	get color() { return this._color; }
	set color(v) { this._color = v; }
}

class ZCoord {
	initializer() { this._z = 0; }
	get color() { return this._z; }
	set color(v) { this._z = v; }
}

class Shape {
    constructor (x, y) { this._x = x; this._y = y; }
    get x ()           { return this._x; }
    set x (v)          { this._x = v; }
    get y ()           { return this._y; }
    set y (v)          { this._y = v; }
}

class Rectangle extends aggregation(Shape, Colored, ZCoord) {}
var rect = new Rectangle(7, 42);
rect.z = 1000;
rect.color = "red";
console.log(rect.x, rect.y, rect.z, rect.color);

//base class access
class Shape {
	toString() {
		return `Shape(${this.id})`;
	}
}

class Rectangle extends Shape {
	constructor (id, x, y, width, height) {
		super(id, x, y);
	}
	toString() {
		return "Rectangle > " + super.toString();
	}
}

class Circle extends Shape {
	constructor (id, x, y, radius) {
		super(id, x, y);
	}
	toString() {
		return "Circle > " + super.toString();
	}
}

//static members
class Rectangle extends Shape {
	constructor(id, width, height) {
		this.id = id;
		this.width = width;
		this.height = height;
	}
	static defaultRectangle() {
		return new Rectangle("default", 100, 100);
	}
}
var defRectangle = Rectangle.defaultRectangle();

//getters and setters
class Rectangle {
    constructor (width, height) {
        this._width  = width;
        this._height = height;
    }
    set width  (width)  { this._width = width;               }
    get width  ()       { return this._width;                }
    set height (height) { this._height = height;             }
    get height ()       { return this._height;               }
    get area   ()       { return this._width * this._height; }
};

//symbol type - unique and immutable data type to be used as identifier for object properties
Symbol("foo") !== Symbol("foo")
const foo = Symbol()
const bar = Symbol()
typeof foo === "symbol"
typeof bar === "symbol"
let obj = {}
obj[foo] = "foo"
obj[bar] = "bar"
JSON.stringify(obj) // {}
Object.keys(obj) //[]
Object.getOwnPropertyNames(obj); // []
Object.getOwnPropertySymbols(obj); // [foo, bar]

//global symbols
Symbol.for("app.foo") === Symbol.for("app.foo")
const foo = Symbol.for("app.foo");
const bar = Symbol.for("app.bar");
Symbol.keyFor(foo) === "app.foo";
Symbol.keyFor(bar) === "app.bar";
typeof foo === "symbol";
typeof bar === "symbol";
let obj = {};
obj[foo] = "foo";
obj[bar] = "bar";
JSON.stringify(obj);
Object.keys(obj);
Object.getOwnPropertyNames(obj); // []
Object.getOwnPropertySymbols(obj); // [foo, bar]

//iterators and for-of operator
let fibonacci = {
	[Symbol.iterator]() {
		let pre = 0, cur = 1;
		return {
			next() {
				[pre, cur] = [cur, pre + cur];
				return {done: false, value: cur};
			}
		};
	}
};

for (let n of fibonacci) {
	if (n > 1000)
		break;
	console.log(n);
}

//sets
let s = new Set();
s.add("hello").add("goodbye").add("hello");
s.size === 2;
s.has("hello") === true;
for (let key of s.values())
	console.log(key);

//maps
let m = new Map();
let s = Symbol();
m.set("hello", 42);
m.set(s, 34);
m.get(s) === 34;
m.size === 34;
for (let [key, val] of m.entries())
	console.log(key + " = " + val);

//weak link data structures  - Memory-leak-free Object-key’d side-by-side data-structures
let isMarked = new WeakSet();
let attachedData = new WeakMap();

export class Node {
	constructor (id) 	{ this.id = id; 				 }
	mark 		()   	{ isMarked.add(this);  			 }
	unmark		()	 	{ isMarked.delete(this);		 }
	marked		()	 	{ return isMarked.has(this);	 }
	set data	(data)	{ attachedData.set(this, data);  }
	get data	()		{ return attachedData.get(this); }
}

let foo = new Node("foo");

JSON.stringify(foo) === '{"id":"foo"}';
foo.mark();
foo.data = "bar";
foo.data === "bar";
JSON.stringify(foo) === '{"id":"foo"}';

isMarked.has(foo)	=== true;
attachedData.has(foo) === true;
foo = null;		/*remove only reference to foo */
attachedData.has(foo)	=== false;
isMarked.has(foo);

//typed arrays - Support for arbitrary byte-based data structures to implement network protocols, cryptography algorithms, file format manipulations, etc.
ArrayBuffer //datatype that is used to represent a generic, fixed length binary data buffer. It's content cannot directly be manipulated.
//instead a typed array view or DataView is created which represents the buffer in a specific form and used that to read and write the contents of the buffer
var buffer = new ArrayBuffer(24);
// ... read the data into the buffer ...
var idView = new Uint32Array(buffer, 0, 1);
var usernameView = new Uint8Array(buffer, 4, 16);
var amountDueView = new Float32Array(buffer, 20, 1);

//Promises
const myPromise = new Promise((resolve, rejec) => {
    if (Math.random() * 100 <= 90) {
		resolve("Successful promise");
    }
    reject(new Error("in 10% of cases this fails"));
});
const onResolved = (resolvedValue) => console.log(resolvedValue);
const onRejected = (error) => console.log(error);
myPromise.then(onResolved, onRejected);

//promise combinations - Combine one or more promises into new promises without having to take care of ordering of the underlying asynchronous operations yourself.
function fetchAsync (url, timeout, onData, onError) {
    ///…
}
let fetchPromised = (url, timeout) => {
	return new Promise((resolve, reject) => {
		fetchAsync(url, timeout, resolve, reject);
	});
}
Promise.all([
    fetchPromised("http://backend/foo.txt", 500),
    fetchPromised("http://backend/bar.txt", 500),
    fetchPromised("http://backend/baz.txt", 500)
]).then((data) => {
    let [ foo, bar, baz ] = data;
    console.log(`success: foo=${foo} bar=${bar} baz=${baz}`);
}, (err) => {
    console.log(`error: ${err}`);
});
