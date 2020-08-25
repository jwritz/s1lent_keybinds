<template>
    <div class="flex text-center command pb-1 pt-1 mr-1 ml-1">
        <div class="w-1/3">{{ description }}</div>
        <div class="w-1/3">{{ command }}</div>
        <div class="w-1/3">{{ args }}</div>
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
        command: {
            type: String,
            required: true,
        },
        args: {
            type: String,
            required: true,
        },
    },
}
</script>