/*
' Copyright (c) 2016 JoopSoft
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/
using System.Collections.Generic;
using DotNetNuke.Data;

namespace JS.Modules.JSNewsModule.Components
{
    class NewsController
    {
        public void AddNews(News n)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<News>();
                rep.Insert(n);
            }
        }

        public void DeleteNews(int newsId, int moduleId)
        {
            var n = LoadNews(newsId, moduleId);
            DeleteNews(n);
        }

        public void DeleteNews(News n)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<News>();
                rep.Delete(n);
            }
        }

        public IEnumerable<News> LoadAllNews(int moduleId)
        {
            IEnumerable<News> n;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<News>();
                n = rep.Get(moduleId);
            }
            return n;
        }

        public News LoadNews(int newsId, int moduleId)
        {
            News n;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<News>();
                n = rep.GetById(newsId, moduleId);
            }
            return n;
        }

        public void UpdateNews(News n)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<News>();
                rep.Update(n);
            }
        }

    }
}
