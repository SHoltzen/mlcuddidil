/* File generated from custom.idl */

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


#include "stdio.h"
#include "cuddaux.h"
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

extern void camlidl_cudd_hash_ml2c(value, hash__t *);
#define camlidl_ml2c_hash_hash__t(v,c,ctx) camlidl_cudd_hash_ml2c(v,c)

extern value camlidl_cudd_hash_c2ml(hash__t *);
#define camlidl_c2ml_hash_hash__t(c,ctx) camlidl_cudd_hash_c2ml(c)


extern void camlidl_cudd_cache_ml2c(value, cache__t *);
#define camlidl_ml2c_cache_cache__t(v,c,ctx) camlidl_cudd_cache_ml2c(v,c)

extern value camlidl_cudd_cache_c2ml(cache__t *);
#define camlidl_c2ml_cache_cache__t(c,ctx) camlidl_cudd_cache_c2ml(c)


extern int camlidl_ml2c_memo_enum_memo_discr(value);
extern value camlidl_c2ml_memo_enum_memo_discr(int);

extern int camlidl_transl_table_memo_enum_memo_discr[];

extern int camlidl_ml2c_memo_union_memo_union(value, union memo_union *, camlidl_ctx _ctx);
extern value camlidl_c2ml_memo_union_memo_union(int, union memo_union *, camlidl_ctx _ctx);

extern void camlidl_ml2c_memo_struct_memo__t(value, struct memo__t *, camlidl_ctx _ctx);
extern value camlidl_c2ml_memo_struct_memo__t(struct memo__t *, camlidl_ctx _ctx);

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


extern void camlidl_cudd_node_ml2c(value, vdd__t *);
#define camlidl_ml2c_vdd_vdd__t(v,c,ctx) camlidl_cudd_node_ml2c(v,c)

extern value camlidl_cudd_node_c2ml(vdd__t *);
#define camlidl_c2ml_vdd_vdd__t(c,ctx) camlidl_cudd_node_c2ml(c)


#define camlidl_ml2c_custom_pid(v,c,ctx) camlidl_cudd_pid_ml2c(v,c)

#define camlidl_c2ml_custom_pid(c,ctx) camlidl_cudd_pid_c2ml(c)

#define camlidl_ml2c_custom_mlvalue(v,c,ctx) camlidl_cudd_mlvalue_ml2c(v,c)

#define camlidl_c2ml_custom_mlvalue(c,ctx) camlidl_cudd_mlvalue_c2ml(c)

void camlidl_ml2c_custom_struct_common(value _v1, struct common * _c2, camlidl_ctx _ctx)
{
  value _v3;
  value _v4;
  value _v5;
  _v3 = Field(_v1, 0);
  camlidl_ml2c_custom_pid(_v3, &(*_c2).pid, _ctx);
  _v4 = Field(_v1, 1);
  (*_c2).arity = Int_val(_v4);
  _v5 = Field(_v1, 2);
  camlidl_ml2c_memo_struct_memo__t(_v5, &(*_c2).memo, _ctx);
  (*_c2).man = NULL;
  (*_c2).exn = NULL;
}

value camlidl_c2ml_custom_struct_common(struct common * _c1, camlidl_ctx _ctx)
{
  value _v2;
  value _v3[3];
  _v3[0] = _v3[1] = _v3[2] = 0;
  Begin_roots_block(_v3, 3)
    _v3[0] = camlidl_c2ml_custom_pid(&(*_c1).pid, _ctx);
    _v3[1] = Val_int((*_c1).arity);
    _v3[2] = camlidl_c2ml_memo_struct_memo__t(&(*_c1).memo, _ctx);
    _v2 = camlidl_alloc_small(3, 0);
    Field(_v2, 0) = _v3[0];
    Field(_v2, 1) = _v3[1];
    Field(_v2, 2) = _v3[2];
  End_roots()
  return _v2;
}

void camlidl_ml2c_custom_struct_op1(value _v1, struct op1 * _c2, camlidl_ctx _ctx)
{
  value _v3;
  value _v4;
  _v3 = Field(_v1, 0);
  camlidl_ml2c_custom_struct_common(_v3, &(*_c2).common1, _ctx);
  _v4 = Field(_v1, 1);
  camlidl_ml2c_custom_mlvalue(_v4, &(*_c2).closure1, _ctx);
  (*_c2).funptr1 = NULL;
}

