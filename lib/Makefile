OCAMLMAKEFILE := ../OCamlMakefile

SOURCES := \
  ptset.ml \
  display_hasse_intf.mli display_hasse_impl.mli display_hasse_impl.ml \
  store_intf.mli store_impl.mli store_impl.ml \
  pomap_intf.mli pomap_impl.mli pomap_impl.ml

RESULT := pomap

LIBINSTALL_FILES := \
  pomap_intf.mli store_intf.mli display_hasse_intf.mli \
  display_hasse_intf.cmi display_hasse_impl.cmi \
  pomap_intf.cmi pomap_impl.cmi \
  store_intf.cmi store_impl.cmi \
  pomap.cma pomap.cmxa pomap.a

all:

install:	libinstall
uninstall:	libuninstall

clean::	clean-doc

-include $(OCAMLMAKEFILE)
