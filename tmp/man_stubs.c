/* File generated from man.idl */

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
#include "stdio.h"

#define camlidl_ml2c_man_man__dt(v,c,ctx) camlidl_cudd_man_ml2c(v,c)

#define camlidl_c2ml_man_man__dt(c,ctx) camlidl_cudd_man_c2ml(c)

#define camlidl_ml2c_man_man__vt(v,c,ctx) camlidl_cudd_man_ml2c(v,c)

#define camlidl_c2ml_man_man__vt(c,ctx) camlidl_cudd_man_c2ml(c)

#define camlidl_ml2c_man_man__t(v,c,ctx) camlidl_cudd_man_ml2c(v,c)

#define camlidl_c2ml_man_man__t(c,ctx) camlidl_cudd_man_c2ml(c)

int camlidl_transl_table_man_enum_1[22] = {
  CUDD_REORDER_SAME,
  CUDD_REORDER_NONE,
  CUDD_REORDER_RANDOM,
  CUDD_REORDER_RANDOM_PIVOT,
  CUDD_REORDER_SIFT,
  CUDD_REORDER_SIFT_CONVERGE,
  CUDD_REORDER_SYMM_SIFT,
  CUDD_REORDER_SYMM_SIFT_CONV,
  CUDD_REORDER_WINDOW2,
  CUDD_REORDER_WINDOW3,
  CUDD_REORDER_WINDOW4,
  CUDD_REORDER_WINDOW2_CONV,
  CUDD_REORDER_WINDOW3_CONV,
  CUDD_REORDER_WINDOW4_CONV,
  CUDD_REORDER_GROUP_SIFT,
  CUDD_REORDER_GROUP_SIFT_CONV,
  CUDD_REORDER_ANNEALING,
  CUDD_REORDER_GENETIC,
  CUDD_REORDER_LINEAR,
  CUDD_REORDER_LINEAR_CONVERGE,
  CUDD_REORDER_LAZY_SIFT,
  CUDD_REORDER_EXACT,
};

int camlidl_ml2c_man_enum_reorder(value _v1)
{
  int _c2;
  _c2 = camlidl_transl_table_man_enum_1[Int_val(_v1)];
  return _c2;
}

value camlidl_c2ml_man_enum_reorder(int _c1)
{
  value _v2;
  _v2 = camlidl_find_enum(_c1, camlidl_transl_table_man_enum_1, 22, "enum reorder: bad enum reorder value");
  return _v2;
}

int camlidl_transl_table_man_enum_2[10] = {
  CUDD_NO_CHECK,
  CUDD_GROUP_CHECK,
  CUDD_GROUP_CHECK2,
  CUDD_GROUP_CHECK3,
  CUDD_GROUP_CHECK4,
  CUDD_GROUP_CHECK5,
  CUDD_GROUP_CHECK6,
  CUDD_GROUP_CHECK7,
  CUDD_GROUP_CHECK8,
  CUDD_GROUP_CHECK9,
};

int camlidl_ml2c_man_enum_aggregation(value _v1)
{
  int _c2;
  _c2 = camlidl_transl_table_man_enum_2[Int_val(_v1)];
  return _c2;
}

value camlidl_c2ml_man_enum_aggregation(int _c1)
{
  value _v2;
  _v2 = camlidl_find_enum(_c1, camlidl_transl_table_man_enum_2, 10, "enum aggregation: bad enum aggregation value");
  return _v2;
}

int camlidl_transl_table_man_enum_3[4] = {
  CUDD_LAZY_NONE,
  CUDD_LAZY_SOFT_GROUP,
  CUDD_LAZY_HARD_GROUP,
  CUDD_LAZY_UNGROUP,
};

int camlidl_ml2c_man_enum_lazygroup(value _v1)
{
  int _c2;
  _c2 = camlidl_transl_table_man_enum_3[Int_val(_v1)];
  return _c2;
}

