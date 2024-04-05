struct NagaConstants {
    int first_vertex;
    int first_instance;
    uint other;
};
ConstantBuffer<NagaConstants> _NagaConstants: register(b0, space1);

struct Struct {
    uint64_t atomic_scalar;
    uint64_t atomic_arr[2];
};

RWByteAddressBuffer storage_atomic_scalar : register(u0);
RWByteAddressBuffer storage_atomic_arr : register(u1);
RWByteAddressBuffer storage_struct : register(u2);

[numthreads(2, 1, 1)]
void cs_main(uint3 id : SV_GroupThreadID)
{
    uint64_t _e_discard1; storage_atomic_scalar.InterlockedMax(0, 1uL, _e_discard1);
    uint64_t _e_discard4; storage_atomic_arr.InterlockedMax(8, 1uL, _e_discard4);
    uint64_t _e_discard7; storage_struct.InterlockedMax(0, 1uL, _e_discard7);
    uint64_t _e_discard11; storage_struct.InterlockedMax(8+8, 1uL, _e_discard11);
    GroupMemoryBarrierWithGroupSync();
    uint64_t _e_discard13; storage_atomic_scalar.InterlockedMin(0, 1uL, _e_discard13);
    uint64_t _e_discard16; storage_atomic_arr.InterlockedMin(8, 1uL, _e_discard16);
    uint64_t _e_discard19; storage_struct.InterlockedMin(0, 1uL, _e_discard19);
    uint64_t _e_discard23; storage_struct.InterlockedMin(8+8, 1uL, _e_discard23);
    return;
}
