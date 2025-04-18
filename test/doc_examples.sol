// Examples taken from the Solidity documentation online.

// for pragma version numbers, see https://docs.npmjs.com/misc/semver#versions
pragma solidity 0.4.0;
pragma solidity v0.4.0; // like npm
pragma solidity ^0.4.0;
pragma solidity >= 0.4.0;
pragma solidity <= 0.4.0;
pragma solidity < 0.4.0;
pragma solidity > 0.4.0;
//pragma solidity != 0.4.0;
pragma solidity >=0.4.0 <0.4.8; // from https://github.com/ethereum/solidity/releases/tag/v0.4.0

pragma solidity 0.4;
pragma solidity v0.4;
pragma solidity ^0.4;
pragma solidity >= 0.4;
pragma solidity <= 0.4;
pragma solidity < 0.5;
pragma solidity > 0.4;
//pragma solidity != 0.4;
pragma solidity >=0.4 <=0.4;

pragma solidity 0;
pragma solidity v0;
pragma solidity ^0;
pragma solidity >= 0;
pragma solidity <= 0;
pragma solidity < 1;
pragma solidity > 0;
//pragma solidity != 0;
pragma solidity >=0 <=1;

pragma solidity ~0.4.24;
pragma solidity ~0.4.24 >=0.5;
pragma abicoder v2;

// Pragma statements that enable experimental (breaking) features
pragma experimental "SMTChecker";
pragma experimental     ABIEncoderV2;
pragma experimental "v0.5.0";
pragma experimental     __test;
pragma experimental     __testOnlyAnalysis;

import "SomeFile.sol";
import "SomeFile.sol" as SomeOtherFile;
import * as SomeSymbol from "AnotherFile.sol";
import {symbol1 as alias, symbol2} from "File.sol";

interface i {
  function f();
}

contract extends {}
contract export {}


abstract contract testAbstract {}

contract c {
  function c()
  {
      val1 = 1 wei;    // 1
      val2 = 1 szabo;  // 1 * 10 ** 12
      val3 = 1 finney; // 1 * 10 ** 15
      val4 = 1 ether;  // 1 * 10 ** 18
 }
  uint256 val1;
  uint256 val2;
  uint256 val3;
  uint256 val4;
}

contract receive_fallback_constructor {
    uint x;
    constructor() {
      x = 1;
    }

    receive() external payable {
    }

    fallback() external {
      x = 2;
    }
}

contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }

    function test(uint class)
    {
        require(class == 100);
        choices = ActionChoices.GoStraight;
    }
    function getChoice() returns (uint d)
    {
        d = uint256(choices);
    }
    ActionChoices choices;
}

contract Base {
    function Base(uint i)
    {
        m_i = i;
    }
    uint public m_i;
}
contract Derived is Base(0) {
    function Derived(uint i) Base(i) {}
}

contract child is ImportedFileAlias.Parent {
  function blah(){}
}

contract child is ImportedFileAlias.Parent.Guardian.Of.the.Galaxy, Alias.Foo.Bar("helo world") {}
contract Foo is Alias.Babbleboo(100), jake.pitty.Poo("hello world"), lolol           {}

contract C {
  uint248 x; // 31 bytes: slot 0, offset 0
  uint16 y; // 2 bytes: slot 1, offset 0 (does not fit in slot 0)
  uint240 z; // 30 bytes: slot 1, offset 2 bytes
  uint8 a; // 1 byte: slot 2, offset 0 bytes
  struct S {
    uint8 a; // 1 byte, slot +0, offset 0 bytes
    uint256 b; // 32 bytes, slot +1, offset 0 bytes (does not fit)
  }
  S structData; // 2 slots, slot 3, offset 0 bytes (does not really apply)
  uint8 alpha; // 1 byte, slot 4 (start new slot after struct)
  uint16[3] beta; // 3*16 bytes, slots 5+6 (start new slot for array)
  uint8 gamma; // 1 byte, slot 7 (start new slot after array)
}

contract test {
  function f(uint x, uint y) returns (uint z) {
    var c = x + 3;
    var b = 7 + (c * (8 - 7)) - x;
    return -(-b | 0);
  }
}

contract test {
  function f(uint x, uint y) returns (uint z) {
    return 10;
  }
}

contract c {
  function () returns (uint) { return g(8); }
  function g(uint pos) internal returns (uint) { setData(pos, 8); return getData(pos); }
  function setData(uint pos, uint value) internal { data[pos] = value; }
  function getData(uint pos) internal { return data[pos]; }
  mapping(uint => uint) data;
  mapping(uint input => uint output) data1;
}

