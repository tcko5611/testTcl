#include <QAction>
#include <QMenuBar>
#include "MainWidget.h"
#include "MainWindow.h"

using namespace moses;

MainWindow::MainWindow(QWidget *parent)
  :QMainWindow(parent)
{
  auto w = new MainWidget(this);
  setCentralWidget(w);
  setupMenuBar();
  connect(actionOpen_, &QAction::triggered, w, &MainWidget::openFile);
}
void MainWindow::setupMenuBar()
{
  auto fileMenu = menuBar()->addMenu("&File");
  actionOpen_=  new QAction("&Open libs", this);
  fileMenu->addAction(actionOpen_);
}
