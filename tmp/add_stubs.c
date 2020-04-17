/* File generated from add.idl */

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


#define camlidl_ml2c_add_add__t(v,c,ctx) camlidl_cudd_node_ml2c(v,c)

#define camlidl_c2ml_add_add__t(c,ctx) camlidl_cudd_node_c2ml(c)

value camlidl_add_dthen(
	value _v_no)
{
  add__t no; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

if (cuddIsConstant(no.node))
  caml_invalid_argument ("Add.dthen: constant ADD")
;
_res.man = no.man;
_res.node = cuddT(no.node);

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_delse(
	value _v_no)
{
  add__t no; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

if (cuddIsConstant(no.node))
  caml_invalid_argument ("Add.delse: constant ADD")
;
_res.man = no.man;
_res.node = cuddE(no.node);

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_cofactor(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  bdd__dt no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__dt(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_Cofactor(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_ite(
	value _v_no1,
	value _v_no2,
	value _v_no3)
{
  bdd__dt no1; /*in*/
  add__t no2; /*in*/
  add__t no3; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__dt(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  camlidl_ml2c_add_add__t(_v_no3, &no3, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man || no1.man!=no3.man){ caml_invalid_argument("Dd: ternary function called with nodes belonging to different managers !"); };
Begin_roots3(_v_no1,_v_no2,_v_no3);
_res.man = no1.man;
_res.node = Cuddaux_addIte(no1.man->man,no1.node,no2.node,no3.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_ite_cst(
	value _v_no1,
	value _v_no2,
	value _v_no3)
{
  bdd__dt no1; /*in*/
  add__t no2; /*in*/
  add__t no3; /*in*/
  add__t *_res;
  value _v1;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__dt(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  camlidl_ml2c_add_add__t(_v_no3, &no3, _ctx);
  /* begin user-supplied calling sequence */
  {
     static add__t res;
     DdNode* node;
     if (no1.man!=no2.man || no1.man!=no3.man){ caml_invalid_argument("Dd: ternary function called with nodes belonging to different managers !"); };
     node = Cuddaux_addIteConstant(no1.man->man,no1.node,no2.node,no3.node);
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
    _v1 = camlidl_c2ml_add_add__t(&*_res, _ctx);
    Begin_root(_v1)
      _vres = camlidl_alloc_small(1, 0);
      Field(_vres, 0) = _v1;
    End_roots();
  }
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_eval_cst(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  bdd__dt no2; /*in*/
  add__t *_res;
  value _v1;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__dt(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
  {
     static add__t res;
     DdNode* node;

     if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
     node = Cuddaux_addEvalConst(no1.man->man,no2.node,no1.node);
     if (node==DD_NON_CONSTANT)
       _res = 0;
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
    _v1 = camlidl_c2ml_add_add__t(&*_res, _ctx);
    Begin_root(_v1)
      _vres = camlidl_alloc_small(1, 0);
      Field(_vres, 0) = _v1;
    End_roots();
  }
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_compose(
	value _v_var,
	value _v_no1,
	value _v_no2)
{
  int var; /*in*/
  bdd__dt no1; /*in*/
  add__t no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  var = Int_val(_v_var);
  camlidl_ml2c_bdd_bdd__dt(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cuddaux_addCompose(no1.man->man, no2.node, no1.node, var);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_varmap(
	value _v_no)
{
  add__t no; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

if (no.man->man->map == NULL){
  caml_failwith("Add.varmap: empty table, Man.set_varmap has not been called !");
}
Begin_roots1(_v_no);
_res.man = no.man;
_res.node = Cuddaux_addVarMap(no.man->man,no.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_nbleaves(
	value _v_no)
{
  add__t no; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */
_res = Cudd_CountLeaves(no.node); if (_res==CUDD_OUT_OF_MEM){ caml_failwith ("Add.nbleaves returned CUDD_OUT_OF_MEM"); }
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_guard_of_node(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  add__t no2; /*in*/
  bdd__dt _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cuddaux_addGuardOfNode(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__dt(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_guard_of_nonbackground(
	value _v_no)
{
  add__t no; /*in*/
  bdd__dt _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
{
  DdNode* add = Cudd_ReadBackground(no.man->man);
  cuddRef(add);
  _res.man = no.man;
  _res.node = Cuddaux_addGuardOfNode(no.man->man,no.node,add);
  _res.node = Cudd_Not(_res.node);
  cuddDeref(add);
}
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__dt(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_constrain(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  bdd__dt no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__dt(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cuddaux_addConstrain(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_tdconstrain(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  bdd__dt no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__dt(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cuddaux_addTDConstrain(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_restrict(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  bdd__dt no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__dt(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cuddaux_addRestrict(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_tdrestrict(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  bdd__dt no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__dt(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cuddaux_addTDRestrict(no1.man->man,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_of_bdd(
	value _v_no)
{
  bdd__dt no; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__dt(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man = no.man;
_res.node = Cudd_BddToAdd(no.man->man,no.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_to_bdd(
	value _v_no)
{
  add__t no; /*in*/
  bdd__dt _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man = no.man;
_res.node = Cudd_addBddPattern(no.man->man,no.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_bdd_bdd__dt(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_to_bdd_threshold(
	value _v_val,
	value _v_no)
{
  double val; /*in*/
  add__t no; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  val = Double_val(_v_val);
  camlidl_ml2c_add_add__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man = no.man;
_res.node = Cudd_addBddThreshold(no.man->man,no.node,val);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_to_bdd_strictthreshold(
	value _v_val,
	value _v_no)
{
  double val; /*in*/
  add__t no; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  val = Double_val(_v_val);
  camlidl_ml2c_add_add__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man = no.man;
_res.node = Cudd_addBddStrictThreshold(no.man->man,no.node,val);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_to_bdd_interval(
	value _v_lower,
	value _v_upper,
	value _v_no)
{
  double lower; /*in*/
  double upper; /*in*/
  add__t no; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  lower = Double_val(_v_lower);
  upper = Double_val(_v_upper);
  camlidl_ml2c_add_add__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man = no.man;
_res.node = Cudd_addBddInterval(no.man->man,no.node,lower,upper);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_exist(
	value _v_no1,
	value _v_no2)
{
  bdd__dt no1; /*in*/
  add__t no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__dt(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
{
   DdNode* add1 = Cudd_BddToAdd(no1.man->man,no1.node);
  cuddRef(add1);
  _res.man = no1.man;
  _res.node = Cudd_addExistAbstract(no1.man->man,no2.node,add1);
  cuddRef(_res.node);
  Cudd_RecursiveDeref(no1.man->man,add1);
  cuddDeref(_res.node);
}
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_forall(
	value _v_no1,
	value _v_no2)
{
  bdd__dt no1; /*in*/
  add__t no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_bdd_bdd__dt(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
{
  DdNode* add1 = Cudd_BddToAdd(no1.man->man,no1.node);
  cuddRef(add1);
  _res.man = no1.man;
  _res.node = Cudd_addUnivAbstract(no1.man->man,no2.node,add1);
  cuddRef(_res.node);
  Cudd_RecursiveDeref(no1.man->man,add1);
  cuddDeref(_res.node);
}
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_is_leq(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  add__t no2; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); }; _res = Cudd_addLeq(no1.man->man,no1.node,no2.node);
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_add(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  add__t no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_addApply(no1.man->man,Cudd_addPlus,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_sub(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  add__t no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_addApply(no1.man->man,Cudd_addMinus,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_mul(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  add__t no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_addApply(no1.man->man,Cudd_addTimes,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_div(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  add__t no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_addApply(no1.man->man,Cudd_addDivide,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_min(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  add__t no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_addApply(no1.man->man,Cudd_addMinimum,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_max(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  add__t no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_addApply(no1.man->man,Cudd_addMaximum,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_agreement(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  add__t no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_addApply(no1.man->man,Cudd_addAgreement,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_diff(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  add__t no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_addApply(no1.man->man,Cudd_addDiff,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_threshold(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  add__t no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_addApply(no1.man->man,Cudd_addThreshold,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_setNZ(
	value _v_no1,
	value _v_no2)
{
  add__t no1; /*in*/
  add__t no2; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_add_add__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */
if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
Begin_roots2(_v_no1,_v_no2);
_res.man = no1.man;
_res.node = Cudd_addApply(no1.man->man,Cudd_addSetNZ,no1.node,no2.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_add_log(
	value _v_no)
{
  add__t no; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_no);
_res.man = no.man;
_res.node = Cudd_addMonadicApply(no.man->man,Cudd_addLog,no.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}



value camlidl_add_matrix_multiply(value _v_array, value _v_no1, value _v_no2)
{
  CAMLparam3(_v_array,_v_no1,_v_no2); CAMLlocal1(_v_res);
  int i,size;
  DdNode** array;
  node__t no,no1,no2;

  camlidl_cudd_node_ml2c(_v_no1,&no1);
  camlidl_cudd_node_ml2c(_v_no2,&no2);
  if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
  size = Wosize_val(_v_array);
  array = malloc(size * sizeof(DdNode*));
  for (i=0; i<size; i++){
    value _v_index = Field(_v_array,i);
    int index = Int_val(_v_index);
    array[i] = Cudd_bddIthVar(no1.man->man, index);
  }
  no.man = no1.man;
  no.node = Cudd_addMatrixMultiply(no1.man->man,no1.node,no2.node,array,size);
  _v_res = camlidl_cudd_node_c2ml(&no);
  free(array);
  CAMLreturn(_v_res);
}

value camlidl_add_times_plus(value _v_array, value _v_no1, value _v_no2)
{
  CAMLparam3(_v_array,_v_no1,_v_no2); CAMLlocal1(_v_res);
  int i,size;
  DdNode** array;
  node__t no,no1,no2;

  camlidl_cudd_node_ml2c(_v_no1,&no1);
  camlidl_cudd_node_ml2c(_v_no2,&no2);
  if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
  size = Wosize_val(_v_array);
  array = malloc(size * sizeof(DdNode*));
  for (i=0; i<size; i++){
    value _v_index = Field(_v_array,i);
    int index = Int_val(_v_index);
    array[i] = Cudd_bddIthVar(no1.man->man, index);
  }
  no.man = no1.man;
  no.node = Cudd_addTimesPlus(no1.man->man,no1.node,no2.node,array,size);
  _v_res = camlidl_cudd_node_c2ml(&no);
  free(array);
  CAMLreturn(_v_res);
}

value camlidl_add_triangle(value _v_array, value _v_no1, value _v_no2)
{
  CAMLparam3(_v_array,_v_no1,_v_no2); CAMLlocal1(_v_res);
  int i,size;
  DdNode** array;
  node__t no,no1,no2;

  camlidl_cudd_node_ml2c(_v_no1,&no1);
  camlidl_cudd_node_ml2c(_v_no2,&no2);
  if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
  size = Wosize_val(_v_array);
  array = malloc(size * sizeof(DdNode*));
  for (i=0; i<size; i++){
    value _v_index = Field(_v_array,i);
    int index = Int_val(_v_index);
    array[i] = Cudd_bddIthVar(no1.man->man, index);
  }
  no.man = no1.man;
  no.node = Cudd_addTriangle(no1.man->man,no1.node,no2.node,array,size);
  _v_res = camlidl_cudd_node_c2ml(&no);
  free(array);
  CAMLreturn(_v_res);
}

value camlidl_add_transfer(
	value _v_no,
	value _v_man)
{
  add__t no; /*in*/
  man__dt man; /*in*/
  add__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_add_add__t(_v_no, &no, _ctx);
  camlidl_ml2c_man_man__dt(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots2(_v_no,_v_man);
_res.man = man;
_res.node = Cuddaux_addTransfer(no.man->man,man->man,no.node);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_add_add__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

