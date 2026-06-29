import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Snakey } from './snakey';

describe('Snakey', () => {
  let component: Snakey;
  let fixture: ComponentFixture<Snakey>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Snakey]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Snakey);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
