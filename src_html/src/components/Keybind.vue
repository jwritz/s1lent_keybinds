<template>
    <div class="flex text-center bg-gray-400 bg-opacity-75 hover:bg-gray-300 pb-1 pt-1">
        <div class="w-1/2">{{ name }}</div>
        <div class="w-1/2">{{ curKeybind }}</div>
    </div>
</template>

<script>
export default {
    name:'Keybind',
    props: {
        name: {
            type: String,
            required: true,
        },
        keybind: {
            type: String,
            required: true,
        }
    },
    data() {
        return {
            curKeybind: ''
        }
    },
    created() {
        this.curKeybind = this.keybind;
    },
}
</script>