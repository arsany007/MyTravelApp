package com.mytravel.app.ui.adapter;

import android.content.Context;
import android.databinding.DataBindingUtil;
import android.support.annotation.NonNull;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.mytravel.app.R;
import com.mytravel.app.databinding.ItemRowTourBinding;
import com.mytravel.app.ui.fragment.TourDetailFragment;

public class TourAdapter extends RecyclerView.Adapter<TourAdapter.TourHolder>{

    private Context context;

    public TourAdapter(Context context) {
        this.context = context;
    }

    @NonNull
    @Override
    public TourHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {

        View view = LayoutInflater.from(context).inflate(R.layout.item_row_tour,viewGroup,false);

        return new TourHolder(view);

    }

    @Override
    public void onBindViewHolder(@NonNull TourHolder tourHolder, int i) {

        tourHolder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                AppCompatActivity activity = (AppCompatActivity) view.getContext();
                activity.getSupportFragmentManager().beginTransaction().replace(R.id.fragment_container,new TourDetailFragment()).addToBackStack("").commit();

            }
        });
    }

    @Override
    public int getItemCount() {
        return 2;
    }

    public static class TourHolder extends RecyclerView.ViewHolder{

        private ItemRowTourBinding mBinding;

        public TourHolder(@NonNull View itemView) {
            super(itemView);

            mBinding = DataBindingUtil.bind(itemView);

        }
    }
}
