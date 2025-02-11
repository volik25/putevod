import { Component, OnInit } from '@angular/core';
import { ApiService } from '../services/api.service';
import { LoadingService } from '../services/loading.service';
import { BsModalService } from 'ngx-bootstrap/modal';
import { AnswerPageComponent } from '../answer-page/answer-page.component';

@Component({
  selector: 'main-page',
  templateUrl: './main-page.component.html',
  styleUrls: ['./main-page.component.less']
})
export class MainPageComponent implements OnInit {
  public faqsl = [];
  public faqsr = [];
  constructor(private api: ApiService, private loadService: LoadingService, private ms: BsModalService) { }

  ngOnInit() {
    const subs = this.api.getFAQs().subscribe(FAQs => {
      for (let i = 0; i < 3; i++) {
        const id = Math.floor(Math.random()*FAQs.length);
        this.faqsl.push(FAQs[id]);
        FAQs.splice(id, 1);
      }
      for (let i = 0; i < 3; i++) {
        const id = Math.floor(Math.random()*FAQs.length);
        this.faqsr.push(FAQs[id]);
        FAQs.splice(id, 1);
      }
      this.loadService.removeSubscription(subs);
    })
    this.loadService.addSubscription(subs);
  }

  showAnswer(id){
    const initialState = {
      id: id
    }
    const modal = this.ms.show(AnswerPageComponent, {initialState});
  }

  link(url){
    window.open(url);
  }
}
