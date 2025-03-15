package org.iMage.HDrize.matrix;

import org.iMage.HDrize.base.matrix.IMatrix;
import org.ojalgo.matrix.store.PrimitiveDenseStore;

/**
 * A matrix.
 *
 */
public final class Matrix implements IMatrix {

  private final int rows;
  private final int cols;

  final double[][] data;
  /**
   * Create a new matrix.
   *
   * @param m the original matrix
   */
  public Matrix(IMatrix m) {
    this(m.copy());
  }

  /**
   * Create a new matrix.
   *
   */
  private Matrix(double[][] m) {
    this(m.length, m.length == 0 ? 0 : m[0].length);
    for (int r = 0; r < this.rows; r++) {
      if (m[r].length != this.cols) {
        throw new IllegalArgumentException("Rows have not equal lengths.");
      }
      for (int c = 0; c < this.cols; c++)
        this.set(r, c, m[r][c]);
    }

  }

  /**
   * Create a matrix (only zeros).
   *
   * @param rows the amount of rows
   */
  public Matrix(int rows, int cols) {
    if (rows < 1 || cols < 1) {
      throw new IllegalArgumentException("Rows and cols have to be >= 1");
    }
    this.rows = rows;
    this.cols = cols;
    this.data = new double[rows][cols];
  }

  @Override
  public double[][] copy() {
    double[][] copy = new double[this.rows][this.cols];
    for (int r = 0; r < this.rows; r++) {
      for (int c = 0; c < this.cols; c++) {
        copy[r][c] = this.data[r][c];
      }
    }
    return copy;
  }

  @Override
  public int rows() {
     return this.rows;
  }

  @Override
  public int cols() {
      return this.cols;
  }
  @Override
  public void set(int r, int c, double v) {
    this.data[r][c] = v;

  }

  @Override
  public double get(int r, int c) {
    return this.data[r][c];
  }

  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder();
    String closeParen = "}";
    builder.append("{\n");
    for (int r = 0; r < this.rows(); r++) {
        builder.append("{");
        for (int c = 0; c < this.cols(); c++) {
         builder.append(this.get(r, c));
         if (c != this.cols() - 1) {
             builder.append(", ");
         }
       }
       builder.append("}\n");
      }
      builder.append("}");
      return builder.toString();
    }
  }
}