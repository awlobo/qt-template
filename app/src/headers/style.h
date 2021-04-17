#ifndef STYLE_H
#define STYLE_H

#include <QColor>
#include <QtQml>

class Style : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantMap colors READ colors CONSTANT)

public:
    Style(QObject *parent = 0);

    const QVariantMap&
    colors() const;

signals:
private:
    QVariantMap m_colors = {
        { QString("primary"), QColor("#b6d2ef") },
        { QString("primaryLight"), QColor("#38536D") },
        { QString("secondary"), QColor("#0091ea") },
        { QString("secondaryLight"), QColor("#dadada") },
        { QString("accent"), QColor("#69f0ae") }
    };
};

#endif // STYLE_H
