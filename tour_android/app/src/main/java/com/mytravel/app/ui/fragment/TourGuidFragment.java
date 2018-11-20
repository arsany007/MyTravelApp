package com.mytravel.app.ui.fragment;


import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Switch;
import android.widget.TextView;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.MapsInitializer;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.mytravel.app.R;
import com.mytravel.app.ui.activity.NavigationActivity;
import com.mytravel.app.ui.adapter.TourAdapter;

/**
 * A simple {@link Fragment} subclass.
 */
public class TourGuidFragment extends Fragment implements OnMapReadyCallback{

    private TextView tv_city,tv_about;
    private MapView mapView;
    private GoogleMap mMap;
    private Switch aSwitch;
    private RecyclerView recyclerView;
    private TourAdapter adapter;


    public TourGuidFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_tour_guid, container, false);
        mapView = view.findViewById(R.id.map_tour);
        recyclerView = view.findViewById(R.id.rv_tour);
        tv_city = view.findViewById(R.id.tv_tour_city);
        tv_about = view.findViewById(R.id.tv_aboutcity);
        aSwitch = view.findViewById(R.id.switch_guidmode);

        if (mapView != null){

            mapView.onCreate(null);
            mapView.onResume();
            mapView.getMapAsync(this);

        }

        ((NavigationActivity)getActivity()).setActionBarTitle("Tour Guide");


        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));

        adapter = new TourAdapter(getContext());
        recyclerView.setAdapter(adapter);

        return view;

    }

    @Override
    public void onMapReady(GoogleMap googleMap) {

        MapsInitializer.initialize(getContext());
        mMap = googleMap;

        LatLng sydney = new LatLng(-34, 151);
        mMap.addMarker(new MarkerOptions().position(sydney).title("Marker in Sydney"));
        mMap.moveCamera(CameraUpdateFactory.newLatLng(sydney));

    }
}
