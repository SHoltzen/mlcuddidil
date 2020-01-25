/* File generated from vdd.idl */

#include <stddef.h>
#include <string.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/callback.h>
#ifdef Custom_tag
#include <caml/custom.h>
#include <caml/bigarray.h>
#endif
#include <caml/camlidlruntime.h>


#include "caml/custom.h"
#include "cudd_caml.h"

extern void camlidl_cudd_man_ml2c(value, man__dt *);
#define camlidl_ml2c_man_man__dt(v,c,ctx) camlidl_cudd_man_ml2c(v,c)

extern value camlidl_cudd_man_c2ml(man__dt *);
#define camlidl_c2ml_man_man__dt(c,ctx) camlidl_cudd_man_c2ml(c)


extern void camlidl_cudd_man_ml2c(value, man__vt *);
#define camlidl_ml2c_man_man__vt(v,c,ctx) camlidl_cudd_man_ml2c(v,c)

extern value camlidl_cudd_man_c2ml(man__vt *);
#define camlidl_c2ml_man_man__vt(c,ctx) camlidl_cudd_man_c2ml(c)


extern void camlidl_cudd_man_ml2c(value, man__t *);
#define camlidl_ml2c_man_man__t(v,c,ctx) camlidl_cudd_man_ml2c(v,c)

extern value camlidl_cudd_man_c2ml(man__t *);
#define camlidl_c2ml_man_man__t(c,ctx) camlidl_cudd_man_c2ml(c)


extern int camlidl_ml2c_man_enum_reorder(value);
extern value camlidl_c2ml_man_enum_reorder(int);

extern int camlidl_transl_table_man_enum_reorder[];

extern int camlidl_ml2c_man_enum_aggregation(value);
extern value camlidl_c2ml_man_enum_aggregation(int);

extern int camlidl_transl_table_man_enum_aggregation[];

extern int camlidl_ml2c_man_enum_lazygroup(value);
extern value camlidl_c2ml_man_enum_lazygroup(int);

extern int camlidl_transl_table_man_enum_lazygroup[];

extern int camlidl_ml2c_man_enum_vartype(value);
extern value camlidl_c2ml_man_enum_vartype(int);

extern int camlidl_transl_table_man_enum_vartype[];

extern int camlidl_ml2c_man_enum_mtr(value);
extern value camlidl_c2ml_man_enum_mtr(int);

extern int camlidl_transl_table_man_enum_mtr[];

extern int camlidl_ml2c_man_enum_error(value);
extern value camlidl_c2ml_man_enum_error(int);

extern int camlidl_transl_table_man_enum_error[];

extern void camlidl_cudd_node_ml2c(value, bdd__dt *);
#define camlidl_ml2c_bdd_bdd__dt(v,c,ctx) camlidl_cudd_node_ml2c(v,c)

extern value camlidl_cudd_bdd_c2ml(bdd__dt *);
#define camlidl_c2ml_bdd_bdd__dt(c,ctx) camlidl_cudd_bdd_c2ml(c)


extern void camlidl_cudd_node_ml2c(value, bdd__vt *);
#define camlidl_ml2c_bdd_bdd__vt(v,c,ctx) camlidl_cudd_node_ml2c(v,c)

extern value camlidl_cudd_bdd_c2ml(bdd__vt *);
#define camlidl_c2ml_bdd_bdd__vt(c,ctx) camlidl_cudd_bdd_c2ml(c)


extern void camlidl_cudd_node_ml2c(value, bdd__t *);
#define camlidl_ml2c_bdd_bdd__t(v,c,ctx) camlidl_cudd_node_ml2c(v,c)

extern value camlidl_cudd_bdd_c2ml(bdd__t *);
#define camlidl_c2ml_bdd_bdd__t(c,ctx) camlidl_cudd_bdd_c2ml(c)


#define camlidl_ml2c_vdd_vdd__t(v,c,ctx) camlidl_cudd_node_ml2c(v,c)

#define camlidl_c2ml_vdd_vdd__t(c,ctx) camlidl_cudd_node_c2ml(c)

