#include <QTimer>
#include <QFileDialog>
#include "MainWidget.h"
#include "ui_MainWidget.h"
#include "MainModel.h"

using namespace moses;

MainWidget::MainWidget(QWidget *parent)
  : QWidget(parent), ui(new Ui::MainWidget)
{
  ui->setupUi(this);
  initGui();
  model_ = new MainModel(this);
  ui->treeView->setModel(model_);
}

MainWidget::~MainWidget()
{
}

void MainWidget::initGui()
{
  ui->treeView->setUniformRowHeights(true);
}

void MainWidget::openFile()
{
  QString fileName = QFileDialog::getOpenFileName(this, tr("Open Tcl File"),
                                                ".", tr("Tcl File (*.tcl)"));
  if (fileName.isEmpty()) return;
  ui->lineEdit->setText(fileName);
  model_->loadFile(fileName);
  
}