value camlidl_c2ml_custom_struct_op1(struct op1 * _c1, camlidl_ctx _ctx)
{
  value _v2;
  value _v3[2];
  _v3[0] = _v3[1] = 0;
  Begin_roots_block(_v3, 2)
    _v3[0] = camlidl_c2ml_custom_struct_common(&(*_c1).common1, _ctx);
    _v3[1] = camlidl_c2ml_custom_mlvalue(&(*_c1).closure1, _ctx);
    _v2 = camlidl_alloc_small(2, 0);
    Field(_v2, 0) = _v3[0];
    Field(_v2, 1) = _v3[1];
  End_roots()
  return _v2;
}

void camlidl_ml2c_custom_struct_op2(value _v1, struct op2 * _c2, camlidl_ctx _ctx)
{
  value _v3;
  value _v4;
  value _v5;
  value _v6;
  value _v7;
  _v3 = Field(_v1, 0);
  camlidl_ml2c_custom_struct_common(_v3, &(*_c2).common2, _ctx);
  _v4 = Field(_v1, 1);
  camlidl_ml2c_custom_mlvalue(_v4, &(*_c2).closure2, _ctx);
  _v5 = Field(_v1, 2);
  camlidl_ml2c_custom_mlvalue(_v5, &(*_c2).ospecial2, _ctx);
  _v6 = Field(_v1, 3);
  (*_c2).commutative = Int_val(_v6);
  _v7 = Field(_v1, 4);
  (*_c2).idempotent = Int_val(_v7);
  (*_c2).funptr2 = NULL;
}

value camlidl_c2ml_custom_struct_op2(struct op2 * _c1, camlidl_ctx _ctx)
{
  value _v2;
  value _v3[5];
  memset(_v3, 0, 5 * sizeof(value));
  Begin_roots_block(_v3, 5)
    _v3[0] = camlidl_c2ml_custom_struct_common(&(*_c1).common2, _ctx);
    _v3[1] = camlidl_c2ml_custom_mlvalue(&(*_c1).closure2, _ctx);
    _v3[2] = camlidl_c2ml_custom_mlvalue(&(*_c1).ospecial2, _ctx);
    _v3[3] = Val_int((*_c1).commutative);
    _v3[4] = Val_int((*_c1).idempotent);
    _v2 = camlidl_alloc_small(5, 0);
    { mlsize_t _c4;
      for (_c4 = 0; _c4 < 5; _c4++) Field(_v2, _c4) = _v3[_c4];
    }
  End_roots()
  return _v2;
}

void camlidl_ml2c_custom_struct_test2(value _v1, struct test2 * _c2, camlidl_ctx _ctx)
{
  value _v3;
  value _v4;
  value _v5;
  value _v6;
  value _v7;
  _v3 = Field(_v1, 0);
  camlidl_ml2c_custom_struct_common(_v3, &(*_c2).common2t, _ctx);
  _v4 = Field(_v1, 1);
  camlidl_ml2c_custom_mlvalue(_v4, &(*_c2).closure2t, _ctx);
  _v5 = Field(_v1, 2);
  camlidl_ml2c_custom_mlvalue(_v5, &(*_c2).ospecial2t, _ctx);
  _v6 = Field(_v1, 3);
  (*_c2).symetric = Int_val(_v6);
  _v7 = Field(_v1, 4);
  (*_c2).reflexive = Int_val(_v7);
  (*_c2).funptr2t = NULL;
}

value camlidl_c2ml_custom_struct_test2(struct test2 * _c1, camlidl_ctx _ctx)
{
  value _v2;
  value _v3[5];
  memset(_v3, 0, 5 * sizeof(value));
  Begin_roots_block(_v3, 5)
    _v3[0] = camlidl_c2ml_custom_struct_common(&(*_c1).common2t, _ctx);
    _v3[1] = camlidl_c2ml_custom_mlvalue(&(*_c1).closure2t, _ctx);
    _v3[2] = camlidl_c2ml_custom_mlvalue(&(*_c1).ospecial2t, _ctx);
    _v3[3] = Val_int((*_c1).symetric);
    _v3[4] = Val_int((*_c1).reflexive);
    _v2 = camlidl_alloc_small(5, 0);
    { mlsize_t _c4;
      for (_c4 = 0; _c4 < 5; _c4++) Field(_v2, _c4) = _v3[_c4];
    }
  End_roots()
  return _v2;
}

