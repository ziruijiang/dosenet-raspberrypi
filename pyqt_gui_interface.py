# import weather_DAQ
# import air_quality_DAQ
# import adc_DAQ
#import plot_manager_D3S
import sys
from PyQt5 import QtCore, QtGui, uic, QtWidgets

qtCreatorFile = "pyqt_gui.ui" # Enter file here.
 
Ui_MainWindow, QtBaseClass = uic.loadUiType(qtCreatorFile)
 
class MyApp(QtWidgets.QMainWindow, Ui_MainWindow):
    def __init__(self):
        QtWidgets.QMainWindow.__init__(self)
        Ui_MainWindow.__init__(self)
        self.setupUi(self)
        self.pushButton.clicked.connect(self.make_run_gui)

    def make_run_gui():
    	maxdata = self.maxdata.value()
    	n_merge = self.n_merge.value()
    	period = self.period_option.value()
    	location = self.location_option.currentText()
 
if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = MyApp()
    window.show()
    sys.exit(app.exec_())