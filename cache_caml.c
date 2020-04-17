/* File generated from cache.idl */
/* This file is part of the MLCUDDIDL Library, released under LGPL license.
   Please read the COPYING file packaged in the distribution  */

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
#include "cuddInt.h"
#include "caml/custom.h"
#include "cudd_caml.h"

extern void camlidl_cudd_man_ml2c(value, man__dt *);
#define camlidl_cudd_ml2c_man_man__dt(v,c,ctx) camlidl_cudd_man_ml2c(v,c)

extern value camlidl_cudd_man_c2ml(man__dt *);
#define camlidl_cudd_c2ml_man_man__dt(c,ctx) camlidl_cudd_man_c2ml(c)


extern void camlidl_cudd_man_ml2c(value, man__vt *);
#define camlidl_cudd_ml2c_man_man__vt(v,c,ctx) camlidl_cudd_man_ml2c(v,c)

extern value camlidl_cudd_man_c2ml(man__vt *);
#define camlidl_cudd_c2ml_man_man__vt(c,ctx) camlidl_cudd_man_c2ml(c)


extern void camlidl_cudd_man_ml2c(value, man__t *);
#define camlidl_cudd_ml2c_man_man__t(v,c,ctx) camlidl_cudd_man_ml2c(v,c)

extern value camlidl_cudd_man_c2ml(man__t *);
#define camlidl_cudd_c2ml_man_man__t(c,ctx) camlidl_cudd_man_c2ml(c)


extern int camlidl_cudd_ml2c_man_enum_reorder(value);
extern value camlidl_cudd_c2ml_man_enum_reorder(int);

extern int camlidl_cudd_transl_table_man_enum_reorder[];

extern int camlidl_cudd_ml2c_man_enum_aggregation(value);
extern value camlidl_cudd_c2ml_man_enum_aggregation(int);

extern int camlidl_cudd_transl_table_man_enum_aggregation[];

extern int camlidl_cudd_ml2c_man_enum_lazygroup(value);
extern value camlidl_cudd_c2ml_man_enum_lazygroup(int);

extern int camlidl_cudd_transl_table_man_enum_lazygroup[];

extern int camlidl_cudd_ml2c_man_enum_vartype(value);
extern value camlidl_cudd_c2ml_man_enum_vartype(int);

extern int camlidl_cudd_transl_table_man_enum_vartype[];

extern int camlidl_cudd_ml2c_man_enum_mtr(value);
extern value camlidl_cudd_c2ml_man_enum_mtr(int);

extern int camlidl_cudd_transl_table_man_enum_mtr[];

extern int camlidl_cudd_ml2c_man_enum_error(value);
extern value camlidl_cudd_c2ml_man_enum_error(int);

extern int camlidl_cudd_transl_table_man_enum_error[];

#define camlidl_cudd_ml2c_cache_cache__t(v,c,ctx) camlidl_cudd_cache_ml2c(v,c)

#define camlidl_cudd_c2ml_cache_cache__t(c,ctx) camlidl_cudd_cache_c2ml(c)

value camlidl_cudd_cache__create(
	value _v_arity,
	value _v_size,
	value _v_maxsize)
{
  int arity; /*in*/
  int size; /*in*/
  int maxsize; /*in*/
  cache__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  arity = Int_val(_v_arity);
  size = Int_val(_v_size);
  maxsize = Int_val(_v_maxsize);
  /* begin user-supplied calling sequence */

_res = malloc(sizeof(struct CuddauxCache));
_res->cache = NULL;
_res->arity = arity;
_res->initialsize = size;
_res->maxsize = maxsize;
_res->man = NULL;

  /* end user-supplied calling sequence */
  _vres = camlidl_cudd_c2ml_cache_cache__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_cudd_cache_arity(
	value _v_cache)
{
  cache__t cache; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_cudd_ml2c_cache_cache__t(_v_cache, &cache, _ctx);
  /* begin user-supplied calling sequence */
_res = cache->arity;
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_cudd_cache_clear(
	value _v_cache)
{
  cache__t cache; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_cudd_ml2c_cache_cache__t(_v_cache, &cache, _ctx);
  /* begin user-supplied calling sequence */
cuddauxCacheClear(cache);
  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

