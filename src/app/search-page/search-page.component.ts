import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
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
  public questions: Question[] = [];
  public ql:Question[] = [];
  public qc:Question[] = [];
  public qr:Question[] = [];
  
  constructor(public ms: NgbModal, private api: ApiService, private fb: FormBuilder, private loadingService: LoadingService) { }

  ngOnInit() {
    this.initPage();
  }

  initPage(){
    this.searchForm = this.fb.group({
      search: [null, Validators.required]
    });
    const subs = this.api.getHeaders(27).subscribe(questions => {
      this.ql = [];
      this.qc = [];
      this.qr = [];
      this.questions = questions;
      let k = 1;
      this.questions.forEach(el => {
        if (k<=9) {
          this.ql.push(el);
        };
        if (k>9&&k<=18) {
          this.qc.push(el);
        }
        if (k>18) {
          this.qr.push(el);
        }
        k++;
      });
      this.loadingService.removeSubscription(subs);
    });
    this.loadingService.addSubscription(subs);
  }

  showAnswer(id){
    const modal = this.ms.open(AnswerPageComponent, {centered: true, size: 'lg'});
      modal.componentInstance.id = id;
      modal.result.then((res)=>{
        //this.closeResult = res;
      });
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
