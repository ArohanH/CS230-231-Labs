#include "cache.h"
#include <algorithm>
#include <array>
#include <map>
#include <optional>
#include <vector>
#include<cmath>
using namespace std;
#include <iostream>



namespace{
   
struct tracker{   
   struct stream_trackers{
    uint64_t X = 0;           // the IP we're tracking
    uint64_t Y = 0; // the last address accessed by this IP
    uint64_t Z = 0;   // the stride between the last two addresses accessed by this IP
    uint64_t start_addr = 0;
    uint64_t end_addr = 0;
    int64_t stream_direction=0;
    uint64_t time_cycle=0;
    //auto index() const { return X; }
    //auto tag() const { return X; }
    };
        constexpr static std::size_t STREAM_TABLE_SIZE = 64;
        uint64_t PREFETCH_DISTANCE = 512;
        uint64_t PREFETCH_DEGREE = 3;
        std::vector<stream_trackers> table;
  public:
    void func(uint64_t address, CACHE* cache){
      int x=0;
      int j=-1;
      for(int i=0;i<table.size();i++){
        if(table[i].stream_direction == 1){
          if(address>=table[i].start_addr && address<=table[i].end_addr){
            x++;
            j=i;
            table[i].time_cycle++;
            for(int p=0; p<PREFETCH_DEGREE;p++){
                  uint64_t pf_address=static_cast<uint64_t>(static_cast<int64_t>(table[i].end_addr)+static_cast<int64_t>(p+1)*table[i].stream_direction);
                  pf_address = pf_address << LOG2_BLOCK_SIZE;
                  bool success = cache->prefetch_line(pf_address, (cache->get_mshr_occupancy_ratio() < 1.0), 0);
                }
                table[i].start_addr=static_cast<uint64_t>(static_cast<int64_t>(table[i].start_addr)+static_cast<int64_t>(PREFETCH_DEGREE)*table[i].stream_direction);
                table[i].end_addr=static_cast<uint64_t>(static_cast<int64_t>(table[i].end_addr)+static_cast<int64_t>(PREFETCH_DEGREE)*table[i].stream_direction);
                break;     
          }        
        }
        else if(table[i].stream_direction == -1){
          if(address<=table[i].start_addr && address>=table[i].end_addr){
            x++;
            j=i;
            table[i].time_cycle++;
            for(int p=0; p<PREFETCH_DEGREE;p++){
                  uint64_t pf_address=static_cast<uint64_t>(static_cast<int64_t>(table[i].end_addr)+static_cast<int64_t>(p+1)*table[i].stream_direction);
                  pf_address = pf_address << LOG2_BLOCK_SIZE;
                  bool success = cache->prefetch_line(pf_address, (cache->get_mshr_occupancy_ratio() < 1.0), 0);
                }
                table[i].start_addr=static_cast<uint64_t>(static_cast<int64_t>(table[i].start_addr)+static_cast<int64_t>(PREFETCH_DEGREE)*table[i].stream_direction);
                table[i].end_addr=static_cast<uint64_t>(static_cast<int64_t>(table[i].end_addr)+static_cast<int64_t>(PREFETCH_DEGREE)*table[i].stream_direction);
                break;     
          }
        }
      }
      if(x==0){
        for(int i=0; i<table.size();i++){
          if(table[i].Z==0 && table[i].Y!=0){
            table[i].time_cycle++;
            if(table[i].stream_direction == 1){
              if(table[i].Y<address && address<(table[i].X+PREFETCH_DISTANCE)){
                x++;
                j=i;
                table[i].Z=address;
                table[i].start_addr=table[i].X;
                table[i].end_addr=static_cast<uint64_t>(static_cast<int64_t> (table[i].X)+table[i].stream_direction*PREFETCH_DISTANCE);
                break;     
              }
            }
            else if(table[i].stream_direction == -1){
              if(table[i].Y>address && address>(table[i].X-PREFETCH_DISTANCE)){
                x++;
                j=i;
                table[i].Z=address;
                table[i].start_addr=table[i].X;
                table[i].end_addr=static_cast<uint64_t>(static_cast<int64_t> (table[i].X)+table[i].stream_direction*PREFETCH_DISTANCE);
                break;     
              }
            }
          }  
        }
      }
      if(x==0){
        for(int i=0; i<table.size();i++){
            if(table[i].Y==0 && table[i].X!=0){
                table[i].time_cycle++;
                if(table[i].stream_direction == 0){
                    if(address<(table[i].X+PREFETCH_DISTANCE)){
                        x++;
                        j=i;
                        table[i].Y=address;
                        table[i].stream_direction=1;
                        break;     
                    }
                    else if(address>(table[i].X-PREFETCH_DISTANCE)){
                        x++;
                        j=i;
                        table[i].Y=address;
                        table[i].stream_direction=-1;
                        break;
                    }
                }  
            }
        }    
      }
      if(j==-1){
        stream_trackers new_stream;
        new_stream.X=address;
        if(table.size()==64){
            uint64_t min_LRU=0;
            for(int i=0; i<table.size(); i++){
            //    std::cout << "c";
                min_LRU=min(table[i].time_cycle,min_LRU);
            }
            table.erase(table.begin()+min_LRU);
        }
        new_stream.time_cycle++;
        table.push_back(new_stream);
      } 
    }
};
        std::map<CACHE*, tracker> trackers;
}


void CACHE::prefetcher_initialize() {}

uint32_t CACHE::prefetcher_cache_operate(uint64_t addr, uint64_t ip, uint8_t cache_hit, bool useful_prefetch, uint8_t type, uint32_t metadata_in)
{
  //uint64_t pf_addr = addr + (1 << LOG2_BLOCK_SIZE);
  //prefetch_line(pf_addr, true, metadata_in);
  //return metadata_in;
    if(cache_hit==0){
      uint64_t address=(addr >> LOG2_BLOCK_SIZE); 
      trackers[this].func(address,this);
    }
  
  return metadata_in;

}

uint32_t CACHE::prefetcher_cache_fill(uint64_t addr, uint32_t set, uint32_t way, uint8_t prefetch, uint64_t evicted_addr, uint32_t metadata_in)
{
  return metadata_in;
}

void CACHE::prefetcher_cycle_operate() {}

void CACHE::prefetcher_final_stats() {}