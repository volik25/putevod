import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ApiService } from '../services/api.service';
import { Question } from '../models/questions';
import { AnswerPageComponent } from '../answer-page/answer-page.component';

@Component({
  selector: 'search-page',
  templateUrl: './search-page.component.html',
  styleUrls: ['./search-page.component.less']
})
export class SearchPageComponent implements OnInit {
  public ql:Question;
  public qc:Question;
  public qr:Question;
  
  constructor(public ms: NgbModal, private api: ApiService) { }

  ngOnInit() {
    this.api.getHeaders().subscribe(questions => {
      this.ql = questions;
    })
  }

  showAnswer(id){
    const modal = this.ms.open(AnswerPageComponent, {centered: true, size: 'lg'});
      modal.componentInstance.id = id;
      modal.result.then((res)=>{
        //this.closeResult = res;
      });
  }
}
