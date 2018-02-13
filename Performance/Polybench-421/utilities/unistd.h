
#ifndef UNISTD_H
#define UNISTD_H

#ifdef _MSC_VER
static int posix_memalign(void **memptr, size_t alignment, size_t size) {
  *memptr = malloc(size);
  return 0;
}
#endif

#endif /* UNISTD_H */
