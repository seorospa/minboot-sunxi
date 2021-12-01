#ifndef _TYPES_H_
#define _TYPES_H_

#define BIT(x) (1 << (x))

#define true 1
#define false 0

typedef int bool;

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed int int32_t;

#define readl(a) (*(volatile uint32_t *)a)
#define writel(v, a) *(volatile uint32_t *)(a) = v

#define MAX(x, y) ((x > y) ? (x) : (y))
#define MIN(x, y) ((x < y) ? (x) : (y))

#define clamp(v, a, b) MIN(MAX(v, a), b)
#define setbits(a, v) writel(readl(a) | v, a)

#endif // _TYPES_H_