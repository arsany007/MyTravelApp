package com.mytravel.app.ui.fragment;


import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.Fragment;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.mytravel.app.R;
import com.mytravel.app.ui.activity.NavigationActivity;
import com.mytravel.app.ui.adapter.ViewPagerProfileAdapter;
import com.mytravel.app.ui.model.ImageSliderModel;
import com.viewpagerindicator.CirclePageIndicator;

import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;


/**
 * A simple {@link Fragment} subclass.
 */
public class ProfileFragment extends Fragment {

    private ViewPagerProfileAdapter adapter;
    private ViewPager viewpager;

    private static int currentPage = 0;
    private static int NUM_PAGES = 0;
    private ArrayList<ImageSliderModel> list_image = new ArrayList<>();
    private int[] myImage = {R.drawable.ic_profile1,R.drawable.ic_profile2};
    private CirclePageIndicator circlePageIndicator;

    public ProfileFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_profile, container, false);

        viewpager = view.findViewById(R.id.vp_profileImage);
        circlePageIndicator = view.findViewById(R.id.indicator);

        ((NavigationActivity)getActivity()).setActionBarTitle("Profile");

        list_image = new ArrayList<>();
        list_image = getImageList();

        adapter = new ViewPagerProfileAdapter(getContext(),list_image);
        viewpager.setAdapter(adapter);

        circlePageIndicator.setViewPager(viewpager);

        final float density = getResources().getDisplayMetrics().density;

        circlePageIndicator.setRadius(5 * density);

        NUM_PAGES =list_image.size();

        // Auto start of viewpager
        final Handler handler = new Handler();
        final Runnable Update = new Runnable() {
            public void run() {
                if (currentPage == NUM_PAGES) {
                    currentPage = 0;
                }
                viewpager.setCurrentItem(currentPage++, true);
            }
        };

        viewpager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {

            }

            @Override
            public void onPageSelected(int position) {
                currentPage = position;
            }

            @Override
            public void onPageScrollStateChanged(int state) {

            }
        });

        return view;
    }

    private ArrayList<ImageSliderModel> getImageList() {

        ArrayList<ImageSliderModel> list = new ArrayList<>();

        for (int i=0; i<2;i++){

            ImageSliderModel model = new ImageSliderModel();
            model.setImage(myImage[i]);
            list.add(model);

        }

        return list;

    }

}
