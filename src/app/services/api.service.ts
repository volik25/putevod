import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Question } from '../models/questions';
import { environment } from 'src/environments/environment';

@Injectable()
export class ApiService {
  private baseUrl: string = `${environment.url}PutevodBack/Controller.php?`;;
  constructor(private http: HttpClient) {}

  /** Проверка доступа админа */
  public checkAccess(): Observable<boolean> {
    return this.http.get<boolean>(`${this.baseUrl}?key=check-admin`);
  }

  public getQuestions(): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}?key=get-questions`);
  }

  public getQuestion(id: number): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}?key=get-question&id=${id}`);
  }

  public addQuestion(item): Observable<any> {
    return this.http.post<any>(`${this.baseUrl}?key=add-question`, item);
  }

  public updateQuestion(item: Question): Observable<any> {
    return this.http.post<any>(`${this.baseUrl}?key=update-question`, item);
  }

    public removeQuestion(item): Observable<any> {
    return this.http.post<any>(`${this.baseUrl}?key=remove-question`, item);
  }

  public uploadImg(data): Observable<string> {
    return this.http.post<string>(`${this.baseUrl}?key=upload-img`, data);
  }

  public getHeaders(): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}?key=get-headers`);
  }

  public getFAQs(): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}?key=get-FAQs`);
  }

  public search(str): Observable<any> {
    return this.http.post<any>(`${this.baseUrl}?key=search`, str);
  }

  public signIn(userData): Observable<string> {
    return this.http.post<string>(`${this.baseUrl}?key=sign-in`, userData);
  }

  public signUp(userData): Observable<string> {
    return this.http.post<string>(`${this.baseUrl}?key=sign-up`, userData);
  }
}