package android.src.main;

import android.content.Context;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class FlutterToast2018Plugin implements MethodChannel.MethodCallHandler {
    private final Context mContext;

    public FlutterToast2018Plugin(Context mContext) {
        this.mContext = mContext;
    }

    public static void registerWith(PluginRegistry.Registrar registrar){
        final MethodChannel channel = new MethodChannel(registrar.messenger(),"example.com/flutter_toast2018");
        channel.setMethodCallHandler(new FlutterToast2018Plugin(registrar.context()));


    }
    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        // call.method 是方法名，这里我们就叫它 toast
        if (call.method.equals("toast")) {
            // 调用本地代码的时候，只能传递一个参数。为了传递多个，可以把参数放在一个 map 里面。
            // call.arguemnt() 方法支持 Map 和 JSONObject
            String content = call.argument("content");
            String duration = call.argument("duration");
            Toast.makeText(mContext, content,
                    "short".equals(duration) ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG)
                    .show();
            // 执行成功
            result.success(true);
        } else {
            result.notImplemented();
        }
    }
}