void camlidl_ml2c_custom_struct_op3(value _v1, struct op3 * _c2, camlidl_ctx _ctx)
{
  value _v3;
  value _v4;
  value _v5;
  _v3 = Field(_v1, 0);
  camlidl_ml2c_custom_struct_common(_v3, &(*_c2).common3, _ctx);
  _v4 = Field(_v1, 1);
  camlidl_ml2c_custom_mlvalue(_v4, &(*_c2).closure3, _ctx);
  _v5 = Field(_v1, 2);
  camlidl_ml2c_custom_mlvalue(_v5, &(*_c2).ospecial3, _ctx);
  (*_c2).funptr3 = NULL;
}

value camlidl_c2ml_custom_struct_op3(struct op3 * _c1, camlidl_ctx _ctx)
{
  value _v2;
  value _v3[3];
  _v3[0] = _v3[1] = _v3[2] = 0;
  Begin_roots_block(_v3, 3)
    _v3[0] = camlidl_c2ml_custom_struct_common(&(*_c1).common3, _ctx);
    _v3[1] = camlidl_c2ml_custom_mlvalue(&(*_c1).closure3, _ctx);
    _v3[2] = camlidl_c2ml_custom_mlvalue(&(*_c1).ospecial3, _ctx);
    _v2 = camlidl_alloc_small(3, 0);
    Field(_v2, 0) = _v3[0];
    Field(_v2, 1) = _v3[1];
    Field(_v2, 2) = _v3[2];
  End_roots()
  return _v2;
}

void camlidl_ml2c_custom_struct_opN(value _v1, struct opN * _c2, camlidl_ctx _ctx)
{
  value _v3;
  value _v4;
  value _v5;
  _v3 = Field(_v1, 0);
  camlidl_ml2c_custom_struct_common(_v3, &(*_c2).commonN, _ctx);
  _v4 = Field(_v1, 1);
  (*_c2).arityNbdd = Int_val(_v4);
  _v5 = Field(_v1, 2);
  camlidl_ml2c_custom_mlvalue(_v5, &(*_c2).closureN, _ctx);
  (*_c2).funptrN = NULL;
}

value camlidl_c2ml_custom_struct_opN(struct opN * _c1, camlidl_ctx _ctx)
{
  value _v2;
  value _v3[3];
  _v3[0] = _v3[1] = _v3[2] = 0;
  Begin_roots_block(_v3, 3)
    _v3[0] = camlidl_c2ml_custom_struct_common(&(*_c1).commonN, _ctx);
    _v3[1] = Val_int((*_c1).arityNbdd);
    _v3[2] = camlidl_c2ml_custom_mlvalue(&(*_c1).closureN, _ctx);
    _v2 = camlidl_alloc_small(3, 0);
    Field(_v2, 0) = _v3[0];
    Field(_v2, 1) = _v3[1];
    Field(_v2, 2) = _v3[2];
  End_roots()
  return _v2;
}

void camlidl_ml2c_custom_struct_opG(value _v1, struct opG * _c2, camlidl_ctx _ctx)
{
  value _v3;
  value _v4;
  value _v5;
  value _v6;
  value _v7;
  _v3 = Field(_v1, 0);
  camlidl_ml2c_custom_struct_common(_v3, &(*_c2).commonG, _ctx);
  _v4 = Field(_v1, 1);
  (*_c2).arityGbdd = Int_val(_v4);
  _v5 = Field(_v1, 2);
  camlidl_ml2c_custom_mlvalue(_v5, &(*_c2).closureG, _ctx);
  (*_c2).funptrG = NULL;
  _v6 = Field(_v1, 3);
  camlidl_ml2c_custom_mlvalue(_v6, &(*_c2).oclosureBeforeRec, _ctx);
  (*_c2).funptrBeforeRec = NULL;
  _v7 = Field(_v1, 4);
  camlidl_ml2c_custom_mlvalue(_v7, &(*_c2).oclosureIte, _ctx);
  (*_c2).funptrIte = NULL;
}

value camlidl_c2ml_custom_struct_opG(struct opG * _c1, camlidl_ctx _ctx)
{
  value _v2;
  value _v3[5];
  memset(_v3, 0, 5 * sizeof(value));
  Begin_roots_block(_v3, 5)
    _v3[0] = camlidl_c2ml_custom_struct_common(&(*_c1).commonG, _ctx);
    _v3[1] = Val_int((*_c1).arityGbdd);
    _v3[2] = camlidl_c2ml_custom_mlvalue(&(*_c1).closureG, _ctx);
    _v3[3] = camlidl_c2ml_custom_mlvalue(&(*_c1).oclosureBeforeRec, _ctx);
    _v3[4] = camlidl_c2ml_custom_mlvalue(&(*_c1).oclosureIte, _ctx);
    _v2 = camlidl_alloc_small(5, 0);
    { mlsize_t _c4;
      for (_c4 = 0; _c4 < 5; _c4++) Field(_v2, _c4) = _v3[_c4];
    }
  End_roots()
  return _v2;
}

