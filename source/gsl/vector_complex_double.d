module gsl.vector_complex_double;
/* vector/gsl_vector_complex_double.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

/*
* D interface file:
* Author: Chibisi Chima-Okereke
*/

import gsl.errno;
import gsl.check_range;
import gsl.block_char;
import gsl.complex;
import gsl.vector_double;
import gsl.block_complex_double;
import core.stdc.stdio: FILE;

extern (C){


struct gsl_vector_complex
{
  size_t size;
  size_t stride;
  double* data;
  gsl_block_complex* block;
  int owner;
}

struct _gsl_vector_complex_view
{
  gsl_vector_complex vector;
}

alias gsl_vector_complex_view = _gsl_vector_complex_view;

struct _gsl_vector_complex_const_view
{
  gsl_vector_complex vector;
}

alias gsl_vector_complex_const_view = const(_gsl_vector_complex_const_view);

/* Allocation */

gsl_vector_complex* gsl_vector_complex_alloc (const(size_t) n);
gsl_vector_complex* gsl_vector_complex_calloc (const(size_t) n);

gsl_vector_complex* gsl_vector_complex_alloc_from_block (gsl_block_complex* b, 
                                           const(size_t) offset, 
                                           const(size_t) n, 
                                           const(size_t) stride);

gsl_vector_complex* gsl_vector_complex_alloc_from_vector (gsl_vector_complex* v, 
                                             const(size_t) offset, 
                                             const(size_t) n, 
                                             const(size_t) stride);

void gsl_vector_complex_free (gsl_vector_complex* v);

/* Views */

_gsl_vector_complex_view gsl_vector_complex_view_array (double* base, size_t n);
_gsl_vector_complex_view gsl_vector_complex_view_array_with_stride (double* base, size_t stride, size_t n);
_gsl_vector_complex_const_view gsl_vector_complex_const_view_array (const(double)* base, size_t n);
_gsl_vector_complex_const_view gsl_vector_complex_const_view_array_with_stride (const(double)* base, size_t stride, size_t n);
_gsl_vector_complex_view gsl_vector_complex_subvector (gsl_vector_complex* base, size_t i, size_t n);
_gsl_vector_complex_view gsl_vector_complex_subvector_with_stride (gsl_vector_complex* v, size_t i, size_t stride, size_t n);
_gsl_vector_complex_const_view gsl_vector_complex_const_subvector (const(gsl_vector_complex)* base, size_t i, size_t n);
_gsl_vector_complex_const_view gsl_vector_complex_const_subvector_with_stride (const(gsl_vector_complex)* v, size_t i, size_t stride, size_t n);
_gsl_vector_view gsl_vector_complex_real (gsl_vector_complex* v);
_gsl_vector_view gsl_vector_complex_imag (gsl_vector_complex* v);
_gsl_vector_const_view gsl_vector_complex_const_real (const(gsl_vector_complex)* v);
_gsl_vector_const_view gsl_vector_complex_const_imag (const(gsl_vector_complex)* v);


/* Operations */

void gsl_vector_complex_set_zero (gsl_vector_complex* v);
void gsl_vector_complex_set_all (gsl_vector_complex* v, gsl_complex z);
int gsl_vector_complex_set_basis (gsl_vector_complex* v, size_t i);

int gsl_vector_complex_fread (FILE* stream, gsl_vector_complex* v);
int gsl_vector_complex_fwrite (FILE* stream, const(gsl_vector_complex)* v);
int gsl_vector_complex_fscanf (FILE* stream, gsl_vector_complex* v);
int gsl_vector_complex_fprintf (FILE* stream, const(gsl_vector_complex)* v, const(char)* format);
int gsl_vector_complex_memcpy (gsl_vector_complex* dest, const(gsl_vector_complex)* src);
int gsl_vector_complex_reverse (gsl_vector_complex* v);
int gsl_vector_complex_swap (gsl_vector_complex* v, gsl_vector_complex* w);
int gsl_vector_complex_swap_elements (gsl_vector_complex* v, const(size_t) i, const(size_t) j);
int gsl_vector_complex_equal (const(gsl_vector_complex)* u, const(gsl_vector_complex)* v);
int gsl_vector_complex_isnull (const(gsl_vector_complex)* v);
int gsl_vector_complex_ispos (const(gsl_vector_complex)* v);
int gsl_vector_complex_isneg (const(gsl_vector_complex)* v);
int gsl_vector_complex_isnonneg (const(gsl_vector_complex)* v);

int gsl_vector_complex_add (gsl_vector_complex* a, const(gsl_vector_complex)* b);
int gsl_vector_complex_sub (gsl_vector_complex* a, const(gsl_vector_complex)* b);
int gsl_vector_complex_mul (gsl_vector_complex* a, const(gsl_vector_complex)* b);
int gsl_vector_complex_div (gsl_vector_complex* a, const(gsl_vector_complex)* b);
int gsl_vector_complex_scale (gsl_vector_complex* a, const(gsl_complex) x);
int gsl_vector_complex_add_constant (gsl_vector_complex* a, const(gsl_complex) x);

gsl_complex gsl_vector_complex_get (const(gsl_vector_complex)* v, const(size_t) i);
void gsl_vector_complex_set (gsl_vector_complex* v, const(size_t) i, gsl_complex z);
gsl_complex* gsl_vector_complex_ptr (gsl_vector_complex* v, const(size_t) i);
const(gsl_complex)* gsl_vector_complex_const_ptr (const(gsl_vector_complex)* v, const(size_t) i);

}
