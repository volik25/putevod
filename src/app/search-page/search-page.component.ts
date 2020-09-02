import { Component, OnInit } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { ApiService } from '../services/api.service';
import { Question } from '../models/questions';
import { AnswerPageComponent } from '../answer-page/answer-page.component';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { LoadingService } from '../services/loading.service';

@Component({
  selector: 'search-page',
  templateUrl: './search-page.component.html',
  styleUrls: ['./search-page.component.less']
})
export class SearchPageComponent implements OnInit {
  public searchForm: FormGroup;
  public loadComplete = false;
  public questions: Question[] = [];
  public ql:Question[] = [];
  public qc:Question[] = [];
  public qr:Question[] = [];
  public modal: BsModalRef;
  constructor(public ms: BsModalService, private api: ApiService,
              private fb: FormBuilder, private loadingService: LoadingService) { }

  ngOnInit() {
    this.initPage();
  }

  initPage(){
    this.searchForm = this.fb.group({
      search: [null, Validators.required]
    });
    const subs = this.api.getHeaders().subscribe(questions => {
      this.ql = [];
      this.qc = [];
      this.qr = [];
      this.questions = questions;
      const k = this.questions.length;
      if (k%3 == 0) {
        const p = k/3;
        for (let i = 0; i < this.questions.length; i++) {
          const el = this.questions[i];
          if (i<p) {
            this.ql.push(el)
          }
          if (i>=p && i<p*2) {
            this.qc.push(el)
          }
          if (i>=p*2) {
            this.qr.push(el);
          }
        }
      }
      if (k%3 == 1) {
        const p = (k-1)/3;
        for (let i = 0; i < this.questions.length; i++) {
          const el = this.questions[i];
          if (i<p) {
            this.ql.push(el)
          }
          if (i>=p && i<p*2+1) {
            this.qc.push(el)
          }
          if (i>=p*2+1) {
            this.qr.push(el);
          }
        }
      }
      if (k%3 == 2) {
        const p = (k-2)/3;
        for (let i = 0; i < this.questions.length; i++) {
          const el = this.questions[i];
          if (i<p+1) {
            this.ql.push(el)
          }
          if (i>=p+1 && i<p*2+1) {
            this.qc.push(el)
          }
          if (i>=p*2+1) {
            this.qr.push(el);
          }
        }
      }
      this.loadingService.removeSubscription(subs);
      this.loadComplete = true;
    });
    this.loadingService.addSubscription(subs);
  }

  showAnswer(id){
    const initialState = {
      id: id
    }
    this.modal = this.ms.show(AnswerPageComponent, {initialState});
  }

  search(){
    const str = this.searchForm.getRawValue();
    if (str.search) {
      const subs = this.api.search(str).subscribe(res => {
        this.questions = res;
        this.ql = [];
        this.qc = this.questions;
        this.qr = [];
        this.loadingService.removeSubscription(subs);
      });
      this.loadingService.addSubscription(subs);
    }
    else{
      this.initPage();
    }
  }
}
