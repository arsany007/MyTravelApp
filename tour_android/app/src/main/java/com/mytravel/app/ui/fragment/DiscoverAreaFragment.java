package com.mytravel.app.ui.fragment;


import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.MapsInitializer;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.mytravel.app.R;
import com.mytravel.app.ui.activity.NavigationActivity;

/**
 * A simple {@link Fragment} subclass.
 */
public class DiscoverAreaFragment extends Fragment implements OnMapReadyCallback{

    private GoogleMap mMap;
    private MapView mapView;

    public DiscoverAreaFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_discover_area, container, false);
        mapView = view.findViewById(R.id.map_discover);

        if (mapView != null){

            mapView.onCreate(null);
            mapView.onResume();
            mapView.getMapAsync(this);

        }

        ((NavigationActivity)getActivity()).setActionBarTitle("DiscoverArea");
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
