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

    const QVariantMap &
    colors() const;

signals:
private:
    QVariantMap m_colors = {
        {QString("primary"), QColor("#64b5f6")},
        {QString("primaryLight"), QColor("#9be7ff")},
        {QString("primaryDark"), QColor("#2286c3")},
        {QString("accent"), QColor("#f50057")}};
};

#endif // STYLE_H
