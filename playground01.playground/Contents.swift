import MetalKit
import PlaygroundSupport

guard let gpu_device = MTLCreateSystemDefaultDevice() else {
    fatalError("GPU is not supported")
}

let frame = CGRect(x: 0, y: 0, width: 600, height: 600)
let view = MTKView(frame: frame, device: gpu_device)
view.clearColor = MTLClearColor(red: 1, green: 1, blue: 0.8, alpha: 1)

// memory allocation
let allocator = MTKMeshBufferAllocator(device: gpu_device)

// set data
let mdlMesh = MDLMesh(sphereWithExtent: [0.75, 0.75, 0.75], segments: [100, 100], inwardNormals: false, geometryType: .triangles, allocator: allocator)

// metal uses mktmesh, converted from a model i/o model
let mesh = try MTKMesh(mesh: mdlMesh, device: gpu_device)

// queue