void camlidl_ml2c_custom_struct_exist(value _v1, struct exist * _c2, camlidl_ctx _ctx)
{
  value _v3;
  value _v4;
  _v3 = Field(_v1, 0);
  camlidl_ml2c_custom_struct_common(_v3, &(*_c2).commonexist, _ctx);
  _v4 = Field(_v1, 1);
  camlidl_ml2c_custom_struct_op2(_v4, &(*_c2).combineexist, _ctx);
}

value camlidl_c2ml_custom_struct_exist(struct exist * _c1, camlidl_ctx _ctx)
{
  value _v2;
  value _v3[2];
  _v3[0] = _v3[1] = 0;
  Begin_roots_block(_v3, 2)
    _v3[0] = camlidl_c2ml_custom_struct_common(&(*_c1).commonexist, _ctx);
    _v3[1] = camlidl_c2ml_custom_struct_op2(&(*_c1).combineexist, _ctx);
    _v2 = camlidl_alloc_small(2, 0);
    Field(_v2, 0) = _v3[0];
    Field(_v2, 1) = _v3[1];
  End_roots()
  return _v2;
}

void camlidl_ml2c_custom_struct_existand(value _v1, struct existand * _c2, camlidl_ctx _ctx)
{
  value _v3;
  value _v4;
  value _v5;
  _v3 = Field(_v1, 0);
  camlidl_ml2c_custom_struct_common(_v3, &(*_c2).commonexistand, _ctx);
  _v4 = Field(_v1, 1);
  camlidl_ml2c_custom_struct_op2(_v4, &(*_c2).combineexistand, _ctx);
  _v5 = Field(_v1, 2);
  camlidl_ml2c_custom_mlvalue(_v5, &(*_c2).bottomexistand, _ctx);
}

value camlidl_c2ml_custom_struct_existand(struct existand * _c1, camlidl_ctx _ctx)
{
  value _v2;
  value _v3[3];
  _v3[0] = _v3[1] = _v3[2] = 0;
  Begin_roots_block(_v3, 3)
    _v3[0] = camlidl_c2ml_custom_struct_common(&(*_c1).commonexistand, _ctx);
    _v3[1] = camlidl_c2ml_custom_struct_op2(&(*_c1).combineexistand, _ctx);
    _v3[2] = camlidl_c2ml_custom_mlvalue(&(*_c1).bottomexistand, _ctx);
    _v2 = camlidl_alloc_small(3, 0);
    Field(_v2, 0) = _v3[0];
    Field(_v2, 1) = _v3[1];
    Field(_v2, 2) = _v3[2];
  End_roots()
  return _v2;
}

void camlidl_ml2c_custom_struct_existop1(value _v1, struct existop1 * _c2, camlidl_ctx _ctx)
{
  value _v3;
  value _v4;
  value _v5;
  _v3 = Field(_v1, 0);
  camlidl_ml2c_custom_struct_common(_v3, &(*_c2).commonexistop1, _ctx);
  _v4 = Field(_v1, 1);
  camlidl_ml2c_custom_struct_op2(_v4, &(*_c2).combineexistop1, _ctx);
  _v5 = Field(_v1, 2);
  camlidl_ml2c_custom_struct_op1(_v5, &(*_c2).existop1, _ctx);
}

value camlidl_c2ml_custom_struct_existop1(struct existop1 * _c1, camlidl_ctx _ctx)
{
  value _v2;
  value _v3[3];
  _v3[0] = _v3[1] = _v3[2] = 0;
  Begin_roots_block(_v3, 3)
    _v3[0] = camlidl_c2ml_custom_struct_common(&(*_c1).commonexistop1, _ctx);
    _v3[1] = camlidl_c2ml_custom_struct_op2(&(*_c1).combineexistop1, _ctx);
    _v3[2] = camlidl_c2ml_custom_struct_op1(&(*_c1).existop1, _ctx);
    _v2 = camlidl_alloc_small(3, 0);
    Field(_v2, 0) = _v3[0];
    Field(_v2, 1) = _v3[1];
    Field(_v2, 2) = _v3[2];
  End_roots()
  return _v2;
}

