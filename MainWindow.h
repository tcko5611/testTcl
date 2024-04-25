#ifndef MAINWINDOW_H /* -*-c++-*- */
#define MAINWINDOW_H
#include <QMainWindow>
namespace moses {
  class MainWindow : public QMainWindow
  {
    Q_OBJECT

    public:
    explicit MainWindow(QWidget *parent=nullptr);
  private:
    void setupMenuBar();
    QAction *actionOpen_;
  };
}
#endif /* MAINWINDOW_H */
