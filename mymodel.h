#ifndef MYMODEL_H
#define MYMODEL_H

#include <QAbstractListModel>

struct Data {
    Data() {}
    Data(const QString& name, const QString& flag, const QString& detail)
        : name(name), flag(flag), detail(detail){}
    QString name;
    QString flag;
    QString detail;
};

class MyModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        NameRole = Qt::UserRole,
        FlagRole,
        DetailRole
    };
    explicit MyModel(QObject *parent = 0);

    int rowCount(const QModelIndex& parent) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole)const override;
    QHash<int, QByteArray> roleNames() const override;
private:
    QVector< Data > m_data;
};

#endif // MYMODEL_H
