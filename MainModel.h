#ifndef MAINMODEL_H /* -*-c++-*- */
#define MAINMODEL_H
#include <QStandardItemModel>
#include <tcl.h>
#include <string>
#include "rapidjson/document.h"

namespace moses {
  class MainModel : public QStandardItemModel
  {
    Q_OBJECT
  public:
    MainModel(QObject *parent = nullptr);
    ~MainModel();
  public slots:
    void loadFile(const QString &fN);
  public:
    int registorTclFunctions();
    static int set_log_file(ClientData clientData, Tcl_Interp *interp,
                            int objc, Tcl_Obj *CONST objv[]);
    static int set_config_opt(ClientData clientData, Tcl_Interp *interp,
                              int objc, Tcl_Obj *CONST objv[]);
    static int compare_library(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int create_operating_condition(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int set_opc_process(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int add_opc_supplies(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int add_opc_grounds(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int set_opc_temperature(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int set_opc_default_voltage(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int add_back_bias_supplies(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int define_parameters(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int pintype(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int create(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int set_location(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int import(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int configure(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int characterize(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);
    static int model(ClientData clientData, Tcl_Interp *interp,
                               int objc, Tcl_Obj *CONST objv[]);    
    static void addValueFromTcl(const std::string &name, int objc, Tcl_Obj *CONST objv[]);
  private:
    void buildItems();
    Tcl_Interp *interp_ = nullptr;
    static rapidjson::Document data_;
  };
}
#endif /* MAINMODEL_H */
