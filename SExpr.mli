(** This module is a very simple parsing library for S-expressions. *)
(* Copyright (C) 2009  Florent Monnier, released under MIT license. *)
 
(** the type of S-expressions *)
type sexpr =
  | Atom of string
  | Expr of sexpr list
 
val parse_string : string -> sexpr list
(** parse from a string *)
 
val parse_ic : in_channel -> sexpr list
(** parse from an input channel *)
 
val parse_file : string -> sexpr list
(** parse from a file *)
 
val parse : (unit -> char option) -> sexpr list
(** parse from a custom function, [None] indicates the end of the flux *)

(** generic type for input *)
type input_src = [
  | `String of string
  | `IC of in_channel
  | `File of string
  ]

val parse_from : input_src -> sexpr list
(** parse from most kind of inputs *)

(** {3 Printing} *)
 
val print_sexpr : sexpr list -> unit
(** a dump function for the type [sexpr] *)
 
val print_sexpr_indent : sexpr list -> unit
(** same than [print_sexpr] but with indentation *)
 
val string_of_sexpr : sexpr list -> string
(** convert an expression of type [sexpr] into a string *)
 
val string_of_sexpr_indent : sexpr list -> string
(** same than [string_of_sexpr] but with indentation *)
