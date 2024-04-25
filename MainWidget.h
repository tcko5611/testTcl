#ifndef MOSESWIDGET_H /* -*-c++-*- */
#define MOSESWIDGET_H
#include <QWidget>
#include <tcl.h>

namespace Ui {
  class MainWidget;
}

namespace moses {
  
  class MainWidget : public QWidget
  {
    Q_OBJECT
  public:
    // static functions
    static int set_log_file(ClientData clientData, Tcl_Interp *interp, int objc,
                            Tcl_Obj *CONST objv[]);
    static int set_config_opt(ClientData clientData, Tcl_Interp *interp, int objc,
                          Tcl_Obj *CONST objv[]);
    static int compare_library(ClientData clientData, Tcl_Interp *interp, int objc,
                          Tcl_Obj *CONST objv[]);
    explicit MainWidget(QWidget *parent = nullptr);
    ~MainWidget();
    void saveView(const QString& fileName) {}
    void loadView(const QString& fileName) {}
    void initGui();
    int registorTclFunctions();
    void loadFile(const QString &fN);
  public slots:
    void openFile();
  private:
    Ui::MainWidget *ui;
    Tcl_Interp *interp_ = nullptr;
    static QString set_log_file_;
    static QString compare_library_;
    static QList<QPair<QString, QString>> set_config_opt_;
  };
}
#endif /* MOSESWIDGET_H */