contract Sharer {
    function sendHalf(address addr) returns (uint balance) {
        if (!addr.send(msg.value/2))
            throw; // also reverts the transfer to Sharer
        return address(this).balance;
    }
}

/// @dev Models a modifiable and iterable set of uint values.
library IntegerSet 
{
  struct data
  {
    /// Mapping item => index (or zero if not present)
    mapping(uint => uint) index;
    /// Items by index (index 0 is invalid), items with index[item] == 0 are invalid.
    uint[] items;
    /// Number of stored items.
    uint size;
  }
  struct Request {
   bytes calldata data;
   function(bytes memory) external callback;
  }
  function bar(uint[] memory self, function (uint) pure returns (uint) f)  public {
   (bool success, bytes memory data) = otherContract.call("f");
   uint[] calldata x = m_x;
  }
  function f(uint[][] calldata x) external {}
  function insert(data storage self, uint value) returns (bool alreadyPresent)
  {
    uint index = self.index[value];
    if (index > 0)
      return true; ////////////////////
    else
    {
      if (self.items.length == 0) self.items.length = 1;
      index = self.items.length++;
      self.items[index] = value;
      self.index[value] = index;
      self.size++;
      return false;
    }
  }
  function remove(data storage self, uint value) returns (bool success)
  {
    uint index = self.index[value];
    if (index == 0)
      return false;
    delete self.index[value];
    delete self.items[index];
    self.size --;
  }
  function contains(data storage self, uint value) returns (bool)
  {
    return self.index[value] > 0;
  }
  function iterate_start(data storage self) returns (uint index)
  {
    return iterate_advance(self, 0);
  }
  function iterate_valid(data storage self, uint index) returns (bool)
  {
    return index < self.items.length;
  }
  function iterate_advance(data storage self, uint index) returns (uint r_index)
  {
    index++;
    while (iterate_valid(self, index) && self.index[self.items[index]] == index)
      index++;
    return index;
  }
  function iterate_get(data storage self, uint index) returns (uint value)
  {
      return self.items[index];
  }
}

/// How to use it:
contract User
{
  /// Just a struct holding our data.
  IntegerSet.data data;
  /// Insert something
  function insert(uint v) returns (uint size)
  {
    /// Sends `data` via reference, so IntegerSet can modify it.
    IntegerSet.insert(data, v);
    /// We can access members of the struct - but we should take care not to mess with them.
    return data.size;
  }
  /// Computes the sum of all stored data.
  function sum() returns (uint s)
  {
    for (var i = IntegerSet.iterate_start(data); IntegerSet.iterate_valid(data, i); i = IntegerSet.iterate_advance(data, i))
      s += IntegerSet.iterate_get(data, i);
  }
}

// This broke it at one point (namely the modifiers).
contract DualIndex {
  mapping(uint => mapping(uint => uint)) data;
  address public admin;

  // Placeholder statement (both with & without semicolon should be parsed)
  modifier restricted { if (msg.sender == admin) _; }
  modifier restricted { if (msg.sender == admin) _ }
  modifier restricted {
    foobar();
    _

                  ;
  }

  function DualIndex() {
    admin = msg.sender;
  }

  function set(uint key1, uint key2, uint value) restricted {
    uint[2][4] memory defaults; // "memory" broke things at one time.
    data[key1][key2] = value;
  }

  function transfer_ownership(address _admin) restricted {
    admin = _admin;
  }

  function lookup(uint key1, uint key2) returns(uint) {
    return data[key1][key2];
  }
}

contract A {

}

contract B {

}

contract C is A, B {

}

contract TestPrivate
{
  uint private value;
}

contract TestInternal
{
  uint internal value;
}

contract FromSolparse is A, B, TestPrivate, TestInternal {
  function() {
    uint a = 6 ** 9;
    var (x) = 100;
    var (a, b, c, fo, bangy) = callMyFunc();
    var (a, b, c, fo, bangy) = (1,2,3,4,5);
    (a, b, c, fo, bangy) = (10,20,30,40,50);
    uint y = 2 days;
  }
}

contract TestAddress {
  function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        (bool success, bytes memory returndata) = target.call{ value: value }(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }
}

contract CommentedOutFunction {
  // FYI: This empty function, as well as the commented
  // out function below (bad code) is important to this test.
  function() {

  }

  // function something()
  //  uint x = 10;
  // }
}

library VarHasBrackets {
  string constant specialRight = "}";
  string immutable specialRight2 = "}";
  //string storage specialLeft = "{";
}

