#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>

#include "amlogic_ui.h"

int num_keys;
KeyMapItem_t* keys_map;

KeyMapItem_t g_default_keymap[3] = {
    { "select", KEY_ENTER, {KEY_ENTER, KEY_TAB, KEY_BACK, -1, -1, -1} },
    { "down", KEY_DOWN, {KEY_DOWN, KEY_VOLUMEDOWN, KEY_PAGEDOWN, -1, -1, -1} },
    { "up", KEY_UP, {KEY_UP, KEY_VOLUMEUP, KEY_PAGEUP, -1, -1, -1} },
};

CtrlInfo_t g_ctrlinfo[3] = {
    { "select", KEY_ENTER },
    { "down", KEY_DOWN },
    { "up", KEY_UP },
};

static KeyMapItem_t g_presupposed_keymap[] = {
    { "select", -4, {BTN_MOUSE, BTN_LEFT, -1, -1, -1, -1} }
};

#define NUM_PRESUPPOSED_KEY_MAP (sizeof(g_presupposed_keymap) / sizeof(g_presupposed_keymap[0]))


int getKey(char *key) {

    if (key == NULL) {
        return -1;
    }

    unsigned int i;
    for (i = 0; i < NUM_CTRLINFO; i++) {
        CtrlInfo_t *info = &g_ctrlinfo[i];
        if (strcmp(info->type, key) == 0) {
            return info->value;
        }
    }
    return -1;
}

void load_key_map() {
    FILE* fstab = fopen("/etc/recovery.kl", "r");
    if (fstab != NULL) {
        printf("loaded /etc/recovery.kl\n");
        int alloc = 2;
        keys_map = (KeyMapItem_t*)malloc(alloc * sizeof(KeyMapItem_t));

        keys_map[0].type = "down";
        keys_map[0].value = KEY_DOWN;
        keys_map[0].key[0] = -1;
        keys_map[0].key[1] = -1;
        keys_map[0].key[2] = -1;
        keys_map[0].key[3] = -1;
        keys_map[0].key[4] = -1;
        keys_map[0].key[5] = -1;
        num_keys = 0;

        char buffer[1024];
        int i;
        int value = -1;
        while (fgets(buffer, sizeof(buffer)-1, fstab)) {
            for (i = 0; buffer[i] && isspace(buffer[i]); ++i);

            if (buffer[i] == '\0' || buffer[i] == '#') continue;

            char* original = strdup(buffer);

            char* type = strtok(original+i, " \t\n");
            char* key1 = strtok(NULL, " \t\n");
            char* key2 = strtok(NULL, " \t\n");
            char* key3 = strtok(NULL, " \t\n");
            char* key4 = strtok(NULL, " \t\n");
            char* key5 = strtok(NULL, " \t\n");
            char* key6 = strtok(NULL, " \t\n");

            value = getKey(type);
            if (type && key1 && (value > 0)) {
                while (num_keys >= alloc) {
                    alloc *= 2;
                    keys_map = (KeyMapItem_t*)realloc(keys_map, alloc*sizeof(KeyMapItem_t));
                }
                keys_map[num_keys].type = strdup(type);
                keys_map[num_keys].value = value;
                keys_map[num_keys].key[0] = key1?atoi(key1):-1;
                keys_map[num_keys].key[1] = key2?atoi(key2):-1;
                keys_map[num_keys].key[2] = key3?atoi(key3):-1;
                keys_map[num_keys].key[3] = key4?atoi(key4):-1;
                keys_map[num_keys].key[4] = key5?atoi(key5):-1;
                keys_map[num_keys].key[5] = key6?atoi(key6):-1;

                ++num_keys;
            } else {
                printf("skipping malformed recovery.lk line: %s\n", original);
            }
            free(original);
        }

        fclose(fstab);
    } else {
        printf("failed to open /etc/recovery.kl, use default map\n");
        num_keys = NUM_DEFAULT_KEY_MAP;
        keys_map = g_default_keymap;
    }

    printf("recovery key map table:\n");
    int i;
    for (i = 0; i < num_keys; ++i) {
        KeyMapItem_t* v = &keys_map[i];
        printf("  %d type:%s value:%d key:%d %d %d %d %d %d\n", i, v->type, v->value,
              v->key[0], v->key[1], v->key[2], v->key[3], v->key[4], v->key[5]);
    }
    printf("\n");
}

int getMapKey(int key) {
    int i,j;
    for (i = 0; i < num_keys; i++) {
        KeyMapItem_t* v = &keys_map[i];
        for (j = 0; j < 6; j++) {
            if (v->key[j] == key)
                return v->value;
        }
    }

    for (i = 0; i < (int)NUM_PRESUPPOSED_KEY_MAP; i++) {
        for (j = 0; j < 6; j++) {
            if (g_presupposed_keymap[i].key[j] == key)
                return g_presupposed_keymap[i].value;
        }
    }

    return -1;
}

