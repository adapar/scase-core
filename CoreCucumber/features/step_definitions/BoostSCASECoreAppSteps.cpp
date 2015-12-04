
#include <cstdlib>

#include <boost/test/unit_test.hpp>
#include <cucumber-cpp/defs.hpp>

#include <QApplication>
#include <QTextCodec>
#include <QTest>

#include <mainwindow.h>

static int argc = 0;
static QApplication app(argc, 0);

std::istream& operator>> (std::istream& in, QString& val) { std::string s; in >> s; val = s.c_str(); return in; }
std::ostream& operator<< (std::ostream& out, const QString& val) { out << val; return out; }

GIVEN("^I just turned on the core$") {
    QTextCodec::setCodecForLocale(QTextCodec::codecForName("utf-8"));
    cucumber::ScenarioScope<MainWindow> mainWindow;
    //QTest::qWaitForWindowShown(mainWindow.get());
    //BOOST_CHECK_EQUAL(mainWindow->windowTitle(), "SCASE");
}

 THEN("^the display should be empty$") {
     BOOST_ASSERT_MSG(false, "This scenario is not implemented");
 }