value camlidl_c2ml_man_enum_lazygroup(int _c1)
{
  value _v2;
  switch(_c1) {
  case CUDD_LAZY_NONE: _v2 = Val_int(0); break;
  case CUDD_LAZY_SOFT_GROUP: _v2 = Val_int(1); break;
  case CUDD_LAZY_HARD_GROUP: _v2 = Val_int(2); break;
  case CUDD_LAZY_UNGROUP: _v2 = Val_int(3); break;
  default: invalid_argument("enum lazygroup: bad enum lazygroup value");
  }
  return _v2;
}

int camlidl_transl_table_man_enum_4[3] = {
  CUDD_VAR_PRIMARY_INPUT,
  CUDD_VAR_PRESENT_STATE,
  CUDD_VAR_NEXT_STATE,
};

int camlidl_ml2c_man_enum_vartype(value _v1)
{
  int _c2;
  _c2 = camlidl_transl_table_man_enum_4[Int_val(_v1)];
  return _c2;
}

value camlidl_c2ml_man_enum_vartype(int _c1)
{
  value _v2;
  switch(_c1) {
  case CUDD_VAR_PRIMARY_INPUT: _v2 = Val_int(0); break;
  case CUDD_VAR_PRESENT_STATE: _v2 = Val_int(1); break;
  case CUDD_VAR_NEXT_STATE: _v2 = Val_int(2); break;
  default: invalid_argument("enum vartype: bad enum vartype value");
  }
  return _v2;
}

int camlidl_transl_table_man_enum_5[2] = {
  MTR_DEFAULT,
  MTR_FIXED,
};

int camlidl_ml2c_man_enum_mtr(value _v1)
{
  int _c2;
  _c2 = camlidl_transl_table_man_enum_5[Int_val(_v1)];
  return _c2;
}

value camlidl_c2ml_man_enum_mtr(int _c1)
{
  value _v2;
  switch(_c1) {
  case MTR_DEFAULT: _v2 = Val_int(0); break;
  case MTR_FIXED: _v2 = Val_int(1); break;
  default: invalid_argument("enum mtr: bad enum mtr value");
  }
  return _v2;
}

int camlidl_transl_table_man_enum_6[6] = {
  CUDD_NO_ERROR,
  CUDD_MEMORY_OUT,
  CUDD_TOO_MANY_NODES,
  CUDD_MAX_MEM_EXCEEDED,
  CUDD_INVALID_ARG,
  CUDD_INTERNAL_ERROR,
};

int camlidl_ml2c_man_enum_error(value _v1)
{
  int _c2;
  _c2 = camlidl_transl_table_man_enum_6[Int_val(_v1)];
  return _c2;
}

value camlidl_c2ml_man_enum_error(int _c1)
{
  value _v2;
  _v2 = camlidl_find_enum(_c1, camlidl_transl_table_man_enum_6, 6, "enum error: bad enum error value");
  return _v2;
}

