# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'pyqt_diag_1.ui'
#
# Created by: PyQt5 UI code generator 5.6
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_Dialog_1(object):
    def setupUi(self, Dialog_1):
        Dialog_1.setObjectName("Dialog_1")
        Dialog_1.resize(400, 146)
        self.pushButton = QtWidgets.QPushButton(Dialog_1)
        self.pushButton.setGeometry(QtCore.QRect(10, 50, 112, 34))
        self.pushButton.setObjectName("pushButton")
        self.pushButton_2 = QtWidgets.QPushButton(Dialog_1)
        self.pushButton_2.setGeometry(QtCore.QRect(140, 50, 112, 34))
        self.pushButton_2.setObjectName("pushButton_2")
        self.pushButton_3 = QtWidgets.QPushButton(Dialog_1)
        self.pushButton_3.setGeometry(QtCore.QRect(271, 50, 121, 34))
        self.pushButton_3.setObjectName("pushButton_3")

        self.retranslateUi(Dialog_1)
        QtCore.QMetaObject.connectSlotsByName(Dialog_1)

    def retranslateUi(self, Dialog_1):
        _translate = QtCore.QCoreApplication.translate
        Dialog_1.setWindowTitle(_translate("Dialog_1", "Dialog"))
        self.pushButton.setText(_translate("Dialog_1", "Start"))
        self.pushButton_2.setText(_translate("Dialog_1", "Stop"))
        self.pushButton_3.setText(_translate("Dialog_1", "Air Quality Plot"))

