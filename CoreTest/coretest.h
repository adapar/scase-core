#ifndef CORETEST_H
#define CORETEST_H

#include <QObject>

class CoreTest : public QObject
{
    Q_OBJECT
public:
    explicit CoreTest(QObject *parent = 0);

signals:

public slots:

private slots:
    void testDummy();
};

#endif // CORETEST_H
