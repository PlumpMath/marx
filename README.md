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
Values are decleared with *comrade*, *union*, and *duty* declarations.

```
    comrade Kazimir has ability true
    comrade Alexei has ability 5
    comrade Dmitri has ability 7.8
    comrade Grigori has ability "Moscow"

    union Trade has comrades Alexei, Dmitri
    union Food has comrade Kazimir
    union Fishing has comrade Dmitri; includes Trade union, Food union

    duty Fishing requires many comrades and
    from each according to
        ability * rank
    to each according to his needs
```

##Grammar

```
    <program>               ::= <duty-declaration>*<five-year-plan>+
    <five-year-plan>        ::= <comment>* 
                                for the next five years<newline>
                                <plan><plan><plan><plan><plan>
                                for the people!<newline>
                                <comment>*
    <plan>                  ::= (<duty-declaration> | <comment>)*
                                in year <five-year-digit><newline> 
                                <year-tasks>+<newline>
                                for production!<newline>
    <year-tasks>            ::= <comrade-declaration> 
                                | <union-declaration>
                                | <duty-declaration>
                                | <unite>
                                | <comment-soft>
                                | <year-task><newline><year-task>
    <comment>               ::= <comment-soft><newline>
    <comment-soft>          ::= account <character>*
    <comrade-declaration>   ::= comrade <name> has ability (<string-value> 
                                                            | <floating-value> 
                                                            | <integral-value> 
                                                            | <boolean-value>)
    <union-declaration>     ::= <union-reference>(<has-comrades> | <includes-unions>
                                                | <has-comrades>; <includes-unions>
    <duty-declaration>      ::= <duty-reference> requires <comrade-count> comrades and<newline>
                                from each according to<newline>
                                    (<expression-list> | <comment>)*
                                to each according to his needs<newline>
    <unite>                 ::= workers of <union-reference-list> unite for <duty-reference>!
    <expression-list>       ::= <expression> | <expression-list><expression>
    <expression>            ::= <name><newline> | <name> [*/+\-] <name><newline>
    <comrade-count>         ::= many | <integral-value>
    <has-comrades>          ::= has comrade <name> | has comrades <name-list>
    <includes-unions>       ::= includes <union-list>
    <union-reference-list>  ::= <union-reference> | <union-reference-list>, <union-reference>
    <duty-reference>        ::= <name> duty
    <union-reference>       ::= <name> union
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
