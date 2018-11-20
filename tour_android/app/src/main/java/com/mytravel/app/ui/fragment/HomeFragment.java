package com.mytravel.app.ui.fragment;


import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toolbar;

import com.mytravel.app.R;
import com.mytravel.app.ui.activity.NavigationActivity;
import com.mytravel.app.ui.adapter.TripAdapter;

/**
 * A simple {@link Fragment} subclass.
 */
public class HomeFragment extends Fragment {


    private RecyclerView recyclerView;
    private TripAdapter adapter;

    public HomeFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_home, container, false);
        recyclerView = view.findViewById(R.id.rv_dashboard);

        ((NavigationActivity)getActivity()).setActionBarTitle("DashBoard");

        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));

        adapter = new TripAdapter(getContext());
        recyclerView.setAdapter(adapter);

        return view;

    }

}
