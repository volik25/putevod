import { HttpEvent, HttpHandler, HttpInterceptor, HttpRequest } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {
  constructor() {}

  public intercept(req: HttpRequest<{}>, next: HttpHandler): Observable<HttpEvent<{}>> {
    let params = req;
    if (sessionStorage.getItem('adminToken')) {
      let token = sessionStorage.getItem('adminToken');
      const paramReq = req.clone({
        params: req.params.set('token', token),
      });
      params = paramReq;
    }
    return next.handle(params);
  }
}