value camlidl_man_srandom(
	value _v_man,
	value _v_seed)
{
  man__t man; /*in*/
  long seed; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  seed = Long_val(_v_seed);
  /* begin user-supplied calling sequence */
Cudd_Srandom(man->man, seed);
  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man__make(
	value _v_caml,
	value _v_numVars,
	value _v_numVarsZ,
	value _v_numSlots,
	value _v_cacheSize,
	value _v_maxMemory)
{
  int caml; /*in*/
  int numVars; /*in*/
  int numVarsZ; /*in*/
  int numSlots; /*in*/
  int cacheSize; /*in*/
  long maxMemory; /*in*/
  man__t _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  caml = Int_val(_v_caml);
  numVars = Int_val(_v_numVars);
  numVarsZ = Int_val(_v_numVarsZ);
  numSlots = Int_val(_v_numSlots);
  cacheSize = Int_val(_v_cacheSize);
  maxMemory = Long_val(_v_maxMemory);
  /* begin user-supplied calling sequence */

{  int res;

   if (numVars<0) numVars = 0;
   if (numVarsZ<0) numVarsZ = 0;
   if (numSlots<=0) numSlots = CUDD_UNIQUE_SLOTS;
   if (cacheSize<=0) cacheSize = CUDD_CACHE_SLOTS;
   if (maxMemory<0) maxMemory = 0;
   _res = (struct CuddauxMan*)malloc(sizeof(struct CuddauxMan));
   _res->man = Cudd_Init(numVars, numVarsZ, numSlots, cacheSize, maxMemory);
   _res->count = 0;
   _res->caml = caml;
   res = Cudd_AddHook(_res->man,camlidl_cudd_garbage,CUDD_PRE_GC_HOOK);
   if (res!=1)
     caml_failwith("Man.make: unable to add the garbage collection hook");
   if (caml){
     res = Cudd_AddHook(_res->man,Cuddaux_addCamlPreGC, CUDD_PRE_GC_HOOK);
     if (res!=1)
       caml_failwith("Man.make_caml: unable to add the caml garbage collection hook Cuddaux_addCamlPreGC");
   }
   res = Cudd_AddHook(_res->man,camlidl_cudd_reordering,CUDD_PRE_REORDERING_HOOK);
   if (res!=1)
     caml_failwith("Man.make: unable to add the reordering hook");
}

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_man_man__t(&_res, _ctx);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man__make_bytecode(value * argv, int argn)
{
  return camlidl_man__make(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

value camlidl_man_debugcheck(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */
_res = Cudd_DebugCheck(man->man);
 fflush(man->man->err);
 if (_res == CUDD_OUT_OF_MEM)
   caml_failwith("Dd.debugcheck returned CUDD_OUT_OF_MEM");

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_check_keys(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */
_res = Cudd_CheckKeys(man->man);
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_level_of_var(
	value _v_man,
	value _v_var)
{
  man__t man; /*in*/
  int var; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  var = Int_val(_v_var);
  /* begin user-supplied calling sequence */
_res = Cudd_ReadPerm(man->man,var);
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_var_of_level(
	value _v_man,
	value _v_level)
{
  man__t man; /*in*/
  int level; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  level = Int_val(_v_level);
  /* begin user-supplied calling sequence */
_res = Cudd_ReadInvPerm(man->man,level);
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_reduce_heap(
	value _v_man,
	value _v_heuristic,
	value _v_minsize)
{
  man__t man; /*in*/
  int heuristic; /*in*/
  int minsize; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  heuristic = camlidl_ml2c_man_enum_reorder(_v_heuristic);
  minsize = Int_val(_v_minsize);
  /* begin user-supplied calling sequence */
{
  int ok = Cudd_ReduceHeap(man->man,heuristic,minsize);
  if (ok==0) caml_failwith("Man.reduce_heap failed");
}
  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_shuffle_heap(
	value _v_man,
	value _v_permut)
{
  man__t man; /*in*/
  int *permut; /*in*/
  mlsize_t _c1;
  mlsize_t _c2;
  value _v3;
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  _c1 = Wosize_val(_v_permut);
  permut = camlidl_malloc(_c1 * sizeof(int ), _ctx);
  for (_c2 = 0; _c2 < _c1; _c2++) {
    _v3 = Field(_v_permut, _c2);
    permut[_c2] = Int_val(_v3);
  }
  /* begin user-supplied calling sequence */
{
  int ok = Cudd_ShuffleHeap(man->man,permut);
  if (ok==0) caml_failwith("Man.shuffle_heap failed");
}
  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_garbage_collect(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_root(_v_man);
cuddauxManRef (man);
_res = cuddGarbageCollect(man->man,1);
cuddauxManFree (man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_cache_flush(
	value _v_man)
{
  man__t man; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */
cuddCacheFlush(man->man);
  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_enable_autodyn(
	value _v_man,
	value _v_heuristic)
{
  man__t man; /*in*/
  int heuristic; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  heuristic = camlidl_ml2c_man_enum_reorder(_v_heuristic);
  /* begin user-supplied calling sequence */
Cudd_AutodynEnable(man->man,heuristic);
  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_disable_autodyn(
	value _v_man)
{
  man__t man; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */
Cudd_AutodynDisable(man->man);
  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_autodyn_status(
	value _v_man)
{
  man__t man; /*in*/
  int *heuristic; /*out*/
  int _c1;
  value _v2;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  heuristic = &_c1;
  /* begin user-supplied calling sequence */

{
  int b;
  b = Cudd_ReorderingStatus(man->man,(Cudd_ReorderingType*)heuristic);
  if (!b) heuristic = NULL;
}

  /* end user-supplied calling sequence */
  if (heuristic == NULL) {
    _vres = Val_int(0);
  } else {
    _v2 = camlidl_c2ml_man_enum_reorder(*heuristic);
    Begin_root(_v2)
      _vres = camlidl_alloc_small(1, 0);
      Field(_vres, 0) = _v2;
    End_roots();
  }
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_group(
	value _v_man,
	value _v_low,
	value _v_size,
	value _v_type)
{
  man__t man; /*in*/
  int low; /*in*/
  int size; /*in*/
  int type; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  low = Int_val(_v_low);
  size = Int_val(_v_size);
  type = camlidl_ml2c_man_enum_mtr(_v_type);
  /* begin user-supplied calling sequence */
Cudd_MakeTreeNode(man->man, low, size, type);
  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_ungroupall(
	value _v_man)
{
  man__t man; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */
Cudd_FreeTree(man->man);
  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_set_varmap(
	value _v_man,
	value _v_permut)
{
  man__t man; /*in*/
  int *permut; /*in*/
  int size; /*in*/
  mlsize_t _c1;
  mlsize_t _c2;
  value _v3;
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  _c1 = Wosize_val(_v_permut);
  permut = camlidl_malloc(_c1 * sizeof(int ), _ctx);
  for (_c2 = 0; _c2 < _c1; _c2++) {
    _v3 = Field(_v_permut, _c2);
    permut[_c2] = Int_val(_v3);
  }
  size = _c1;
  /* begin user-supplied calling sequence */
{
  int ok = Cuddaux_SetVarMap(man->man,permut,size);
  if (ok==0) caml_failwith("Man.set_varmap failed");
}
  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_background(
	value _v_man)
{
  man__dt man; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__dt(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */
{
  DdNode* add = Cudd_ReadBackground(man->man);
  _res = cuddV(add);
}
  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_background(
	value _v_man,
	value _v_v)
{
  man__dt man; /*in*/
  double v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__dt(_v_man, &man, _ctx);
  v = Double_val(_v_v);
  /* begin user-supplied calling sequence */
{
  DdNode* add = Cudd_addConst(man->man,v);
  cuddRef(add);
  Cudd_SetBackground(man->man,add);
}
  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_epsilon(
	value _v_man)
{
  man__dt man; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__dt(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadEpsilon(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_epsilon(
	value _v_man,
	value _v_v)
{
  man__dt man; /*in*/
  double v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__dt(_v_man, &man, _ctx);
  v = Double_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetEpsilon(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_min_hit(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadMinHit(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_min_hit(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetMinHit(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_max_cache_hard(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadMaxCacheHard(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_max_cache_hard(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetMaxCacheHard(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_looseupto(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadLooseUpTo(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_looseupto(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetLooseUpTo(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_max_live(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadMaxLive(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_max_live(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetMaxLive(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_max_mem(
	value _v_man)
{
  man__t man; /*in*/
  long _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadMaxMemory(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = copy_int64(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_max_mem(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  long v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int64_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetMaxMemory(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_sift_max_swap(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadSiftMaxSwap(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_sift_max_swap(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetSiftMaxSwap(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_sift_max_var(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadSiftMaxVar(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_sift_max_var(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetSiftMaxVar(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_groupcheck(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadGroupcheck(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_man_enum_aggregation(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_groupcheck(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = camlidl_ml2c_man_enum_aggregation(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetGroupcheck(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_arcviolation(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadArcviolation(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_arcviolation(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetArcviolation(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_crossovers(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadNumberXovers(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_crossovers(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetNumberXovers(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_population(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadPopulationSize(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_population(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetPopulationSize(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_recomb(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadRecomb(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_recomb(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetRecomb(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_symmviolation(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadSymmviolation(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_symmviolation(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetSymmviolation(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_max_growth(
	value _v_man)
{
  man__t man; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadMaxGrowth(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_max_growth(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  double v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Double_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetMaxGrowth(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_max_growth_alt(
	value _v_man)
{
  man__t man; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadMaxGrowthAlternate(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_max_growth_alt(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  double v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Double_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetMaxGrowthAlternate(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_reordering_cycle(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadReorderingCycle(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_reordering_cycle(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetReorderingCycle(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_max_reorderings(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadMaxReorderings(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_max_reorderings(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetMaxReorderings(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_next_autodyn(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadNextReordering(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_set_next_autodyn(
	value _v_man,
	value _v_v)
{
  man__t man; /*in*/
  int v; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  v = Int_val(_v_v);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
Cudd_SetNextReordering(man->man,v);
End_roots();

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_get_cache_hits(
	value _v_man)
{
  man__t man; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadCacheHits(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_cache_lookups(
	value _v_man)
{
  man__t man; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadCacheLookUps(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_cache_slots(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadCacheSlots(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_cache_used_slots(
	value _v_man)
{
  man__t man; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadCacheUsedSlots(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_dead(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadDead(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_error(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadErrorCode(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = camlidl_c2ml_man_enum_error(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_gc_time(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadGarbageCollectionTime(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_gc_nb(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadGarbageCollections(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_keys(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadKeys(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_linear(
	value _v_man,
	value _v_x,
	value _v_y)
{
  man__t man; /*in*/
  int x; /*in*/
  int y; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  x = Int_val(_v_x);
  y = Int_val(_v_y);
  /* begin user-supplied calling sequence */
_res = Cudd_ReadLinear(man->man,x,y);
  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_max_cache(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadMaxCache(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_min_dead(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadMinDead(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_node_count(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadNodeCount(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_node_count_peak(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadPeakNodeCount(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_reordering_time(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadReorderingTime(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_reordering_nb(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadReorderings(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_bddvar_nb(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadSize(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_zddvar_nb(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadZddSize(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_slots(
	value _v_man)
{
  man__t man; /*in*/
  int _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadSlots(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = Val_int(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_used_slots(
	value _v_man)
{
  man__t man; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadUsedSlots(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_get_swap_nb(
	value _v_man)
{
  man__t man; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */

Begin_roots1(_v_man);
_res = Cudd_ReadSwapSteps(man->man);
End_roots();

  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

value camlidl_man_print_info(
	value _v_man)
{
  man__t man; /*in*/
  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */
  fflush(stdout);
   Cudd_PrintInfo(man->man,stdout);
   fflush(stdout);

  /* end user-supplied calling sequence */
  camlidl_free(_ctx);
  return Val_unit;
}

value camlidl_man_num_recursive_calls(
	value _v_man)
{
  man__t man; /*in*/
  double _res;
  value _vres;

  struct camlidl_ctx_struct _ctxs = { CAMLIDL_TRANSIENT, NULL };
  camlidl_ctx _ctx = &_ctxs;
  camlidl_ml2c_man_man__t(_v_man, &man, _ctx);
  /* begin user-supplied calling sequence */
_res = Cudd_recursiveCalls(man->man);
  /* end user-supplied calling sequence */
  _vres = copy_double(_res);
  camlidl_free(_ctx);
  return _vres;
}

