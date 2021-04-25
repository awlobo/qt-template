#include "headers/style.h"

#include <QtQml>

Style::Style(QObject *parent) : QObject(parent)
{
}

const QVariantMap &Style::colors() const
{
    return m_colors;
}
