package com.mytravel.app.ui.adapter;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v4.view.PagerAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.mytravel.app.R;
import com.mytravel.app.ui.model.ImageSliderModel;

import java.util.ArrayList;

public class ViewPagerProfileAdapter extends PagerAdapter{

    private LayoutInflater inflater;
    private Context context;
    private ArrayList<ImageSliderModel> list = new ArrayList<>();


    public ViewPagerProfileAdapter(Context context,ArrayList<ImageSliderModel> list) {
        this.context = context;
        this.list = list;
        inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    @Override
    public int getCount() {
        return list.size();
    }

    @Override
    public boolean isViewFromObject(@NonNull View view, @NonNull Object o) {
        return view.equals(o);
    }

    @Override
    public Object instantiateItem(ViewGroup container, int position) {

        View view = inflater.inflate(R.layout.layout_profilepic,container,false);
        ImageView imageView = view.findViewById(R.id.img_profilePic);
        imageView.setImageResource(list.get(position).getImage());
        container.addView(view,0);
        return view;
    }


    @Override
    public void destroyItem(ViewGroup container, int position, Object object) {

        View view = (View) object;
        container.removeView(view);
    }
}
