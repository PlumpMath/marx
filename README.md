marx
====

#Introduction
Marx is a satirical programming language based on the writings of Karl Marx.
The USSRuntime is an implementation of marx, based on the regimes of Vladimir Lenin and Joseph Stalin.

In addition to their theme, marx and the USSRuntime have the following features:

* Inconsistent typing
* Expression-oriented programming
* Object deconstruction and matching
* Literate syntax
* A fickle nature
* Functions that should be pure but aren't
* Plan-based programming
* Inconsistent exception handling
* No input streams
* Stderr is generally blocked, but may be used spuriously by the runtime


#Marx -- The Revolution

Marx is a language open to interpretation and lacking in necessary details.  It is up to the specific implementation to fill in the gaps.

##Datatypes

A marxist language must support the following datatypes:

###Comrades

1. Boolean
1. Integral number
1. Floating-point number
1. String
1. Union (array)

###Duties
1. Duty (function)

Comrades are ranked in order of *specificity*.  A higher number signifies greater specificity.

##Values
Values are decleared with *Comrade*, *Union*, and *Duty* statements.

```
    Comrade Kazimir has ability true
    Comrade Alexei has ability 5
    Comrade Dmitri has ability 7.8
    Comrade Grigori has ability "Moscow"

    Union Trade has Comrades Alexei, Dmitri
    Union Food has Comrade Kazimir
    Union Fishing has Comrade Dmitri; includes Trade Union, Food Union; performs Fishing Duty

    Duty Fishing requires many Comrades and
    From each according to
        ability * rank
    To each according to his needs
```
##Usage Notes
Marx is a general-purpose language intended for light computations and inconsenquential processing. If the runtime detects that the program is too sophisticated it will suspend that program for indeterminate amounts of time. It may also force the program to perform unrelated CPU-intensive operations until the program dies.

Marx is a functional language and strictly prohibits any other paradigms. Marx programmers are well aware that the Von Neumann architecture is "opium of the people." Any attempt to write imperative logic in Marx is a violation of the Terms of Service and may result in destructive behaviors by the runtime.


*WARNING: Be sure to keep full backups of your system before running Marx programs. Marx VM's are not responsible for any loss of data, which you will almost certainly incur.*

##Grammar

```
    <program>               ::= <duty-declaration>*<five-year-plan>+
    <five-year-plan>        ::= <comment>* 
                                For the next five years<newline>
                                <plan><plan><plan><plan><plan>
                                For the people!<newline>
                                <comment>*
    <plan>                  ::= (<duty-declaration> | <comment>)*
                                In year <five-year-digit><newline> 
                                <year-tasks>+<newline>
                                For Production!<newline>
    <year-tasks>            ::= <comrade-declaration> 
                                | <union-declaration>
                                | <duty-declaration>
                                | <unite>
                                | <comment-soft>
                                | <year-task><newline><year-task>
    <comment>               ::= <comment-soft><newline>
    <comment-soft>          ::= Account <character>*
    <comrade-declaration>   ::= Comrade <name> has ability (<string-value> 
                                                            | <floating-value> 
                                                            | <integral-value> 
                                                            | <boolean-value>)
    <union-declaration>     ::= <union-reference>(<has-comrades>; <includes-unions>; <performs-duty>
                                                | <has-comrades>; <performs-duty>
                                                | <has-comrades>; <includes-unions>
                                                | <includes-unions>; <performs-duty>)
    <duty-declaration>      ::= <duty-reference> requires <comrade-count> Comrades and<newline>
                                From each according to<newline>
                                    (<expression-list> | <comment>)*
                                To each according to his needs<newline>
    <unite>                 ::= Workers of <union-reference> unite!
    <expression-list>       ::= <expression> | <expression-list><expression>
    <expression>            ::= <name><newline> | <name> [*/+\-] <name><newline>
    <comrade-count>         ::= many | <integral-value>
    <has-comrades>          ::= has Comrade <name> | has Comrades <name-list>
    <includes-unions>       ::= includes <union-list>
    <performs-duty>         ::= performs <duty-reference>
    <union-reference-list>  ::= <union-reference> | <union-reference-list>, <union-reference>
    <duty-reference>        ::= <name> Duty
    <union-reference>       ::= <name> Union
    <string-value>          ::= "<character>*"
    <floating-value>        ::= <integral-value>.<integral-value>
    <integral-value>        ::= <digit>+
    <name-list>             ::= <name> | <name-list>, <name>
    <name>                  ::= <communist-letter><miniscule-letter>*
    <boolean-value>         ::= true | false
    <digit>                 ::= [0-9]
    <five-year-digit>       ::= [1-5]
    <character>             ::= [\00-\7f]
    <communist-letter>      ::= [A-Z]
    <miniscule-letter>      ::= [a-z]
    <whitespace>            ::= [\t ]+
    <newline>               ::= [\n]
    <asterisk>              ::= \*
