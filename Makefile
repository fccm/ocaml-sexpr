all: cma cmxa
byte cma: SExpr.cma
opt cmxa: SExpr.cmxa
cmxs: SExpr.cmxs

SExpr.cmi: SExpr.mli
	ocamlc -c $<

SExpr.cmo: SExpr.ml SExpr.cmi
	ocamlc -c $<

SExpr.cmx: SExpr.ml SExpr.cmi
	ocamlopt -c $<

SExpr.cma: SExpr.cmo
	ocamlc -a -o $@ $<

SExpr.cmxa: SExpr.cmx
	ocamlopt -a -o $@ $<

SExpr.cmxs: SExpr.ml
	ocamlopt -shared $< -o $@

.PHONY: doc
doc:
	mkdir -p doc
	ocamldoc -html -d doc SExpr.mli

.PHONY: findinstall
findinstall:
	ocamlfind install sexpr META *.cm[ia] *.cmx[as] *.mli *.a

clean:
	rm -f *.[oa] *.cm[ioxa] *.cmxa

.PHONY: all opt byte cma cmxa cmxs clean
