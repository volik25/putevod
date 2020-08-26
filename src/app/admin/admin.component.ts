import { Component, OnInit } from '@angular/core';
import { ApiService } from '../services/api.service';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { Question } from '../models/questions';
import { Observable, of, Subscription } from 'rxjs';
import { LoadingService } from '../services/loading.service';

@Component({
  selector: 'admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.less']
})
export class AdminComponent implements OnInit {
  addForm:FormGroup;
  public subs: Subscription = new Subscription()
  description = '';
  questions: Question[];
  item: Question;
  public Editor = ClassicEditor;
  public config = {
    language: 'ru',
    toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote' ]
  };
  public model = {
    editorData: this.description
  };
  constructor(private api: ApiService, private auth: AuthService, private router: Router, private fb: FormBuilder, 
              private loadingService: LoadingService) { }

  ngOnInit() {
    this.api.getQuestions().subscribe(questions => {
      this.questions = questions;
    })
    this.initForm();
  }

  public initForm(){
    this.addForm = this.fb.group({
      question:[null, Validators.required],
      answer:[null, Validators.required],
      img: [null],
      isFAQ: [false],
      isFAQuestion: [null]
    })
  }

  public setForm(id){
    if (id == 0) {
      this.addForm.reset();
      this.item = null;
    }
    else{
      this.item = this.questions.find(x => x.id == id);
      this.addForm.patchValue(this.item);
    }
  }

  public onReady( editor ) {
    editor.ui.getEditableElement().parentElement.insertBefore(
        editor.ui.view.toolbar.element,
        editor.ui.getEditableElement()
    );
  }

  removeImg() {
    this.addForm.get('img').setValue(null);
  }

  isUploadFileShown() {
    const value = this.addForm.get('img').value;
    return !value || value instanceof File;
  }

  save(){
    const form = this.addForm.getRawValue();
    this.subs = this.uploadCarImg(form.img).subscribe((data) => {
      console.log(data);
      form.img = data;
      if (this.item) {
        form.id = this.item.id;
        form.oldImg = this.item.img;
        const subscription = this.api.updateQuestion(form).subscribe(() => {
          this.loadingService.removeSubscription(subscription);
        });
        this.loadingService.addSubscription(subscription);
      } else {
        const subscription = this.api.addQuestion(form).subscribe((id) => {
          form.id = id
          this.questions.push(form);
          this.initForm();
          this.loadingService.removeSubscription(subscription);
        });
        this.loadingService.addSubscription(subscription);
      }
      this.loadingService.removeSubscription(this.subs);
    });
    this.loadingService.addSubscription(this.subs);
  }

  uploadCarImg(img): Observable<string> {
    if (img instanceof File) {
      const formData = new FormData();
      formData.append('qImage', img, img.name.replace(' ', '_'));
      return this.api.uploadImg(formData);
    } else {
      return of(img);
    }
  }

  public exit() {
    this.auth.exit();
    this.router.navigate(['/enter-form']);
  }

}
