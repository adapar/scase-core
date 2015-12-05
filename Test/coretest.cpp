#include <QtTest/QTest>
#include "coretest.h"

Test::Test(QObject *parent) : QObject(parent)
{

}

void Test::testDummy() {
    QVERIFY2( 2 == 1 + 1, "Expect two to be one plus one");
}