library UsingExampleLibrary {
  function sum(uint[] storage self) returns (uint s) {
    for (uint i = 0; i < self.length; i++)
      s += self[i];
  }
}

contract UsingExampleContract {
  using UsingExampleLibrary for uint[];
}

contract NewStuff {
  uint[] b;

  function someFunction() payable {
    string storage a = hex"ab1248fe";
    b[2+2];
  }
}

contract TryCatch {

    function _checkOnERC721Received(address from, address to, uint256 tokenId, bytes memory _data)
        private returns (bool)
    {
        if (to.isContract()) {
            try IERC721Receiver(to).onERC721Received(_msgSender(), from, tokenId, _data) returns (bytes4 retval) {
                return retval == IERC721Receiver(to).onERC721Received.selector;
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert("ERC721: transfer to non ERC721Receiver implementer");
                } else {
                    // solhint-disable-next-line no-inline-assembly
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
           
        } else {
            return true;
        }
    }
}

// modifier with expression
contract MyContract {
  function fun() mymodifier(foo.bar()) {}
}

contract LetsHaveLotsOfKeywordsInStateVariablesInNoParticularOrderBecauseIsLotsOfFun {
    uint public immutable override test = 1;
    uint public constant  test2;
    uint public override  test3;
    uint constant override public test4;
    uint constant override  test5;
    uint constant public override test13;
    uint override  test6;
    uint constant test7;
    uint public test12;
    uint override public constant test8;
    uint override constant public  test9;
    uint override public  test10;
    uint override constant test11;

        uint x;

        uint override x;


        uint public x;

        uint public override x;

        uint internal x;

        uint internal override x;

        uint private x;

        uint private override x;

        uint override public x;

        uint override internal x;

        uint override private x;

        uint constant x;

        uint constant override x;

        uint constant public x;

        uint constant public override x;

        uint constant internal x;

        uint constant internal override x;

        uint constant private x;

        uint constant private override x;

        uint public constant x;

        uint public constant override x;

        uint internal constant x;

        uint internal constant override x;

        uint private constant x;

        uint private constant override x;

        uint override constant x;


        uint immutable x;

        uint immutable override x;

        uint immutable public x;

        uint immutable public override x;

        uint immutable internal x;

        uint immutable internal override x;

        uint immutable private x;

        uint immutable private override x;

        uint public immutable x;

        uint public immutable override x;

        uint internal immutable x;

        uint internal immutable override x;

        uint private immutable x;

        uint private immutable override x;

        uint override immutable x;

        uint transient x;

        uint transient override x;

        uint transient public x;

        uint transient public override x;

        uint transient internal x;

        uint transient internal override x;

        uint transient private x;

        uint transient private override x;

        uint public transient x;

        uint public transient override x;

        uint internal transient x;

        uint internal transient override x;

        uint private transient x;

        uint private transient override x;

        uint override transient x;


}

library GetCode {
    function at(address _addr) returns (bytes o_code) {
        assembly ("memory-safe") {
            if slt(x, 0) { x := sub(0, x) }
            // retrieve the size of the code, this needs assembly
            let size := extcodesize(_addr)
            // allocate output byte array - this could also be done without assembly
            // by using o_code = new bytes(size)
            o_code := mload(0x40)
            // new "memory end" including padding
            mstore(0x40, add(o_code, and(add(add(size, 0x20), 0x1f), not(0x1f))))
            // store length in memory
            mstore(o_code, size)

            if eq(0, myJYT) {
                x := sub(0, x)
            }

            // actually retrieve the code, this needs assembly
            extcodecopy(_addr, add(o_code, 0x20), 0, size)

            // label
            foobar:
              jumpi(foobar, eq(0,0))
        }
    }
}

contract assemblyLocalBinding {
  function test(){
    assembly {
      let x
      let abc123

      let v := 1
      let x := 0x00
      let y := x
      let z := "hello"
      let a, bcd, efgh := callMyFunc()

      a := 0
      b := 90172
      c := myVariable
      d := foobar()
      e := "lala"
      x, yz, abc := somerandomfunc()
    }
  }
}

contract assemblyReturn {
  uint a = 10;

  function get() constant returns(uint) {
    assembly {
        mstore(0x40, sload(0))
        byte(0)
        address(0)
        return(0x40,32)
    }
  }
}

contract assemblyForLoop {
  function foobar() {
    assembly {
      let x := 0
      for { let i := 0 } lt(i, 0x100) { i := add(i, 0x20) } {
        x := add(x, mload(i))
      }
    }
  }

  function bax() {
    assembly {
      let x := 0
      let i := 0
      for { } lt(i, 0x100) { } {     // while(i < 0x100)
        x := add(x, mload(i))
        i := add(i, 0x20)
      }
    }
  }
}

contract assemblyFunction {
  function foobar() {
    assembly {
      function foo(){}
      function      foo   (abc   ,   butter_chicken   ,    coala
      ,   jasmine)       ->     pewdiepie  ,    tseries,lambo {

      }

      function bar(lorem, ipsum, dollar, quote) -> cashew, nut, chocolate, blueberry {
        let cashew := 0
        let nut := 0
      }

      function axe() -> big, small {}
      function baxe(a, bc, def, ghij) {}
    }
  }
}

contract usesConst {
  uint const = 0;
}

/*************/
contract memoryArrays {
  uint seven = 7;

  function returnNumber(uint number) returns (uint){
    return number;
  }

  function alloc() {
    uint[] memory a = new uint[](7);
    uint[] memory b = new uint[](returnNumber(seven));
  }
}

contract DeclarativeExpressions {
  uint a;
  uint b = 7;
  uint b2=0;
  uint public c;
  uint constant public d;
  uint public constant e;
  uint private constant f = 7;
  struct S { uint q;}

  function ham(S storage s1, uint[] storage arr) internal {
    uint x;
    uint y = 7;
    S storage s2 = s1;
    uint[] memory stor;
    uint[] storage stor2 = arr;
  }
}

/* random comment */
contract VariableDeclarationTuple {
  function getMyTuple() returns (bool, bool){
    return (true, false);
  }
  
  function ham (){
    var (x, y) = (10, 20);
    var (a, b) = getMyTuple();
    var (,c) = (10, 20);
    var (d,,) = (10, 20, 30);
    var (,e,,f,) = (10, 20, 30, 40, 50);

    var (
      num1, num2,
      num3, ,num5
    ) = (10, 20, 30, 40, 50);
  }
}

contract TypeIndexSpacing {
  uint [ 7 ] x;
  uint  []  y;
}

/**
 Ballot contract
 */
contract Ballot {

    struct Voter {
        uint weight;
        bool voted; /** yayy **/       /* yayy 2 ****/    /* yayy 3 ****/
    }

    function abstain() returns (bool) {
      return false;
    }

    function foobar() payable owner (myPrice) returns (uint[], address myAdd, string[] names) {}
    function foobar() payable owner (myPrice) returns (uint[], address myAdd, string[] names);

    Voter you = Voter(1, true);

    /**/
    /* hello //world hoa re */

    Voter me = Voter({
        weight: 2,
        voted: abstain()
    });

    // now /* inside this!! */ very very good!

    Voter airbnb = Voter({
      weight: 2,
      voted: true,
    });
}

contract NumbersWithUnderscorers {
  int x = 10_000_000;
}

contract multilineReturn {
/*
Hi my name
what
my name is
who
my name is
chika chika slim shady B-)
*/
  function a() returns (uint x) {
    return
      5;
  }
}

contract Bar {
    function(address) external returns (address)[3] private foo;
    function(uint, string) external returns (address) public bar;
    function bar(address) external returns (address);
    
    function dell(function(int a, bool bcd) payable myFunc) internal {
        function(address) external returns (address)[3] chumma = foo;
        function(uint, string) external internal pure  payable  constant   view returns (address)    [] bax = bar;
    }
}

contract EventTester {
    event Transfer(string name, uint amount);

    function foo() public {
        Transfer("Jacob", 2901);
        emit Transfer("Jacob", 2901);
    }
}

contract UsesNewConstructor {
    constructor(uint x, string y, address z) {
        if (true) {}
    }
}

contract UsesNewConstructor {
    address
    payable public alice;

    constructor(address payable _alice) payable public {
      address         payable x;
    }
}

contract Test {
  
   function test1() virtual;
   function test2() virtual public returns (uint) { return 1; }
    modifier myMod() override { }
    uint foo = 1;

    uint transient x;
    uint public transient x = 1;
    uint public immutable override test = 1;
    uint virtual public x;
    uint transient override(A, B) virtual x;
    uint public virtual override immutable x;






    uint public override x;

    uint transient override(A, B) x;

    function test() public {
        foo += 1;
        try this.test() {
            // require(true);
        }
        catch {}
    }
    function test() override(Base1, Base2) { }
    function test20() {
      try myFunc() returns (uint) { return 1; } catch Error(uint x) { revert(x); } catch { }
    }
}

error MyError(uint256 a, address b);



//end of file
