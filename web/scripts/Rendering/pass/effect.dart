import "dart:async";

import '../../loader/loader.dart';
import "../../random.dart";
import "../3d/three.dart" as THREE;
import '../renderer.dart';

class RenderEffect {
    String vertexShader;
    String fragmentShader;

    Map<String, THREE.ShaderUniform<dynamic>> uniforms = <String, THREE.ShaderUniform<dynamic>>{};

    RenderEffect(String this.vertexShader, String this.fragmentShader);

    /// For setting up things for the effect which need async time, like loading a special texture or whatever
    Future<Null> loadAsyncAssets() async {}
}

class RenderEffectNullGlitch extends RenderEffect {
    static Random rand = new Random();

    RenderEffectNullGlitch() : super("shaders/image.vert", "shaders/nullglitch.frag") {
        this.uniforms["seed"] = new THREE.ShaderUniform<double>()..value = rand.nextDouble();
    }
}

class RenderEffectStardustGlitch extends RenderEffect {
    static bool _dataloaded = false;

    RenderEffectStardustGlitch({double strength = 1.0, int scale = 2, int ox = 4, int oy = -2}) : super("shaders/image.vert", "shaders/stardustglitch.frag") {
        this.uniforms["strength"] = new THREE.ShaderUniform<double>()..value = strength;
        this.uniforms["mask"] = new THREE.ShaderUniform<THREE.TextureBase>();
        this.uniforms["data"] = new THREE.ShaderUniform<THREE.TextureBase>();
        this.uniforms["datasize"] = new THREE.ShaderUniform<THREE.Vector2>()..value = new THREE.Vector2(256, 256);
        this.uniforms["scale"] = new THREE.ShaderUniform<int>()..value = scale;
        this.uniforms["offset"] = new THREE.ShaderUniform<THREE.Vector2>()..value = new THREE.Vector2(ox, oy);
    }

    @override
    Future<Null> loadAsyncAssets() async {
        if (!_dataloaded) {
            this.uniforms["data"].value = Renderer.getCachedTextureNearest(await Loader.getResource("shaders/stardustglitch.png"))..wrapT=THREE.RepeatWrapping..wrapS=THREE.RepeatWrapping;
            print("load?");
            _dataloaded = true;
        }
    }
}