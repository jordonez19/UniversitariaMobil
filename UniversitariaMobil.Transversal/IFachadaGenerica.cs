using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniversitariaMobil.Transversal
{
    public interface IFachadaGenerica<T> where T : class
    {
        bool Insert(T entity);
        bool Update(T entity);
        bool Delete(T entity);

        T First(Func<T, bool> exp);
        IEnumerable<T> All();
        IEnumerable<T> FindAll(Func<T, bool> exp);
    }

}
