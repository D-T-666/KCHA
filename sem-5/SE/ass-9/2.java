public boolean isIdentity(double[][] mtx) {
  if (mtx == null || mtx.length != mtx[0].length) {
    return false;
  }
  int n = mtx.length;

  for (int r = 0; r < n; r++) {
    for (int c = 0; c < n; c++) {
      if (r == c && Math.abs(mtx[r][c] - 1) >= 1E-8) {
        return false;
      } else if (r != c & Math.abs(mtx[r][c]) >= 1E-8) {
        return false;
      }
    }
  }
  return true;
}