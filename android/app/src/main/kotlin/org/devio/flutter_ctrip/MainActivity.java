package org.devio.flutter_ctrip;


import org.devio.flutter.plugin.asr.AsrPlugin;
import org.jetbrains.annotations.NotNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

/**
 * 界面描述：
 * <p>
 * Created by tianyang on 2020/5/13.
 */
public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NotNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        registerSelfPlugin(flutterEngine);
    }

    private void registerSelfPlugin(FlutterEngine flutterEngine) {
        ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
        AsrPlugin.registerWith(shimPluginRegistry.registrarFor("org.devio.flutter.plugin.asr.AsrPlugin"));
    }
}
