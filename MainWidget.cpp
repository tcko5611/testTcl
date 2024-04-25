#include <QTimer>
#include <QFileDialog>
#include "MainWidget.h"
#include "ui_MainWidget.h"

using namespace moses;
QString MainWidget::set_log_file_;
QString MainWidget::compare_library_;
QList<QPair<QString, QString>> MainWidget::set_config_opt_;

MainWidget::MainWidget(QWidget *parent)
  : QWidget(parent), ui(new Ui::MainWidget)
{
  ui->setupUi(this);
  initGui();
  interp_ = Tcl_CreateInterp();
  registorTclFunctions();
}

MainWidget::~MainWidget()
{
}

void MainWidget::initGui()
{
}

int MainWidget::registorTclFunctions()
{
  if (!Tcl_CreateObjCommand(interp_, "set_log_file", set_log_file, 0, 0)) {
    QString msg = QString("Unable to register set_log_file");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }

  if (!Tcl_CreateObjCommand(interp_, "set_config_opt", set_config_opt, 0, 0)) {
    QString msg = QString("Unable to register set_config_opt");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }

  if (!Tcl_CreateObjCommand(interp_, "compare_library", compare_library, 0, 0)) {
    QString msg = QString("Unable to register compare_library");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  return TCL_OK;
}

void MainWidget::loadFile(const QString &fN)
{
  set_log_file_ = "";
  compare_library_ = "";
  set_config_opt_.clear();
  ui->tableWidgetConfigOpt->setRowCount(0);
  Tcl_EvalFile(interp_, fN.toStdString().c_str());
  ui->lineEditLogFile->setText(set_log_file_);
  ui->lineEditCompareLibrary->setText(compare_library_);
  int row = 0;
  ui->tableWidgetConfigOpt->setRowCount(set_config_opt_.size());
  for (auto &e: set_config_opt_) {
    ui->tableWidgetConfigOpt->setItem(row, 0, new QTableWidgetItem(e.first));
    ui->tableWidgetConfigOpt->setItem(row, 1, new QTableWidgetItem(e.second));     row++;                          
  }
}

void MainWidget::openFile()
{
  QString fileName = QFileDialog::getOpenFileName(this, tr("Open Tcl File"),
                                                ".", tr("Tcl File (*.tcl)"));
  if (fileName.isEmpty()) return;
  loadFile(fileName);
}

int MainWidget::set_log_file(ClientData clientData, Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  QString f = Tcl_GetStringFromObj(objv[1], NULL);
  set_log_file_ = f;
  return TCL_OK;
}

int MainWidget::compare_library(ClientData clientData, Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[])
{
  QString s;
  for (int i = 0; i < objc; ++i) {
    s += Tcl_GetStringFromObj(objv[i], NULL);
    s += " ";
  }
  compare_library_ = s;
  return TCL_OK;
}

int MainWidget::set_config_opt(ClientData clientData, Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[])
{
  QString p = Tcl_GetStringFromObj(objv[1], NULL);
  QString v = Tcl_GetStringFromObj(objv[2], NULL);
  set_config_opt_.append(qMakePair(p, v));
  return TCL_OK;
}
