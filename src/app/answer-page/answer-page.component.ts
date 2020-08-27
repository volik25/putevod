import { Component, OnInit, Input } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { ApiService } from '../services/api.service';
import { Question } from '../models/questions';
import { LoadingService } from '../services/loading.service';

@Component({
  selector: 'answer-page',
  templateUrl: './answer-page.component.html',
  styleUrls: ['./answer-page.component.less']
})
export class AnswerPageComponent implements OnInit {
  @Input() id: number;
  question: Question;
  constructor(public activeModal: NgbActiveModal, private api: ApiService, private loadingService: LoadingService) { }

  ngOnInit() {
    const subs = this.api.getQuestion(this.id).subscribe(question => {
      this.question = question;
      this.loadingService.removeSubscription(subs);
    })
    this.loadingService.addSubscription(subs);
  }

}
