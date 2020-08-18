<template>
    <div class="flex text-center bg-gray-200 bg-opacity-75 hover:bg-gray-100 pb-1 pt-1 mr-1 ml-1">
        <div class="w-1/2">{{ description }}</div>
        <div class="w-1/2">{{ curKeybind }}</div>
    </div>
</template>

<script>
export default {
    name:'Keybind',
    props: {
        description: {
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