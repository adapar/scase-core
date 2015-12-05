
#include <cstdlib>

#include <boost/test/unit_test.hpp>
#include <cucumber-cpp/defs.hpp>

#include <QApplication>
#include <QTest>

#include "mainwindow.h"

static int argc = 0;
static QApplication app(argc, 0);

std::istream& operator>> (std::istream& in, QString& val) { std::string s; in >> s; val = s.c_str(); return in; }
std::ostream& operator<< (std::ostream& out, const QString& val) { out << val.constData(); return out; }

GIVEN("^I just turned on the core$") {
}

THEN("^the window title should be (.*)$") {
    REGEX_PARAM(QString, expected);
    cucumber::ScenarioScope<MainWindow> mainWindow;
    BOOST_CHECK_EQUAL(mainWindow.get()->windowTitle(), expected);
}
