%{Cpp:LicenseTemplate}\
#include "%{HdrFileName}"
%{JS: Cpp.openNamespaces('%{Class}').replace(/\\s\\{\\nnamespace\\s/g, "::")}
@if '%{IncludeQSharedData}'
class %{CN}Data : public QSharedData
{
public:

};

@endif
@if '%{Base}' === 'QObject'
%{CN}::%{CN}(QObject *parent) : QObject(parent)%{JS: ('%{SharedDataInit}') ? ', %{SharedDataInit}' : ''}
@elsif '%{Base}' === 'QWidget' || '%{Base}' === 'QMainWindow'
%{CN}::%{CN}(QWidget *parent) : %{Base}(parent)%{JS: ('%{SharedDataInit}') ? ', %{SharedDataInit}' : ''}
@elsif '%{Base}' === ''
%{CN}::%{CN}()%{JS: ('%{SharedDataInit}') ? ' : %{SharedDataInit}' : ''}
@else 
%{CN}::%{CN}() : %{Base}()
@endif
{

}
@if '%{IncludeQSharedData}'

%{CN}::%{CN}(const %{CN} &rhs) : data(rhs.data)
{

}

%{CN} &%{CN}::operator=(const %{CN} &rhs)
{
    if (this != &rhs)
        data.operator=(rhs.data);
    return *this;
}

%{CN}::~%{CN}()
{

}
@endif
%{JS: Cpp.closeNamespaces('%{Class}').replace(/[\\s\\n\\S]\+/g, "\\n\}")}\
