#ifndef MOSESWIDGET_H /* -*-c++-*- */
#define MOSESWIDGET_H
#include <QWidget>
#include <tcl.h>

namespace Ui {
  class MainWidget;
}

namespace moses {
  class MainModel;
  
  class MainWidget : public QWidget
  {
    Q_OBJECT
  public:
    explicit MainWidget(QWidget *parent = nullptr);
    ~MainWidget();
    void saveView(const QString& fileName) {}
    void loadView(const QString& fileName) {}
    void initGui();
  public slots:
    void openFile();
  private:
    Ui::MainWidget *ui;
    MainModel *model_;
  };
}
#endif /* MOSESWIDGET_H */
