#include "MainWindow.h"
#include <QApplication>
using namespace moses;

int main(int argc, char *argv[])
{
  QApplication app(argc, argv);
  MainWindow * mainWin = new MainWindow();
  mainWin->resize(1600, 1200);
  mainWin->show();
  return app.exec();
}
