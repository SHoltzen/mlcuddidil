/* File generated from memo.idl */

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


int camlidl_transl_table_memo_enum_7[3] = {
  Global,
  Cache,
  Hash,
};

int camlidl_ml2c_memo_enum_memo_discr(value _v1)
{
  int _c2;
  _c2 = camlidl_transl_table_memo_enum_7[Int_val(_v1)];
  return _c2;
}

value camlidl_c2ml_memo_enum_memo_discr(int _c1)
{
  value _v2;
  switch(_c1) {
  case Global: _v2 = Val_int(0); break;
  case Cache: _v2 = Val_int(1); break;
  case Hash: _v2 = Val_int(2); break;
  default: invalid_argument("enum memo_discr: bad enum memo_discr value");
  }
  return _v2;
}

int camlidl_ml2c_memo_union_memo_union(value _v1, union memo_union * _c2, camlidl_ctx _ctx)
{
  int _c3;
  value _v4;
  value _v5;
  _c3 = -1;
  if (Is_long(_v1)) {
    switch (Int_val(_v1)) {
    case 0: /* Global */
      _c3 = Global;
      break;
    }
  } else {
    switch (Tag_val(_v1)) {
    case 0: /* Cache */
      _c3 = Cache;
      _v4 = Field(_v1, 0);
      camlidl_ml2c_cache_cache__t(_v4, &(*_c2).cache, _ctx);
      break;
    case 1: /* Hash */
      _c3 = Hash;
      _v5 = Field(_v1, 0);
      camlidl_ml2c_hash_hash__t(_v5, &(*_c2).hash, _ctx);
      break;
    }
  }
  return _c3;
}

value camlidl_c2ml_memo_union_memo_union(int _discr1, union memo_union * _c2, camlidl_ctx _ctx)
{
  value _v3;
  value _v4;
  value _v5;
  switch (_discr1) {
  case Global:
    _v3 = Val_int(0);
    break;
  case Cache:
    _v4 = camlidl_c2ml_cache_cache__t(&(*_c2).cache, _ctx);
    Begin_root(_v4)
      _v3 = camlidl_alloc_small(1, 0);
      Field(_v3, 0) = _v4;
    End_roots()
    break;
  case Hash:
    _v5 = camlidl_c2ml_hash_hash__t(&(*_c2).hash, _ctx);
    Begin_root(_v5)
      _v3 = camlidl_alloc_small(1, 1);
      Field(_v3, 0) = _v5;
    End_roots()
    break;
  default:
    invalid_argument("union memo_union: bad discriminant for union memo_union");
  }
  return _v3;
}

void camlidl_ml2c_memo_struct_memo__t(value _v1, struct memo__t * _c2, camlidl_ctx _ctx)
{
  (*_c2).discr = camlidl_ml2c_memo_union_memo_union(_v1, &(*_c2).u, _ctx);
}

value camlidl_c2ml_memo_struct_memo__t(struct memo__t * _c1, camlidl_ctx _ctx)
{
  value _v2;
  _v2 = camlidl_c2ml_memo_union_memo_union((*_c1).discr, &(*_c1).u, _ctx);
  return _v2;
}

