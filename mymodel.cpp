#include "mymodel.h"

MyModel::MyModel(QObject *parent) :
    QAbstractListModel(parent)
{
    m_data
        << Data("Vietnam", "qrc:image/vietnam_flag.png", "Southeast Asia")
        << Data("India", "qrc:image/india_flag.png", "South Asia")
        << Data("Germany", "qrc:image/germany_flag.png", "Central Europe")
        << Data("US", "qrc:image/us_flag.png", "North America")
        << Data("China", "qrc:image/china_flag.png", "East Asia");
}

int MyModel::rowCount( const QModelIndex& parent) const
{
    if (parent.isValid())
        return 0;

    return m_data.count();
}

QVariant MyModel::data(const QModelIndex &index, int role) const
{
    if ( !index.isValid() )
        return QVariant();

    const Data &data = m_data.at(index.row());
    if ( role == NameRole ){
        return data.name;
    }
    else if ( role == FlagRole )
        return data.flag;
    else if ( role == DetailRole )
        return data.detail;
    else
        return QVariant();
}

//--> slide
QHash<int, QByteArray> MyModel::roleNames() const
{
    static QHash<int, QByteArray> mapping {
        {NameRole, "name"},
        {FlagRole, "flag"},
        {DetailRole, "detail"}
    };
    return mapping;
}
