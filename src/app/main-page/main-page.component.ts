import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'main-page',
  templateUrl: './main-page.component.html',
  styleUrls: ['./main-page.component.less']
})
export class MainPageComponent implements OnInit {
  public faqs1 = [
    'Как перевестись на бюджет?',
    'Когда мне выделят место в общежитии?',
    'Что такое ФЭФ, ПМиИТ и ФФР?'
  ];
  public faqs2 = [
    'Хочу развиваться и вне учебы. Куда идти?',
    'А с ноутбуком можно?',
    'Где найти актуальную информацию?'
  ];
  constructor() { }

  ngOnInit() {
  }

}
