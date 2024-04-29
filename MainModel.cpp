#include <iostream>
#include "rapidjson/error/en.h"
#include "rapidjson/istreamwrapper.h"
#include "rapidjson/prettywriter.h"
#include "rapidjson/writer.h"
#include "rapidjson/stringbuffer.h"

#include "MainModel.h"
using namespace moses;
using namespace rapidjson;
using namespace std;
Document MainModel::data_;

MainModel::MainModel(QObject *parent)
  : QStandardItemModel(parent)
{
  interp_ = Tcl_CreateInterp();
  registorTclFunctions();
}


MainModel::~MainModel()
{

}

void MainModel::loadFile(const QString &fN)
{
  clear();
  data_.SetObject();
  int status = 0;
  if ((status = Tcl_EvalFile(interp_, fN.toStdString().c_str())) != TCL_OK) {
    std::cout <<"ERROR when reading file " << fN.toStdString() << ": "
              << Tcl_GetStringResult(interp_) << std::endl;
    // Most convenient access for this is to run a tiny Tcl script.
    // Tcl_Eval(interp, "puts {STACK TRACE:}; puts $errorInfo; flush stdout;");
    // Tcl_Exit(status);
    // return TCL_ERROR; // This should be unreachable; Tcl_Exit doesn't return...
  }
  // Tcl_EvalFile(interp_, fN.toStdString().c_str());
  buildItems();
}

int MainModel::registorTclFunctions()
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

  if (!Tcl_CreateObjCommand(interp_, "create_operating_condition", create_operating_condition, 0, 0)) {
    QString msg = QString("Unable to register create_operating_condition");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "set_opc_process", set_opc_process, 0, 0)) {
    QString msg = QString("Unable to register set_opc_process");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "add_opc_supplies", add_opc_supplies, 0, 0)) {
    QString msg = QString("Unable to register add_opc_supplies");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "add_opc_grounds", add_opc_grounds, 0, 0)) {
    QString msg = QString("Unable to register add_opc_grounds");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "set_opc_temperature", set_opc_temperature, 0, 0)) {
    QString msg = QString("Unable to register set_opc_temperature");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "set_opc_default_voltage", set_opc_default_voltage, 0, 0)) {
    QString msg = QString("Unable to register set_opc_default_voltage");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "add_back_bias_supplies", add_back_bias_supplies, 0, 0)) {
    QString msg = QString("Unable to register add_back_bias_supplies");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "define_parameters", define_parameters, 0, 0)) {
    QString msg = QString("Unable to register define_parameters");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "pintype", pintype, 0, 0)) {
    QString msg = QString("Unable to register pintype");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "create", create, 0, 0)) {
    QString msg = QString("Unable to register create");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "set_location", set_location, 0, 0)) {
    QString msg = QString("Unable to register set_location");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "import", import, 0, 0)) {
    QString msg = QString("Unable to register import");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "configure", configure, 0, 0)) {
    QString msg = QString("Unable to register configure");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "characterize", characterize, 0, 0)) {
    QString msg = QString("Unable to register ");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }
  if (!Tcl_CreateObjCommand(interp_, "model", model, 0, 0)) {
    QString msg = QString("Unable to register model");
    Tcl_SetResult(interp_, msg.toLocal8Bit().data(), TCL_VOLATILE);
  }

  return TCL_OK;
}

int MainModel::set_log_file(ClientData clientData, Tcl_Interp *interp,
                            int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("set_log_file", objc, objv);
  return TCL_OK;
}

int MainModel::set_config_opt(ClientData clientData, Tcl_Interp *interp,
                                     int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("set_config_opt", objc, objv);
  return TCL_OK;
}

int MainModel::compare_library(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("compare_library", objc, objv);
  return TCL_OK;
}

int MainModel::create_operating_condition(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("create_operating_condition", objc, objv);
  return TCL_OK;
}

int MainModel::set_opc_process(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("set_opc_process", objc, objv);
  return TCL_OK;
}

int MainModel::add_opc_supplies(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("add_opc_supplies", objc, objv);
  return TCL_OK;
}

int MainModel::add_opc_grounds(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("add_opc_grounds", objc, objv);
  return TCL_OK;
}

int MainModel::set_opc_temperature(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("set_opc_temperature", objc, objv);
  return TCL_OK;
}

int MainModel::set_opc_default_voltage(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("set_opc_default_voltage", objc, objv);
  return TCL_OK;
}

int MainModel::add_back_bias_supplies(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("add_back_bias_supplies", objc, objv);
  return TCL_OK;
}

int MainModel::define_parameters(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("define_parameters", objc, objv);
  return TCL_OK;
}

int MainModel::pintype(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("pintype", objc, objv);
  return TCL_OK;
}

int MainModel::create(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("create", objc, objv);
  return TCL_OK;
}

int MainModel::set_location(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("set_location", objc, objv);
  return TCL_OK;
}

int MainModel::import(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("import", objc, objv);
  return TCL_OK;
}

int MainModel::configure(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("configure", objc, objv);
  return TCL_OK;
}

int MainModel::characterize(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("characterize", objc, objv);
  return TCL_OK;
}

int MainModel::model(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[])
{
  (void) clientData;
  addValueFromTcl("model", objc, objv);
  return TCL_OK;
}

void MainModel::addValueFromTcl(const string &name, int objc,
                                Tcl_Obj *CONST objv[])
{
  auto &a = data_.GetAllocator();
  if (!data_.HasMember(name.c_str())) {
    data_.AddMember(Value(name.c_str(), a), Value(kArrayType), a);
  }
  Value v(kArrayType);
  for (int i = 1 ; i <objc; ++i) {
    v.PushBack(Value(Tcl_GetStringFromObj(objv[i], NULL), a), a);
  }
  data_[name.c_str()].PushBack(v, a);
}

void MainModel::buildItems()
{
  int column = 1;
  for (auto &e: data_.GetObject()) {
    auto &k = e.name;
    auto &v = e.value;
    auto item = new QStandardItem(k.GetString());
    item->setToolTip(k.GetString());
    appendRow(item);
    for (auto &m : v.GetArray()) {
      QList<QStandardItem *> l;
      for (auto &mm : m.GetArray()) {
        auto item1 = new QStandardItem(mm.GetString());
        item1->setToolTip(mm.GetString());
        l.append(item1);
      }
      item->appendRow(l);
      column = column < l.size() ? l.size() : column;
    }
  }
  setColumnCount(column);
}
