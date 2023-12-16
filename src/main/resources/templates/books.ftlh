<#import "blocks/template.ftlh" as t>
<@t.template user>
         <#if user.isAdmin()>
                 <a href="/admin" class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
                                          role="button">Панель администратора</a>
 <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить новую книгу
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/book/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="bookTitle">Название книги</label>
                <input type="text" required class="form-control"
                       id="bookTitle" name="title">
            </div>
            <div class="form-group">
                <label for="bookAuthor">Автор книги</label>
                <div class="input-group mb-3">
                    <input type="text" required class="form-control" name="author">
                    <div class="input-group-append">
                        <span class="input-group-text"></span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="description">Описание книги</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
              <div class="form-group">
                            <label for="bookTitle">Год издания книги</label>
                            <input type="year" required class="form-control"
                                   id="bookYear" name="year">
                        </div>
            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первая фотография книги</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Вторая фотография книги</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третья фотография книги</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
        </#if>
         <div class="card-columns">
                 <#list books as book>
                     <a href="/book/${book.id}" class="book-link">
                         <div class="card text-white bg-dark my-3 product">
                          <#if user.isAdmin()>
                         <div class="card-top">
                                                 <form action="/book/delete/${book.id}" method="post">
                                                     <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                                     <button type="submit" class="btn btn-danger m-3">
                                                         Удалить
                                                     </button>
                                                 </form>
                                             </div>
                                             </#if>
                             <img src="/images/${book.previewImageId}"
                                  class="card-img-top">
                             <div class="card-body">
                                 <h5 class="card-title">${book.title}</h5>
                                 <p class="card-text">${book.author} </p>
                             </div>
                             <div class="card-footer">
                                 ${book.year}

                             </div>
                         </div>
                     </a>
                 <#else>
                     <h1 style="text-align: center">Не найдено</h1>
                 </#list>
             </div>
    </@t.template>