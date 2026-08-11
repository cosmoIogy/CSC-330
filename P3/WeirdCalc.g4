// GRAMMAR
grammar WeirdCalc;

@header {
import java.util.HashMap;
import java.util.Map;
}

@members {
    private Map<String, Integer> memory = new HashMap<>();
}

// PARSER

program
@init {
    memory.clear();
}
    : line*
    ;

line
    : assignment SEMI
    | print SEMI
    ;

assignment
    : ID EQ exp
      {
          memory.put($ID.text, $exp.val);
      }
    ;

print
    : PRINT LPAREN exp RPAREN
      {
          System.out.println($exp.val);
      }
    | PRINT LPAREN RPAREN
      {
          System.out.println();
      }
    ;

exp returns [int val]
    : left=exp HASH right=item
      {
          int y = $right.val;
          $val = (y != 0 && ($left.val % y == 0)) ? 0 : 1;
      }
    | item
      {
          $val = $item.val;
      }
    ;

item returns [int val]
    : left=operand AT right=item
      {
          $val = Math.abs($left.val + $right.val);
      }
    | left=operand TILDE right=item
      {
          $val = ($left.val * $left.val) + ($right.val * $right.val);
      }
    | operand
      {
          $val = $operand.val;
      }
    ;

operand returns [int val]
    : SIGNUM op=operand
      {
          if ($op.val < 0) $val = -1;
          else if ($op.val > 0) $val = 1;
          else $val = 0;
      }
    | MINUS op=operand
      {
          $val = -$op.val;
      }
    | data
      {
          $val = $data.val;
      }
    ;

data returns [int val]
    : INT
      {
          $val = Integer.parseInt($INT.text);
      }
    | ID
      {
          String varName = $ID.text;
          if (memory.containsKey(varName)) {
              $val = memory.get(varName);
          } else {
              System.err.println("Error: Uninitialized variable '" + varName + "'");
              $val = 0;
          }
      }
    ;

// LEXER

PRINT   : 'print' ;
SEMI    : ';' ;
EQ      : '=' ;
LPAREN  : '(' ;
RPAREN  : ')' ;
HASH    : '#' ;
AT      : '@' ;
TILDE   : '~' ;
SIGNUM  : '$' ;
MINUS   : '-' ;

INT     : [0-9]+ ;
ID      : [a-zA-Z][a-zA-Z0-9]* ;

WHITE_SPACE: [ \t\n\r\f]+ -> skip;
LINE_COMMENT: '//' ~('\r'|'\n')* -> skip;