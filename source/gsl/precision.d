module gsl.types;

/* 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Gerard Jungman
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

/* Author:  B. Gough and G. Jungman */

/*
* D interface file:
* Author: Chibisi Chima-Okereke
*/

import gsl.types;

extern (C){

/* A type for the precision indicator.
 * This is mainly for pedagogy.
 */
alias gsl_prec_t = uint;


/* The number of precision types.
 * Remember that precision-mode
 * can index an array.
 */
enum _GSL_PREC_T_NUM = 3;


/* Arrays containing derived
 * precision constants for the
 * different precision levels.
 */
extern const(double)* gsl_prec_eps;
extern const(double)* gsl_prec_sqrt_eps;
extern const(double)* gsl_prec_root3_eps;
extern const(double)* gsl_prec_root4_eps;
extern const(double)* gsl_prec_root5_eps;
extern const(double)* gsl_prec_root6_eps;

}
