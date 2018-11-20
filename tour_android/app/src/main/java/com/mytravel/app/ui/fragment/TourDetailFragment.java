package com.mytravel.app.ui.fragment;


import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.mytravel.app.R;
import com.mytravel.app.ui.adapter.TourDetailSliderAdapter;

/**
 * A simple {@link Fragment} subclass.
 */
public class TourDetailFragment extends Fragment {

    private TextView tv_locname,tv_hour,tv_desc;
    private ImageView img_playpause;
    private RecyclerView recyclerView;
    private TourDetailSliderAdapter adapter;

    public TourDetailFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_tour_detail, container, false);

        tv_locname = view.findViewById(R.id.tv_locname);
        tv_hour = view.findViewById(R.id.tv_openinghour);
        tv_desc = view.findViewById(R.id.tv_desc);
        recyclerView = view.findViewById(R.id.rv_tourimg);

        recyclerView.setLayoutManager(new LinearLayoutManager(getContext(),LinearLayout.HORIZONTAL,false));

        adapter = new TourDetailSliderAdapter(getContext());
        recyclerView.setAdapter(adapter);

        return view;

    }

}