void camlidl_ml2c_custom_struct_existandop1(value _v1, struct existandop1 * _c2, camlidl_ctx _ctx)
{
  value _v3;
  value _v4;
  value _v5;
  value _v6;
  _v3 = Field(_v1, 0);
  camlidl_ml2c_custom_struct_common(_v3, &(*_c2).commonexistandop1, _ctx);
  _v4 = Field(_v1, 1);
  camlidl_ml2c_custom_struct_op2(_v4, &(*_c2).combineexistandop1, _ctx);
  _v5 = Field(_v1, 2);
  camlidl_ml2c_custom_struct_op1(_v5, &(*_c2).existandop1, _ctx);
  _v6 = Field(_v1, 3);
  camlidl_ml2c_custom_mlvalue(_v6, &(*_c2).bottomexistandop1, _ctx);
}

value camlidl_c2ml_custom_struct_existandop1(struct existandop1 * _c1, camlidl_ctx _ctx)
{
  value _v2;
  value _v3[4];
  _v3[0] = _v3[1] = _v3[2] = _v3[3] = 0;
  Begin_roots_block(_v3, 4)
    _v3[0] = camlidl_c2ml_custom_struct_common(&(*_c1).commonexistandop1, _ctx);
    _v3[1] = camlidl_c2ml_custom_struct_op2(&(*_c1).combineexistandop1, _ctx);
    _v3[2] = camlidl_c2ml_custom_struct_op1(&(*_c1).existandop1, _ctx);
    _v3[3] = camlidl_c2ml_custom_mlvalue(&(*_c1).bottomexistandop1, _ctx);
    _v2 = camlidl_alloc_small(4, 0);
    Field(_v2, 0) = _v3[0];
    Field(_v2, 1) = _v3[1];
    Field(_v2, 2) = _v3[2];
    Field(_v2, 3) = _v3[3];
  End_roots()
  return _v2;
}

