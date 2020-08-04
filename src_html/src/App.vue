<template>
    <div id="app">
        <div v-if="visible" class="flex justify-center items-center w-screen h-screen" @click.self="closeUI(true)">
            <div class="w-1/2 p-2 bg-gray-500 bg-opacity-75 shadow-2xl rounded relative" style="height: 60%;">
                <svg class="absolute right-0 top-0 m-1 cursor-pointer" @click="closeUI(true)" width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd">
                    <path d="M12 11.293l10.293-10.293.707.707-10.293 10.293 10.293 10.293-.707.707-10.293-10.293-10.293 10.293-.707-.707 10.293-10.293-10.293-10.293.707-.707 10.293 10.293z"/>
                </svg>
                <div class="flex mb-1 text-center">
                    <div class="w-1/2">Name</div>
                    <div class="w-1/2">Keybind</div>
                </div>
                <div class="overflow-y-auto" style="height: 94%">
                    <keybind v-for="(keybind, name) in keybinds" :key="name" :name="name" :keybind="keybind"></keybind>
                    <div v-if="keybindsLength == 0" class="flex text-center bg-gray-400 bg-opacity-75 pb-1 pt-1">
                        <div class="w-full">No keybinds</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Keybind from './components/Keybind';
import Nui from './utils/Nui';

export default {
    name: 'app',
    components: {
        Keybind,
    },
    data() {
        return {
            keybinds: {},
            visible: false,
        };
    },
    destroyed() {
        window.removeEventListener('message', this.listener);
    },
    mounted() {
        this.listener = window.addEventListener(
        'message',
        event => {
            const item = event.data || event.detail;
            if (this[item.type]) {
                this[item.type](item);
            }
        },
        false,
        );
    },
    computed: {
        keybindsLength: function (){
            return Object.keys(this.keybinds).length;
        },
    },
    methods: {
        setUIVisible(item) {
            if (item.bool) {
                this.keybinds = item.keybinds;
                this.openUI();
            } else {
                this.closeUI(false);
            }
        },
        openUI() {
            this.visible = true;
        },
        closeUI(isFromUI) {
            this.visible = false;
            if (isFromUI) {
                Nui.send('closeUI');
            }
        },
    },
};
</script>

<style lang="scss">
    /* width */
    ::-webkit-scrollbar {
        width: .5em;
    }

    /* Track */
    ::-webkit-scrollbar-track {
        background: rgba(185, 185, 185, 0.75);
    }

    /* Handle */
    ::-webkit-scrollbar-thumb {
        background:rgba(68, 68, 68, 0.75);
    }

    /* Handle on hover */
    ::-webkit-scrollbar-thumb:hover {
        background: rgba(19, 19, 19, 0.75);
    }
/* Want nice animations? Check out https://github.com/asika32764/vue2-animate */
/* @import 'https://unpkg.com/vue2-animate/dist/vue2-animate.min.css'; */
</style>
