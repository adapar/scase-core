#include <QtTest/QTest>
#include "coretest.h"

CoreTest::CoreTest(QObject *parent) : QObject(parent)
{

}

void CoreTest::testDummy() {
    QVERIFY2( 2 == 1 + 1, "Expect two to be one plus one");
}
