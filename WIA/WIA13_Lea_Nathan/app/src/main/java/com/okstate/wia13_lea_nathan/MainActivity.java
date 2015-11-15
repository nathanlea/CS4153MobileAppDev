package com.okstate.wia13_lea_nathan;

import android.graphics.Point;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Display;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity implements View.OnTouchListener {

    ImageView imageView;
    float x, y, dx, dy;
    long lastClick = 0;
    Display display;
    Point size;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        display = getWindowManager().getDefaultDisplay();
        size = new Point();
        display.getSize(size);

        imageView = (ImageView)findViewById(R.id.imageView);
        imageView.setOnTouchListener( this );
    }
//http://stackoverflow.com/questions/14814542/moving-imageview-with-touch-event
    public boolean onTouch(View v, MotionEvent event) {
        switch(event.getAction()) {
            case MotionEvent.ACTION_DOWN : {
                x = event.getX();
                y = event.getY();

                dx = x - imageView.getX();
                dy = y - imageView.getY();
            } break;
            case MotionEvent.ACTION_MOVE : {
                imageView.setX(event.getX() - dx);
                imageView.setY(event.getY()-dy);
            } break;
            case MotionEvent.ACTION_UP : {
                if( System.currentTimeMillis() - lastClick < 350 ) {
                    imageView.setX((size.x / 2) - imageView.getWidth()/2);
                    imageView.setY((size.y / 2) - imageView.getHeight());
                }
                lastClick = System.currentTimeMillis();

            } break;
            default: break;
        }
        return true;
    }
}