value camlidl_custom_newpid(value _unit)
{
  pid _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  /* begin user-supplied calling sequence */
_res = malloc(1);
  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_custom_pid(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_custom_apply_op1(
	value _v_op,
	value _v_no)
{
  struct op1 op; /*in*/
  vdd__t no; /*in*/
  vdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_custom_struct_op1(_v_op, &op, _ctx);
  camlidl_ml2c_vdd_vdd__t(_v_no, &no, _ctx);
  /* begin user-supplied calling sequence */

op.common1.man = no.man;
op.common1.exn = Val_unit;
op.funptr1 = &camlidl_cudd_custom_op1;
Begin_roots4(_v_op,_v_no,op.common1.exn,op.closure1);
   _res.man = no.man;
   _res.node = Cuddaux_addApply1(&op,no.node);
End_roots();
if (op.common1.exn!=Val_unit){
  Cudd_ClearErrorCode(_res.man->man);
  caml_raise(op.common1.exn);
}

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_vdd_vdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_custom_apply_op2(
	value _v_op,
	value _v_no1,
	value _v_no2)
{
  struct op2 op; /*in*/
  vdd__t no1; /*in*/
  vdd__t no2; /*in*/
  vdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_custom_struct_op2(_v_op, &op, _ctx);
  camlidl_ml2c_vdd_vdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_vdd_vdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
op.common2.man = no1.man;
op.common2.exn = Val_unit;
op.funptr2 = &camlidl_cudd_custom_op2;
Begin_roots3(_v_op,_v_no1,_v_no2);
Begin_roots3(op.common2.exn,op.closure2,op.ospecial2);
   _res.man = no1.man;
   _res.node = Cuddaux_addApply2(&op,no1.node,no2.node);
End_roots();
End_roots();
if (op.common2.exn!=Val_unit){
  Cudd_ClearErrorCode(_res.man->man);
  caml_raise(op.common2.exn);
}

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_vdd_vdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_custom_apply_test2(
	value _v_op,
	value _v_no1,
	value _v_no2)
{
  struct test2 op; /*in*/
  vdd__t no1; /*in*/
  vdd__t no2; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_custom_struct_test2(_v_op, &op, _ctx);
  camlidl_ml2c_vdd_vdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_vdd_vdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
op.common2t.man = no1.man;
op.common2t.exn = Val_unit;
op.funptr2t = &camlidl_cudd_custom_test2;
Begin_roots3(_v_op,_v_no1,_v_no2);
Begin_roots3(op.common2t.exn,op.closure2t,op.ospecial2t);
_res = Cuddaux_addTest2(&op,no1.node,no2.node);
End_roots();
End_roots();
if (op.common2t.exn!=Val_unit){
  Cudd_ClearErrorCode(no1.man->man);
  caml_raise(op.common2t.exn);
}
if (_res == -1){
  caml_failwith("Custom.apply_test2 returned -1");
}

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_custom_apply_op3(
	value _v_op,
	value _v_no1,
	value _v_no2,
	value _v_no3)
{
  struct op3 op; /*in*/
  vdd__t no1; /*in*/
  vdd__t no2; /*in*/
  vdd__t no3; /*in*/
  vdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_custom_struct_op3(_v_op, &op, _ctx);
  camlidl_ml2c_vdd_vdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_vdd_vdd__t(_v_no2, &no2, _ctx);
  camlidl_ml2c_vdd_vdd__t(_v_no3, &no3, _ctx);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man || no1.man!=no3.man){ caml_invalid_argument("Dd: ternary function called with nodes belonging to different managers !"); };
op.common3.man = no1.man;
op.common3.exn = Val_unit;
op.funptr3 = &camlidl_cudd_custom_op3;
Begin_roots4(_v_op,_v_no1,_v_no2,_v_no3);
Begin_roots3(op.common3.exn,op.closure3,op.ospecial3);
_res.man = no1.man;
_res.node = Cuddaux_addApply3(&op,no1.node,no2.node,no3.node);
End_roots();
End_roots();
if (op.common3.exn!=Val_unit){
  Cudd_ClearErrorCode(_res.man->man);
  caml_raise(op.common3.exn);
}

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_vdd_vdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}


value camlidl_cudd_apply_opN(value _v_op, value _v_vec1, value _v_vec2)
{
  struct opN op; /*in*/
  DdNode** vec;
  vdd__t _res;
  int size1,size2,size;
  value _vres;
  man__t man1,man2,man;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_cudd_ml2c_custom_struct_opN(_v_op, &op, _ctx);
  size1 = Wosize_val(_v_vec1);
  size2 = Wosize_val(_v_vec2);
  size=size1+size2;
  if (size!=op.commonN.arity || size1!=op.arityNbdd){
    caml_invalid_argument("Cudd.Custom.apply_opN: the arity of the operation is not equal to the size of the arrays of BDDs and VDDs");
  }
  else if (size==0){
    caml_invalid_argument("Cudd.Custom.apply_opN: empty array");
  }
  vec = (DdNode**)malloc(size*sizeof(DdNode*));
  man = man1 = man2 = NULL;
  if (size1>0){
    man = man1 = camlidl_cudd_tnode_ml2c(_v_vec1,size1,vec);
    if (man1==NULL){
      free(vec);
      caml_invalid_argument("Custom.apply_opN called with BDDs belonging to different managers !");
    }
  }
  if (size2>0){
    man = man2 = camlidl_cudd_tnode_ml2c(_v_vec2,size2,vec+size1);
    if (man2==NULL){
      free(vec);
      caml_invalid_argument("Custom.apply_opN called with VDDs belonging to different managers !");
    }
  }
  if (size1>0 && size2>0 && man1!=man2){
    free(vec);
    caml_invalid_argument("Custom.apply_opN called with BDDs/VDDs belonging to different managers !");
  }
  op.commonN.man = man;
  op.commonN.exn = Val_unit;
  op.funptrN = &camlidl_cudd_custom_opNG;
  Begin_roots5(_v_op,_v_vec1,_v_vec2,op.commonN.exn,op.closureN);
    _res.man = man;
    _res.node = Cuddaux_addApplyN(&op,vec);
  End_roots();
  free(vec);
  if (op.commonN.exn!=Val_unit){
    Cudd_ClearErrorCode(_res.man->man);
    caml_raise(op.commonN.exn);
  }
  _vres = camlidl_cudd_c2ml_vdd_vdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_cudd_apply_opG(value _v_op, value _v_vec1, value _v_vec2)
{
  struct opG op; /*in*/
  DdNode** vec;
  vdd__t _res;
  int size1,size2,size;
  value _vres;
  man__t man1,man2,man;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_cudd_ml2c_custom_struct_opG(_v_op, &op, _ctx);
  size1 = Wosize_val(_v_vec1);
  size2 = Wosize_val(_v_vec2);
  size=size1+size2;
  if (size!=op.commonG.arity || size1!=op.arityGbdd){
    caml_invalid_argument("Cudd.Custom.apply_opG: the arity of the operation is not equal to the size of the arrays of BDDs and VDDs");
  }
  else if (size==0){
    caml_invalid_argument("Cudd.Custom.apply_opG: empty array");
  }
  vec = (DdNode**)malloc(size*sizeof(DdNode*));
  man = man1 = man2 = NULL;
  if (size1>0){
    man = man1 = camlidl_cudd_tnode_ml2c(_v_vec1,size1,vec);
    if (man1==NULL){
      free(vec);
      caml_invalid_argument("Custom.apply_opG called with BDDs belonging to different managers !");
    }
  }
  if (size2>0){
    man = man2 = camlidl_cudd_tnode_ml2c(_v_vec2,size2,vec+size1);
    if (man2==NULL){
      free(vec);
      caml_invalid_argument("Custom.apply_opG called with VDDs belonging to different managers !");
    }
  }
  if (size1>0 && size2>0 && man1!=man2){
    free(vec);
    caml_invalid_argument("Custom.apply_opG called with BDDs/VDDs belonging to different managers !");
  }
  op.commonG.man = man;
  op.commonG.exn = Val_unit;
  op.funptrG = (DdNode* (*)(DdManager*, struct opG*, DdNode**))(&camlidl_cudd_custom_opNG);
  op.funptrBeforeRec = (void*)
   (Is_block(op.oclosureBeforeRec) ?
    &camlidl_cudd_custom_opGbeforeRec :
    NULL);
  op.funptrIte =
    Is_block(op.oclosureIte) ?
    &camlidl_cudd_custom_opGite :
    NULL;
  Begin_roots4(_v_op,_v_vec1,_v_vec2,op.commonG.exn);
  Begin_roots3(op.closureG,op.oclosureBeforeRec,op.oclosureIte);
    _res.man = man;
    _res.node = Cuddaux_addApplyG(&op,vec);
  End_roots();
  End_roots();
  free(vec);
  if (op.commonG.exn!=Val_unit){
    Cudd_ClearErrorCode(_res.man->man);
    caml_raise(op.commonG.exn);
  }
  _vres = camlidl_cudd_c2ml_vdd_vdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_custom__apply_exist(
	value _v_op,
	value _v_no1,
	value _v_no2)
{
  struct exist op; /*in*/
  bdd__t no1; /*in*/
  vdd__t no2; /*in*/
  vdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_custom_struct_exist(_v_op, &op, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_vdd_vdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
op.commonexist.man = no1.man;
op.commonexist.exn = Val_unit;
op.combineexist.common2.man = no1.man;
op.combineexist.common2.exn = Val_unit;
op.combineexist.funptr2 = &camlidl_cudd_custom_op2;
Begin_roots3(_v_op,_v_no1,_v_no2);
Begin_roots3(op.combineexist.common2.exn,op.combineexist.closure2,op.combineexist.ospecial2);
_res.man = no1.man;
_res.node = Cuddaux_addAbstract(&op,no2.node,no1.node);
End_roots();
End_roots();
if (op.combineexist.common2.exn!=Val_unit){
  Cudd_ClearErrorCode(_res.man->man);
  caml_raise(op.combineexist.common2.exn);
}

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_vdd_vdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_custom__apply_existand(
	value _v_op,
	value _v_no1,
	value _v_no2,
	value _v_no3)
{
  struct existand op; /*in*/
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  vdd__t no3; /*in*/
  vdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_custom_struct_existand(_v_op, &op, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  camlidl_ml2c_vdd_vdd__t(_v_no3, &no3, _ctx);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man || no1.man!=no3.man){ caml_invalid_argument("Dd: ternary function called with nodes belonging to different managers !"); };
op.commonexistand.man = no1.man;
op.commonexistand.exn = Val_unit;
op.combineexistand.common2.man = no1.man;
op.combineexistand.common2.exn = Val_unit;
op.combineexistand.funptr2 = &camlidl_cudd_custom_op2;
Begin_roots4(_v_op,_v_no1,_v_no2,_v_no3);
Begin_roots3(op.combineexistand.common2.exn,op.combineexistand.closure2,op.combineexistand.ospecial2);
  _res.man = no1.man;
  _res.node = NULL;
  DdNode* background =
    no1.man->caml ?
    Cuddaux_addCamlConst(no1.man->man,op.bottomexistand) :
    cuddUniqueConst(no1.man->man,Double_val(op.bottomexistand));
  ;
  if (background){
    cuddRef(background);
    _res.node = Cuddaux_addBddAndAbstract(&op,no2.node,no3.node,no1.node,background);
    if (_res.node) cuddRef(_res.node);
    Cudd_RecursiveDeref(no1.man->man,background);
    if (_res.node) cuddDeref(_res.node);
  }
End_roots();
End_roots();
if (op.combineexistand.common2.exn!=Val_unit){
  Cudd_ClearErrorCode(_res.man->man);
  caml_raise(op.combineexistand.common2.exn);
}

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_vdd_vdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_custom__apply_existop1(
	value _v_op,
	value _v_no1,
	value _v_no2)
{
  struct existop1 op; /*in*/
  bdd__t no1; /*in*/
  vdd__t no2; /*in*/
  vdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_custom_struct_existop1(_v_op, &op, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_vdd_vdd__t(_v_no2, &no2, _ctx);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man){ caml_invalid_argument("Dd: binary function called with nodes belonging to different managers !"); };
op.commonexistop1.man = no1.man;
op.commonexistop1.exn = Val_unit;
op.combineexistop1.common2.man = no1.man;
op.combineexistop1.common2.exn = Val_unit;
op.combineexistop1.funptr2 = &camlidl_cudd_custom_op2;
op.existop1.common1.man = no1.man;
op.existop1.common1.exn = Val_unit;
op.existop1.funptr1 = &camlidl_cudd_custom_op1;
Begin_roots3(_v_op,_v_no1,_v_no2);
Begin_roots5(op.combineexistop1.common2.exn,
	     op.existop1.common1.exn,
	     op.combineexistop1.closure2,op.combineexistop1.ospecial2,
	     op.existop1.closure1);
_res.man = no1.man;
_res.node = Cuddaux_addApplyAbstract(&op,no2.node,no1.node);
End_roots();
End_roots();
if (op.existop1.common1.exn!=Val_unit){
  Cudd_ClearErrorCode(_res.man->man);
  caml_raise(op.existop1.common1.exn);
}
else if (op.combineexistop1.common2.exn!=Val_unit){
  Cudd_ClearErrorCode(_res.man->man);
  caml_raise(op.combineexistop1.common2.exn);
}

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_vdd_vdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_custom__apply_existandop1(
	value _v_op,
	value _v_no1,
	value _v_no2,
	value _v_no3)
{
  struct existandop1 op; /*in*/
  bdd__t no1; /*in*/
  bdd__t no2; /*in*/
  vdd__t no3; /*in*/
  vdd__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_custom_struct_existandop1(_v_op, &op, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no1, &no1, _ctx);
  camlidl_ml2c_bdd_bdd__t(_v_no2, &no2, _ctx);
  camlidl_ml2c_vdd_vdd__t(_v_no3, &no3, _ctx);
  /* begin user-supplied calling sequence */

if (no1.man!=no2.man || no1.man!=no3.man){ caml_invalid_argument("Dd: ternary function called with nodes belonging to different managers !"); };
op.commonexistandop1.man = no1.man;
op.commonexistandop1.exn = Val_unit;
op.combineexistandop1.common2.man = no1.man;
op.combineexistandop1.common2.exn = Val_unit;
op.combineexistandop1.funptr2 = &camlidl_cudd_custom_op2;
op.existandop1.common1.man = no1.man;
op.existandop1.common1.exn = Val_unit;
op.existandop1.funptr1 = &camlidl_cudd_custom_op1;
Begin_roots4(_v_op,_v_no1,_v_no2,_v_no3);
Begin_roots5(op.combineexistandop1.common2.exn,
	     op.existandop1.common1.exn,
	     op.combineexistandop1.closure2,op.combineexistandop1.ospecial2,
	     op.existandop1.closure1);
_res.man = no1.man;
  DdNode* background =
    no1.man->caml ?
    Cuddaux_addCamlConst(no1.man->man,op.bottomexistandop1) :
    cuddUniqueConst(no1.man->man,Double_val(op.bottomexistandop1));
  ;
  if (background){
    cuddRef(background);
    _res.node = Cuddaux_addApplyBddAndAbstract(&op,no2.node,no3.node,no1.node,NULL);
    if (_res.node) cuddRef(_res.node);
    Cudd_RecursiveDeref(no1.man->man,background);
    if (_res.node) cuddDeref(_res.node);
  }
End_roots();
End_roots();
if (op.existandop1.common1.exn!=Val_unit){
  Cudd_ClearErrorCode(_res.man->man);
  caml_raise(op.existandop1.common1.exn);
}
else if (op.combineexistandop1.common2.exn!=Val_unit){
  Cudd_ClearErrorCode(_res.man->man);
  caml_raise(op.combineexistandop1.common2.exn);
}

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_vdd_vdd__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

