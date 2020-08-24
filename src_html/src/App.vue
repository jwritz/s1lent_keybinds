<template>
    <div id="app">
        <div v-if="visible" class="flex justify-center items-center w-screen h-screen" @click.self="closeUI(true)">
            <div class="w-1/2 p-2 main-background shadow-2xl rounded relative" style="height: 60%;">
                <svg class="absolute right-0 top-0 m-1 cursor-pointer" @click="closeUI(true)" width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd">
                    <path d="M12 11.293l10.293-10.293.707.707-10.293 10.293 10.293 10.293-.707.707-10.293-10.293-10.293 10.293-.707-.707 10.293-10.293-10.293-10.293.707-.707 10.293 10.293z"/>
                </svg>
                <div class="overflow-y-auto pt-5" style="height: 94%" ref="categoryList">
                    <div v-for="category in keybinds" :key="category.category">
                        <div v-if="category.keys && category.keys.length > 0" class="shadow-lg m-1 mb-2 p-1 pb-2 rounded category-background">
                            <div class="flex text-left font-medium pb-1 ml-1">
                                <div>{{ category.category }} Keybinds</div>
                            </div>
                            <hr>
                            <div class="flex mb-1 text-center font-semibold">
                                <div class="w-1/2">Description</div>
                                <div class="w-1/2">Keybind</div>
                            </div>
                            <keybind v-for="keybind in category.keys" :key="keybind.description" :description="keybind.description" :keybind="keybind.key"></keybind>
                        </div>

                        <div v-if="category.commands && category.commands.length > 0" class="shadow-lg m-1 mb-2 p-1 pb-2 rounded category-background">
                            <div class="flex text-left font-medium pb-1 ml-1">
                                <div>{{ category.category }} Commands</div>
                            </div>
                            <hr>
                            <div class="flex mb-1 text-center font-semibold">
                                <div class="w-1/3">Description</div>
                                <div class="w-1/3">Command</div>
                                <div class="w-1/3">Arguments</div>
                            </div>
                            <command v-for="command in category.commands" :key="command.command" :description="command.description" :command="command.command" :args="command.arguments"></command>
                        </div>
                    </div>
                    <div v-if="keybindsLength == 0" class="flex text-center keybind pb-1 pt-1 mr-1 ml-1">
                        <div class="w-full">No keybinds or commands</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Keybind from './components/Keybind';
import Command from './components/Command';
import Nui from './utils/Nui';

export default {
    name: 'app',
    components: {
        Keybind, Command,
    },
    data() {
        return {
            keybinds: [],
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
        keybindsLength: function() {
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
