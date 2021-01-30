/* File generated from bdd.idl */

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

#define camlidl_ml2c_bdd_bdd__dt(v,c,ctx) camlidl_cudd_node_ml2c(v,c)

#define camlidl_c2ml_bdd_bdd__dt(c,ctx) camlidl_cudd_bdd_c2ml(c)

#define camlidl_ml2c_bdd_bdd__vt(v,c,ctx) camlidl_cudd_node_ml2c(v,c)

#define camlidl_c2ml_bdd_bdd__vt(c,ctx) camlidl_cudd_bdd_c2ml(c)

#define camlidl_ml2c_bdd_bdd__t(v,c,ctx) camlidl_cudd_node_ml2c(v,c)

#define camlidl_c2ml_bdd_bdd__t(c,ctx) camlidl_cudd_bdd_c2ml(c)

value camlidl_bdd_manager(
	value _v_no)
{
  bdd__t no; /*in*/
  man__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */
Begin_roots1(_v_no); _res=no.man;
  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_man_man__t(&_res, _ctx);
  camlidl_free(_ctx);
  /* begin user-supplied deallocation sequence */
End_roots();
  /* end user-supplied deallocation sequence */
  return _vres;
}

value camlidl_bdd_is_cst(
	value _v_no)
{
  bdd__t no; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */
_res = Cudd_IsConstant(no.node);
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_is_complement(
	value _v_no)
{
  bdd__t no; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */
_res = Cudd_IsComplement(no.node);
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_topvar(
	value _v_no)
{
  bdd__t no; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

if (Cudd_IsConstant(no.node))
  caml_invalid_argument ("Bdd.topvar: constant BDD");
_res = Cudd_NodeReadIndex(no.node);

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_dthen(
	value _v_no)
{
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

if (Cudd_IsConstant(no.node))
  caml_invalid_argument ("Bdd.dthen: constant BDD")
;
_res.man = no.man;
_res.node = Cudd_T(no.node);
if (Cudd_IsComplement(no.node)) _res.node = Cudd_Not(_res.node);

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_delse(
	value _v_no)
{
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

if (Cudd_IsConstant(no.node))
  caml_invalid_argument ("Bdd.delse: constant BDD")
;
_res.man = no.man;
_res.node = Cudd_E(no.node);
if (Cudd_IsComplement(no.node)) _res.node = Cudd_Not(_res.node);

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_cofactor(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_Cofactor(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_support(
	value _v_no)
{
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man = no.man;
_res.node = Cuddaux_Support(no.man->man,no.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_supportsize(
	value _v_no)
{
  bdd__t no; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */
_res = Cuddaux_SupportSize(no.man->man,no.node);
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_is_var_in(
	value _v_var,
	value _v_no)
{
  int var; /*in*/
  bdd__t no; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  var = Int_val(_v_var);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
{
DdNode* v = Cudd_bddIthVar(no.man->man,var);
_res = Cuddaux_IsVarIn(no.man->man, no.node, v);
}
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_support_inter(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddLiteralSetIntersection(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_dtrue(
	value _v_man)
{
  man__t man; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */
_res.man = man; _res.node = DD_ONE(man->man);
  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_dfalse(
	value _v_man)
{
  man__t man; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */
_res.man = man; _res.node = Cudd_Not(DD_ONE(man->man));
  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_ithvar(
	value _v_man,
	value _v_var)
{
  man__t man; /*in*/
  int var; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  var = Int_val(_v_var);
  /* begin user-supplied calling sequence */
Begin_roots1(_v_man); _res.man = man; _res.node = Cudd_bddIthVar(man->man,var); End_roots();
  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_newvar(
	value _v_man)
{
  man__t man; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */
Begin_roots1(_v_man); _res.man = man; _res.node = Cudd_bddNewVar(man->man); End_roots();
  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_newvar_at_level(
	value _v_man,
	value _v_level)
{
  man__t man; /*in*/
  int level; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  level = Int_val(_v_level);
  /* begin user-supplied calling sequence */
Begin_roots1(_v_man); _res.man = man; _res.node = Cudd_bddNewVarAtLevel(man->man,level); End_roots();
  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_is_true(
	value _v_no)
{
  bdd__t no; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */
_res = (no.node == DD_ONE(no.man->man));
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_is_false(
	value _v_no)
{
  bdd__t no; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */
_res = (no.node == Cudd_Not(DD_ONE(no.man->man)));
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_is_equal(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); }; _res = (no1.node==no2.node);
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_is_leq(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); }; _res = Cudd_bddLeq(no1.man->man, no1.node, no2.node);
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_is_inter_empty(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); }; _res = Cudd_bddLeq(no1.man->man, no1.node, Cudd_Not(no2.node));
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_is_equal_when(
	value _v_no1,
	value _v_no2,
	value _v_no3)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t no3; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no3, &no3, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man || no1.man!=no3.man){ caml_invalid_argument("Dd: ternary function called with nodes belonging to different managers !"); }; _res=Cudd_EquivDC(no1.man->man,no1.node,no2.node,Cudd_Not(no3.node));
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_is_leq_when(
	value _v_no1,
	value _v_no2,
	value _v_no3)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t no3; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no3, &no3, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man || no1.man!=no3.man){ caml_invalid_argument("Dd: ternary function called with nodes belonging to different managers !"); }; _res=Cudd_bddLeqUnless(no1.man->man,no1.node,no2.node,Cudd_Not(no3.node));
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_is_ite_cst(
	value _v_no1,
	value _v_no2,
	value _v_no3)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t no3; /*in*/
  int *_res;
  value _v1;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no3, &no3, _ctx);
  /* begin user-supplied calling sequence */
  {
     static int storage;

     DdNode* node;
     if (no1.man!=no2.man || no1.man!=no3.man){ caml_invalid_argument("Dd: ternary function called with nodes belonging to different managers !"); };
     node = Cudd_bddIteConstant(no1.man->man,no1.node,no2.node,no3.node);
     if (node==DD_NON_CONSTANT || Cudd_Regular(node)!=DD_ONE(no1.man->man))
       _res = 0;
     else {
       storage = (node==DD_ONE(no1.man->man));
       _res = &storage;
     }
   }

  /* end user-supplied calling sequence */
  if (_res == NULL) {
    _vres = Val_int(0);
  } else {
    _v1 = Val_int(*_res);
    Begin_root(_v1)
      _vres = camlidl_alloc_small(1, 0);
      Field(_vres, 0) = _v1;
    End_roots();
  }
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_is_var_dependent(
	value _v_var,
	value _v_no)
{
  int var; /*in*/
  bdd__t no; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  var = Int_val(_v_var);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
{
DdNode* v = Cudd_bddIthVar(no.man->man,var);
_res = Cudd_bddVarIsDependent(no.man->man, no.node, v);
}
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_is_var_essential(
	value _v_index,
	value _v_phase,
	value _v_no)
{
  int index; /*in*/
  int phase; /*in*/
  bdd__t no; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  index = Int_val(_v_index);
  phase = Int_val(_v_phase);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */
_res = Cudd_bddIsVarEssential(no.man->man,no.node,index,phase);
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_size(
	value _v_no)
{
  bdd__t no; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */
_res = Cudd_DagSize(no.node);
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_nbpaths(
	value _v_no)
{
  bdd__t no; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */
_res = Cudd_CountPath(no.node);
if (_res==(double)CUDD_OUT_OF_MEM){
  caml_failwith("Bdd.nbpaths returned CUDD_OUT_OF_MEM");
}
  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_nbtruepaths(
	value _v_no)
{
  bdd__t no; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */
_res = Cudd_CountPathsToNonZero(no.node);
if (_res==(double)CUDD_OUT_OF_MEM){
  caml_failwith("Bdd.nbtruepaths returned CUDD_OUT_OF_MEM");
}
  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_nbminterms(
	value _v_nvar,
	value _v_no)
{
  int nvar; /*in*/
  bdd__t no; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvar = Int_val(_v_nvar);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */
_res = Cudd_CountMinterm(no.man->man,no.node,nvar);
if (_res==(double)CUDD_OUT_OF_MEM){
  caml_failwith("Bdd.nbminterms returned CUDD_OUT_OF_MEM");
}
  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_density(
	value _v_nvar,
	value _v_no)
{
  int nvar; /*in*/
  bdd__t no; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvar = Int_val(_v_nvar);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */
_res = Cudd_Density(no.man->man,no.node,nvar);
if (_res==(double)CUDD_OUT_OF_MEM){
  caml_failwith("Bdd.density returned CUDD_OUT_OF_MEM");
}
  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_dnot(
	value _v_no)
{
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man = no.man;
_res.node = Cudd_Not(no.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_dand(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddAnd(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_dor(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddOr(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_xor(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddXor(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_nand(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddNand(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_nor(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddNor(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_nxor(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddXnor(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_ite(
	value _v_no1,
	value _v_no2,
	value _v_no3)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t no3; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no3, &no3, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man || no1.man!=no3.man){ caml_invalid_argument("Dd: ternary function called with nodes belonging to different managers !"); };
Begin_roots3(_v_no1,_v_no2,_v_no3);
_res.man = no1.man;
_res.node = Cudd_bddIte(no1.man->man,no1.node,no2.node,no3.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_ite_cst(
	value _v_no1,
	value _v_no2,
	value _v_no3)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t no3; /*in*/
  bdd__t *_res;
  value _v1;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no3, &no3, _ctx);
  /* begin user-supplied calling sequence */
  {
     static bdd__t res;
     DdNode* node;
     if (no1.man!=no2.man || no1.man!=no3.man){ caml_invalid_argument("Dd: ternary function called with nodes belonging to different managers !"); };
     node = Cudd_bddIteConstant(no1.man->man,no1.node,no2.node,no3.node);
     if (node==DD_NON_CONSTANT)
       _res = NULL;
     else {
       res.man = no1.man;
       res.node = node;
       _res = &res;
     }
   }

  /* end user-supplied calling sequence */
  if (_res == NULL) {
    _vres = Val_int(0);
  } else {
    _v1 = camlidl_c2ml_bdd_bdd__t(&*_res, _ctx);
    Begin_root(_v1)
      _vres = camlidl_alloc_small(1, 0);
      Field(_vres, 0) = _v1;
    End_roots();
  }
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_compose(
	value _v_var,
	value _v_no1,
	value _v_no2)
{
  int var; /*in*/
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  var = Int_val(_v_var);
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddCompose(no1.man->man, no2.node, no1.node, var);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_intersect(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddIntersect(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_varmap(
	value _v_no)
{
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man = no.man;
_res.node = Cudd_bddVarMap(no.man->man,no.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_exist(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddExistAbstract(no1.man->man,no2.node,no1.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_forall(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddUnivAbstract(no1.man->man,no2.node,no1.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_existand(
	value _v_no1,
	value _v_no2,
	value _v_no3)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t no3; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no3, &no3, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man || no1.man!=no3.man){ caml_invalid_argument("Dd: ternary function called with nodes belonging to different managers !"); };
Begin_roots3(_v_no1,_v_no2,_v_no3);
_res.man = no1.man;
_res.node = Cudd_bddAndAbstract(no1.man->man,no2.node,no3.node,no1.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_existxor(
	value _v_no1,
	value _v_no2,
	value _v_no3)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t no3; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no3, &no3, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man || no1.man!=no3.man){ caml_invalid_argument("Dd: ternary function called with nodes belonging to different managers !"); };
Begin_roots3(_v_no1,_v_no2,_v_no3);
_res.man = no1.man;
_res.node = Cudd_bddXorExistAbstract(no1.man->man,no2.node,no3.node,no1.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_booleandiff(
	value _v_no,
	value _v_index)
{
  bdd__t no; /*in*/
  int index; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  index = Int_val(_v_index);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man = no.man;
_res.node = Cudd_bddBooleanDiff(no.man->man,no.node,index);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_cube_union(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddLiteralSetIntersection(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_constrain(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddConstrain(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_tdconstrain(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cuddaux_bddTDConstrain(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_restrict(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cuddaux_bddRestrict(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_tdrestrict(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cuddaux_bddTDRestrict(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_minimize(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddMinimize(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_licompaction(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddLICompaction(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_squeeze(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_bddSqueeze(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_clippingand(
	value _v_no1,
	value _v_no2,
	value _v_maxdepth,
	value _v_direction)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  int maxdepth; /*in*/
  int direction; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  maxdepth = Int_val(_v_maxdepth);
  direction = Int_val(_v_direction);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man=no1.man;
_res.node = Cudd_bddClippingAnd(no1.man->man,no1.node,no2.node,maxdepth,direction);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_clippingexistand(
	value _v_no1,
	value _v_no2,
	value _v_no3,
	value _v_maxdepth,
	value _v_direction)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t no3; /*in*/
  int maxdepth; /*in*/
  int direction; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no3, &no3, _ctx);
  maxdepth = Int_val(_v_maxdepth);
  direction = Int_val(_v_direction);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man || no1.man!=no3.man){ caml_invalid_argument("Dd: ternary function called with nodes belonging to different managers !"); };
Begin_roots3(_v_no1,_v_no2,_v_no3);
_res.man=no1.man;
_res.node = Cudd_bddClippingAndAbstract(no1.man->man,no2.node,no3.node,no1.node,maxdepth,direction);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_underapprox(
	value _v_nvars,
	value _v_threshold,
	value _v_safe,
	value _v_quality,
	value _v_no)
{
  int nvars; /*in*/
  int threshold; /*in*/
  int safe; /*in*/
  double quality; /*in*/
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvars = Int_val(_v_nvars);
  threshold = Int_val(_v_threshold);
  safe = Int_val(_v_safe);
  quality = Double_val(_v_quality);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man=no.man;
_res.node=Cudd_UnderApprox(no.man->man,no.node,nvars,threshold,safe,quality);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_overapprox(
	value _v_nvars,
	value _v_threshold,
	value _v_safe,
	value _v_quality,
	value _v_no)
{
  int nvars; /*in*/
  int threshold; /*in*/
  int safe; /*in*/
  double quality; /*in*/
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvars = Int_val(_v_nvars);
  threshold = Int_val(_v_threshold);
  safe = Int_val(_v_safe);
  quality = Double_val(_v_quality);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man=no.man;
_res.node=Cudd_OverApprox(no.man->man,no.node,nvars,threshold,safe,quality);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_remapunderapprox(
	value _v_nvars,
	value _v_threshold,
	value _v_quality,
	value _v_no)
{
  int nvars; /*in*/
  int threshold; /*in*/
  double quality; /*in*/
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvars = Int_val(_v_nvars);
  threshold = Int_val(_v_threshold);
  quality = Double_val(_v_quality);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man=no.man;
_res.node=Cudd_RemapUnderApprox(no.man->man,no.node,nvars,threshold,quality);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_remapoverapprox(
	value _v_nvars,
	value _v_threshold,
	value _v_quality,
	value _v_no)
{
  int nvars; /*in*/
  int threshold; /*in*/
  double quality; /*in*/
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvars = Int_val(_v_nvars);
  threshold = Int_val(_v_threshold);
  quality = Double_val(_v_quality);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man=no.man;
_res.node=Cudd_RemapOverApprox(no.man->man,no.node,nvars,threshold,quality);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_biasedunderapprox(
	value _v_nvars,
	value _v_threshold,
	value _v_quality1,
	value _v_quality0,
	value _v_no1,
	value _v_no2)
{
  int nvars; /*in*/
  int threshold; /*in*/
  double quality1; /*in*/
  double quality0; /*in*/
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvars = Int_val(_v_nvars);
  threshold = Int_val(_v_threshold);
  quality1 = Double_val(_v_quality1);
  quality0 = Double_val(_v_quality0);
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man=no1.man;
_res.node=Cudd_BiasedUnderApprox(no1.man->man,no1.node,no2.node,nvars,threshold,quality1,quality0);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_biasedunderapprox_bytecode(value * argv, int argn)
{
  return camlidl_bdd_biasedunderapprox(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

value camlidl_bdd_biasedoverapprox(
	value _v_nvars,
	value _v_threshold,
	value _v_quality1,
	value _v_quality0,
	value _v_no1,
	value _v_no2)
{
  int nvars; /*in*/
  int threshold; /*in*/
  double quality1; /*in*/
  double quality0; /*in*/
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvars = Int_val(_v_nvars);
  threshold = Int_val(_v_threshold);
  quality1 = Double_val(_v_quality1);
  quality0 = Double_val(_v_quality0);
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man=no1.man;
_res.node=Cudd_BiasedOverApprox(no1.man->man,no1.node,no2.node,nvars,threshold,quality1,quality0);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_biasedoverapprox_bytecode(value * argv, int argn)
{
  return camlidl_bdd_biasedoverapprox(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

value camlidl_bdd_subsetcompress(
	value _v_nvars,
	value _v_threshold,
	value _v_no)
{
  int nvars; /*in*/
  int threshold; /*in*/
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvars = Int_val(_v_nvars);
  threshold = Int_val(_v_threshold);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man=no.man; _res.node = Cudd_SubsetCompress(no.man->man,no.node,nvars,threshold);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_supersetcompress(
	value _v_nvars,
	value _v_threshold,
	value _v_no)
{
  int nvars; /*in*/
  int threshold; /*in*/
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvars = Int_val(_v_nvars);
  threshold = Int_val(_v_threshold);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man=no.man; _res.node = Cudd_SupersetCompress(no.man->man,no.node,nvars,threshold);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_subsetHB(
	value _v_nvars,
	value _v_threshold,
	value _v_no)
{
  int nvars; /*in*/
  int threshold; /*in*/
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvars = Int_val(_v_nvars);
  threshold = Int_val(_v_threshold);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man=no.man; _res.node = Cudd_SubsetHeavyBranch(no.man->man,no.node,nvars,threshold);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_supersetHB(
	value _v_nvars,
	value _v_threshold,
	value _v_no)
{
  int nvars; /*in*/
  int threshold; /*in*/
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvars = Int_val(_v_nvars);
  threshold = Int_val(_v_threshold);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man=no.man; _res.node = Cudd_SupersetHeavyBranch(no.man->man,no.node,nvars,threshold);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_subsetSP(
	value _v_nvars,
	value _v_threshold,
	value _v_hardlimit,
	value _v_no)
{
  int nvars; /*in*/
  int threshold; /*in*/
  int hardlimit; /*in*/
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvars = Int_val(_v_nvars);
  threshold = Int_val(_v_threshold);
  hardlimit = Int_val(_v_hardlimit);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man=no.man;
_res.node = Cudd_SubsetShortPaths(no.man->man,no.node,nvars,threshold,hardlimit);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_supersetSP(
	value _v_nvars,
	value _v_threshold,
	value _v_hardlimit,
	value _v_no)
{
  int nvars; /*in*/
  int threshold; /*in*/
  int hardlimit; /*in*/
  bdd__t no; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  nvars = Int_val(_v_nvars);
  threshold = Int_val(_v_threshold);
  hardlimit = Int_val(_v_hardlimit);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man=no.man;
_res.node = Cudd_SupersetShortPaths(no.man->man,no.node,nvars,threshold,hardlimit);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}


value camlidl_bdd_approxconjdecomp(value _v_no)
{
  CAMLparam1(_v_no); CAMLlocal4(_v_res,_v_a,_v_b,_v_pair);
  bdd__t no;
  int res;
  DdNode** tab;
  bdd__t a;
  bdd__t b;

  camlidl_cudd_node_ml2c(_v_no,&no);
  res = Cudd_bddApproxConjDecomp(no.man->man,no.node,&tab);
  switch(res){
  case 0:
    caml_failwith("Bdd.approxconjdecomp: decomposition function failed (probably CUDD_OUT_OF_MEM)");
    break;
  case 1:
    _v_res = Val_int(0);
    cuddDeref(tab[0]);
    free(tab);
    break;
  case 2:
    a.man = b.man = no.man;
    a.node = tab[0];
    b.node = tab[1];
    _v_a = camlidl_cudd_bdd_c2ml(&a);
    cuddDeref(a.node);
    _v_b = camlidl_cudd_bdd_c2ml(&b);
    cuddDeref(b.node);
    _v_pair = caml_alloc_tuple(2);
    Field(_v_pair,0) = _v_a;
    Field(_v_pair,1) = _v_b;
    _v_res = caml_alloc_boxed(_v_pair);
    free(tab);
    break;
  }
  CAMLreturn(_v_res);
}

value camlidl_bdd_approxdisjdecomp(value _v_no)
{
  CAMLparam1(_v_no); CAMLlocal4(_v_res,_v_a,_v_b,_v_pair);
  bdd__t no;
  int res;
  DdNode** tab;
  bdd__t a;
  bdd__t b;

  camlidl_cudd_node_ml2c(_v_no,&no);
  res = Cudd_bddApproxDisjDecomp(no.man->man,no.node,&tab);
  switch(res){
  case 0:
    caml_failwith("Bdd.approxdisjdecomp: decomposition function failed (probably CUDD_OUT_OF_MEM)");
    break;
  case 1:
    _v_res = Val_int(0);
    cuddDeref(tab[0]);
    free(tab);
    break;
  case 2:
    a.man = b.man = no.man;
    a.node = tab[0];
    b.node = tab[1];
    _v_a = camlidl_cudd_bdd_c2ml(&a);
    cuddDeref(a.node);
    _v_b = camlidl_cudd_bdd_c2ml(&b);
    cuddDeref(b.node);
    _v_pair = caml_alloc_tuple(2);
    Field(_v_pair,0) = _v_a;
    Field(_v_pair,1) = _v_b;
    _v_res = caml_alloc_boxed(_v_pair);
    free(tab);
    break;
  }
  CAMLreturn(_v_res);
}

value camlidl_bdd_iterconjdecomp(value _v_no)
{
  CAMLparam1(_v_no); CAMLlocal4(_v_res,_v_a,_v_b,_v_pair);
  bdd__t no;
  int res;
  DdNode** tab;
  bdd__t a;
  bdd__t b;

  camlidl_cudd_node_ml2c(_v_no,&no);
  res = Cudd_bddIterConjDecomp(no.man->man,no.node,&tab);
  switch(res){
  case 0:
    caml_failwith("Bdd.iterconjdecomp: decomposition function failed (probably CUDD_OUT_OF_MEM)");
    break;
  case 1:
    _v_res = Val_int(0);
    cuddDeref(tab[0]);
    free(tab);
    break;
  case 2:
    a.man = b.man = no.man;
    a.node = tab[0];
    b.node = tab[1];
    _v_a = camlidl_cudd_bdd_c2ml(&a);
    cuddDeref(a.node);
    _v_b = camlidl_cudd_bdd_c2ml(&b);
    cuddDeref(b.node);
    _v_pair = caml_alloc_tuple(2);
    Field(_v_pair,0) = _v_a;
    Field(_v_pair,1) = _v_b;
    _v_res = caml_alloc_boxed(_v_pair);
    free(tab);
    break;
  }
  CAMLreturn(_v_res);
}

value camlidl_bdd_iterdisjdecomp(value _v_no)
{
  CAMLparam1(_v_no); CAMLlocal4(_v_res,_v_a,_v_b,_v_pair);
  bdd__t no;
  int res;
  DdNode** tab;
  bdd__t a;
  bdd__t b;

  camlidl_cudd_node_ml2c(_v_no,&no);
  res = Cudd_bddIterDisjDecomp(no.man->man,no.node,&tab);
  switch(res){
  case 0:
    caml_failwith("Bdd.iterdisjdecomp: decomposition function failed (probably CUDD_OUT_OF_MEM)");
    break;
  case 1:
    _v_res = Val_int(0);
    cuddDeref(tab[0]);
    free(tab);
    break;
  case 2:
    a.man = b.man = no.man;
    a.node = tab[0];
    b.node = tab[1];
    _v_a = camlidl_cudd_bdd_c2ml(&a);
    cuddDeref(a.node);
    _v_b = camlidl_cudd_bdd_c2ml(&b);
    cuddDeref(b.node);
    _v_pair = caml_alloc_tuple(2);
    Field(_v_pair,0) = _v_a;
    Field(_v_pair,1) = _v_b;
    _v_res = caml_alloc_boxed(_v_pair);
    free(tab);
    break;
  }
  CAMLreturn(_v_res);
}

value camlidl_bdd_genconjdecomp(value _v_no)
{
  CAMLparam1(_v_no); CAMLlocal4(_v_res,_v_a,_v_b,_v_pair);
  bdd__t no;
  int res;
  DdNode** tab;
  bdd__t a;
  bdd__t b;

  camlidl_cudd_node_ml2c(_v_no,&no);
  res = Cudd_bddGenConjDecomp(no.man->man,no.node,&tab);
  switch(res){
  case 0:
    caml_failwith("Bdd.genconjdecomp: decomposition function failed (probably CUDD_OUT_OF_MEM)");
    break;
  case 1:
    _v_res = Val_int(0);
    cuddDeref(tab[0]);
    free(tab);
    break;
  case 2:
    a.man = b.man = no.man;
    a.node = tab[0];
    b.node = tab[1];
    _v_a = camlidl_cudd_bdd_c2ml(&a);
    cuddDeref(a.node);
    _v_b = camlidl_cudd_bdd_c2ml(&b);
    cuddDeref(b.node);
    _v_pair = caml_alloc_tuple(2);
    Field(_v_pair,0) = _v_a;
    Field(_v_pair,1) = _v_b;
    _v_res = caml_alloc_boxed(_v_pair);
    free(tab);
    break;
  }
  CAMLreturn(_v_res);
}

value camlidl_bdd_gendisjdecomp(value _v_no)
{
  CAMLparam1(_v_no); CAMLlocal4(_v_res,_v_a,_v_b,_v_pair);
  bdd__t no;
  int res;
  DdNode** tab;
  bdd__t a;
  bdd__t b;

  camlidl_cudd_node_ml2c(_v_no,&no);
  res = Cudd_bddGenDisjDecomp(no.man->man,no.node,&tab);
  switch(res){
  case 0:
    caml_failwith("Bdd.gendisjdecomp: decomposition function failed (probably CUDD_OUT_OF_MEM)");
    break;
  case 1:
    _v_res = Val_int(0);
    cuddDeref(tab[0]);
    free(tab);
    break;
  case 2:
    a.man = b.man = no.man;
    a.node = tab[0];
    b.node = tab[1];
    _v_a = camlidl_cudd_bdd_c2ml(&a);
    cuddDeref(a.node);
    _v_b = camlidl_cudd_bdd_c2ml(&b);
    cuddDeref(b.node);
    _v_pair = caml_alloc_tuple(2);
    Field(_v_pair,0) = _v_a;
    Field(_v_pair,1) = _v_b;
    _v_res = caml_alloc_boxed(_v_pair);
    free(tab);
    break;
  }
  CAMLreturn(_v_res);
}

value camlidl_bdd_varconjdecomp(value _v_no)
{
  CAMLparam1(_v_no); CAMLlocal4(_v_res,_v_a,_v_b,_v_pair);
  bdd__t no;
  int res;
  DdNode** tab;
  bdd__t a;
  bdd__t b;

  camlidl_cudd_node_ml2c(_v_no,&no);
  res = Cudd_bddVarConjDecomp(no.man->man,no.node,&tab);
  switch(res){
  case 0:
    caml_failwith("Bdd.varconjdecomp: decomposition function failed (probably CUDD_OUT_OF_MEM)");
    break;
  case 1:
    _v_res = Val_int(0);
    cuddDeref(tab[0]);
    free(tab);
    break;
  case 2:
    a.man = b.man = no.man;
    a.node = tab[0];
    b.node = tab[1];
    _v_a = camlidl_cudd_bdd_c2ml(&a);
    cuddDeref(a.node);
    _v_b = camlidl_cudd_bdd_c2ml(&b);
    cuddDeref(b.node);
    _v_pair = caml_alloc_tuple(2);
    Field(_v_pair,0) = _v_a;
    Field(_v_pair,1) = _v_b;
    _v_res = caml_alloc_boxed(_v_pair);
    free(tab);
    break;
  }
  CAMLreturn(_v_res);
}

value camlidl_bdd_vardisjdecomp(value _v_no)
{
  CAMLparam1(_v_no); CAMLlocal4(_v_res,_v_a,_v_b,_v_pair);
  bdd__t no;
  int res;
  DdNode** tab;
  bdd__t a;
  bdd__t b;

  camlidl_cudd_node_ml2c(_v_no,&no);
  res = Cudd_bddVarDisjDecomp(no.man->man,no.node,&tab);
  switch(res){
  case 0:
    caml_failwith("Bdd.vardisjdecomp: decomposition function failed (probably CUDD_OUT_OF_MEM)");
    break;
  case 1:
    _v_res = Val_int(0);
    cuddDeref(tab[0]);
    free(tab);
    break;
  case 2:
    a.man = b.man = no.man;
    a.node = tab[0];
    b.node = tab[1];
    _v_a = camlidl_cudd_bdd_c2ml(&a);
    cuddDeref(a.node);
    _v_b = camlidl_cudd_bdd_c2ml(&b);
    cuddDeref(b.node);
    _v_pair = caml_alloc_tuple(2);
    Field(_v_pair,0) = _v_a;
    Field(_v_pair,1) = _v_b;
    _v_res = caml_alloc_boxed(_v_pair);
    free(tab);
    break;
  }
  CAMLreturn(_v_res);
}
value camlidl_bdd_transfer(
	value _v_no,
	value _v_man)
{
  bdd__t no; /*in*/
  man__t man; /*in*/
  bdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man = man;
_res.node = Cudd_bddTransfer(no.man->man,man->man,no.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_correlation(
	value _v_no1,
	value _v_no2)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); }; _res = Cudd_bddCorrelation(no1.man->man,no1.node,no2.node);
  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_correlationweights(
	value _v_no1,
	value _v_no2,
	value _v_prob)
{
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  double *prob; /*in*/
  int size; /*in*/
  double _res;
  mlsize_t _c1;
  mlsize_t _c2;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  _c1 = Wosize_val(_v_prob) / Double_wosize;
  prob = camlidl_malloc(_c1 * sizeof(double ), _ctx);
  for (_c2 = 0; _c2 < _c1; _c2++) {
    prob[_c2] = Double_field(_v_prob, _c2);
  }
  size = _c1;
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); }; _res = Cudd_bddCorrelationWeights(no1.man->man,no1.node,no2.node,prob);
  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_bdd_wmc(
	value _v_man,
	value _v_no,
	value _v_w)
{
  man__t man; /*in*/
  bdd__t no; /*in*/
  double *w; /*in*/
  double _res;
  mlsize_t _c1;
  mlsize_t _c2;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no, &no, _ctx);
  _c1 = Wosize_val(_v_w) / Double_wosize;
  w = camlidl_malloc(_c1 * sizeof(double ), _ctx);
  for (_c2 = 0; _c2 < _c1; _c2++) {
    w[_c2] = Double_field(_v_w, _c2);
  }
  /* begin user-supplied calling sequence */
_res = Cudd_Wmc(man->man, w, no.node);
  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

