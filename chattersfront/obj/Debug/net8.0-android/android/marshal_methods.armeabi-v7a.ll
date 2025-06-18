; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [341 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [676 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 261
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 295
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 336
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 217
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 279
	i32 117431740, ; 14: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 15: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 279
	i32 122350210, ; 16: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 17: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 299
	i32 142721839, ; 18: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 19: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 20: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 21: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 235
	i32 176265551, ; 22: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 23: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 281
	i32 184328833, ; 24: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 25: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 333
	i32 199333315, ; 26: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 334
	i32 205061960, ; 27: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 28: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 233
	i32 220171995, ; 29: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221063263, ; 30: Microsoft.AspNetCore.Http.Connections.Client => 0xd2d285f => 182
	i32 230216969, ; 31: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 255
	i32 230752869, ; 32: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 33: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 34: System.Globalization => 0xdd133ce => 42
	i32 244348769, ; 35: Microsoft.AspNetCore.Components.Authorization => 0xe907761 => 176
	i32 246610117, ; 36: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 254259026, ; 37: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 175
	i32 261689757, ; 38: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 238
	i32 276479776, ; 39: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 40: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 257
	i32 280482487, ; 41: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 254
	i32 280992041, ; 42: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 305
	i32 291076382, ; 43: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 44: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 45: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 333
	i32 318968648, ; 46: Xamarin.AndroidX.Activity.dll => 0x13031348 => 224
	i32 321597661, ; 47: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 48: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 318
	i32 342366114, ; 49: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 256
	i32 348048101, ; 50: Microsoft.AspNetCore.Http.Connections.Common.dll => 0x14becae5 => 183
	i32 356389973, ; 51: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 317
	i32 360082299, ; 52: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 53: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 54: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 55: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 56: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 57: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 58: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 59: _Microsoft.Android.Resource.Designer => 0x17969339 => 337
	i32 403441872, ; 60: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 61: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 329
	i32 441335492, ; 62: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 239
	i32 442565967, ; 63: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 64: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 252
	i32 451504562, ; 65: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 66: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 458494020, ; 67: Microsoft.AspNetCore.SignalR.Common.dll => 0x1b541044 => 187
	i32 459347974, ; 68: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 69: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 70: System.dll => 0x1bff388e => 164
	i32 476646585, ; 71: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 254
	i32 485463106, ; 72: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 207
	i32 486930444, ; 73: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 267
	i32 498788369, ; 74: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 75: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 316
	i32 503918385, ; 76: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 310
	i32 513247710, ; 77: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 206
	i32 526420162, ; 78: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 79: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 299
	i32 530272170, ; 80: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 81: Microsoft.Extensions.Logging => 0x20216150 => 202
	i32 540030774, ; 82: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 83: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 84: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 85: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 86: Jsr305Binding => 0x213954e7 => 292
	i32 569601784, ; 87: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 290
	i32 571435654, ; 88: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 199
	i32 577335427, ; 89: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 90: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 324
	i32 601371474, ; 91: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 92: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 93: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 94: Xamarin.AndroidX.CustomView => 0x2568904f => 244
	i32 627931235, ; 95: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 322
	i32 639843206, ; 96: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 250
	i32 643868501, ; 97: System.Net => 0x2660a755 => 81
	i32 662205335, ; 98: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 99: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 286
	i32 666292255, ; 100: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 231
	i32 672442732, ; 101: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 102: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 103: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 304
	i32 690569205, ; 104: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 105: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 301
	i32 693804605, ; 106: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 107: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 108: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 296
	i32 700358131, ; 109: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 110: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 319
	i32 709557578, ; 111: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 307
	i32 720511267, ; 112: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 300
	i32 722857257, ; 113: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 114: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 115: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 116: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 221
	i32 759454413, ; 117: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 118: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 119: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 120: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 328
	i32 789151979, ; 121: Microsoft.Extensions.Options => 0x2f0980eb => 205
	i32 790371945, ; 122: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 245
	i32 804008546, ; 123: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 180
	i32 804715423, ; 124: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 125: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 259
	i32 823281589, ; 126: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 127: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 128: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 832711436, ; 129: Microsoft.AspNetCore.SignalR.Protocols.Json.dll => 0x31a22b0c => 188
	i32 834051424, ; 130: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 131: Xamarin.AndroidX.Print => 0x3246f6cd => 272
	i32 873119928, ; 132: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 133: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 134: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 135: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 136: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 137: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 331
	i32 928116545, ; 138: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 295
	i32 952186615, ; 139: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 140: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 300
	i32 966729478, ; 141: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 293
	i32 967690846, ; 142: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 256
	i32 975236339, ; 143: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 144: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 145: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 146: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 147: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 148: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 149: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 201
	i32 1001831731, ; 150: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 151: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 276
	i32 1019214401, ; 152: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 153: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 195
	i32 1029334545, ; 154: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 306
	i32 1031528504, ; 155: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 294
	i32 1035644815, ; 156: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 229
	i32 1036536393, ; 157: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 158: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 159: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 263
	i32 1058641855, ; 160: Microsoft.AspNetCore.Http.Connections.Common => 0x3f1997bf => 183
	i32 1067306892, ; 161: GoogleGson => 0x3f9dcf8c => 173
	i32 1082857460, ; 162: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 163: Xamarin.Kotlin.StdLib => 0x409e66d8 => 297
	i32 1098259244, ; 164: System => 0x41761b2c => 164
	i32 1106973742, ; 165: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 192
	i32 1118262833, ; 166: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 319
	i32 1121599056, ; 167: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 262
	i32 1127624469, ; 168: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 204
	i32 1149092582, ; 169: Xamarin.AndroidX.Window => 0x447dc2e6 => 289
	i32 1168523401, ; 170: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 325
	i32 1170634674, ; 171: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 172: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 197
	i32 1175144683, ; 173: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 285
	i32 1178241025, ; 174: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 270
	i32 1203215381, ; 175: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 323
	i32 1204270330, ; 176: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 231
	i32 1208641965, ; 177: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 178: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1233093933, ; 179: Microsoft.AspNetCore.SignalR.Client.Core.dll => 0x497f852d => 186
	i32 1234928153, ; 180: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 321
	i32 1243150071, ; 181: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 290
	i32 1253011324, ; 182: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 183: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 305
	i32 1264511973, ; 184: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 280
	i32 1267360935, ; 185: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 284
	i32 1273260888, ; 186: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 236
	i32 1275534314, ; 187: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 301
	i32 1278448581, ; 188: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 228
	i32 1293217323, ; 189: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 247
	i32 1309188875, ; 190: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 191: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 289
	i32 1324164729, ; 192: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 193: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 194: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 195: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 335
	i32 1376866003, ; 196: Xamarin.AndroidX.SavedState => 0x52114ed3 => 276
	i32 1379779777, ; 197: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 198: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 199: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 240
	i32 1408764838, ; 200: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 201: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1414043276, ; 202: Microsoft.AspNetCore.Connections.Abstractions.dll => 0x5448968c => 181
	i32 1422545099, ; 203: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 204: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 303
	i32 1434145427, ; 205: System.Runtime.Handles => 0x557b5293 => 104
	i32 1434533169, ; 206: chattersfront => 0x55813d31 => 0
	i32 1435222561, ; 207: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 293
	i32 1439761251, ; 208: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 209: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 210: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 211: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 198
	i32 1457743152, ; 212: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 213: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 214: System.IdentityModel.Tokens.Jwt => 0x57137723 => 218
	i32 1461004990, ; 215: es\Microsoft.Maui.Controls.resources => 0x57152abe => 309
	i32 1461234159, ; 216: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 217: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 218: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 219: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 230
	i32 1470490898, ; 220: Microsoft.Extensions.Primitives => 0x57a5e912 => 206
	i32 1479771757, ; 221: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 222: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 223: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 224: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 277
	i32 1493001747, ; 225: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 313
	i32 1498168481, ; 226: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 208
	i32 1514721132, ; 227: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 308
	i32 1521091094, ; 228: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 201
	i32 1536373174, ; 229: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 230: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 231: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1546581739, ; 232: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 180
	i32 1550322496, ; 233: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 234: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 328
	i32 1565862583, ; 235: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 236: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 237: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 238: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 239: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 246
	i32 1592978981, ; 240: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 241: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 294
	i32 1601112923, ; 242: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 243: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 244: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 245: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 266
	i32 1622358360, ; 246: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 247: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 288
	i32 1632842087, ; 248: Microsoft.Extensions.Configuration.Json => 0x61533167 => 193
	i32 1635184631, ; 249: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 250
	i32 1636350590, ; 250: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 243
	i32 1639515021, ; 251: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 252: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 253: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 254: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 179
	i32 1657153582, ; 255: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 256: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 282
	i32 1658251792, ; 257: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 291
	i32 1670060433, ; 258: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 238
	i32 1675553242, ; 259: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 260: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 261: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 262: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 263: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 264: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 265: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 298
	i32 1701541528, ; 266: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 267: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 259
	i32 1726116996, ; 268: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 269: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 270: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 234
	i32 1736233607, ; 271: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 326
	i32 1743415430, ; 272: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 304
	i32 1744735666, ; 273: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 274: System.IO.Pipelines.dll => 0x68139a0d => 219
	i32 1746316138, ; 275: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 276: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 277: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 278: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 178
	i32 1763938596, ; 279: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 280: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 281: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 281
	i32 1770582343, ; 282: Microsoft.Extensions.Logging.dll => 0x6988f147 => 202
	i32 1776026572, ; 283: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 284: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 285: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 286: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 320
	i32 1788241197, ; 287: Xamarin.AndroidX.Fragment => 0x6a96652d => 252
	i32 1793755602, ; 288: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 312
	i32 1808609942, ; 289: Xamarin.AndroidX.Loader => 0x6bcd3296 => 266
	i32 1813058853, ; 290: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 297
	i32 1813201214, ; 291: Xamarin.Google.Android.Material => 0x6c13413e => 291
	i32 1818569960, ; 292: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 271
	i32 1818787751, ; 293: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 294: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 295: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 296: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 203
	i32 1842015223, ; 297: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 332
	i32 1847515442, ; 298: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 221
	i32 1853025655, ; 299: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 329
	i32 1858542181, ; 300: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 301: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 302: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 311
	i32 1879696579, ; 303: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 304: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 232
	i32 1888955245, ; 305: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 306: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 307: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 308: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 309: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 310: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1945717188, ; 311: Microsoft.AspNetCore.SignalR.Client.Core => 0x73f949c4 => 186
	i32 1956758971, ; 312: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 313: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 278
	i32 1967334205, ; 314: Microsoft.AspNetCore.SignalR.Common => 0x7543233d => 187
	i32 1968388702, ; 315: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 189
	i32 1983156543, ; 316: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 298
	i32 1985761444, ; 317: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 223
	i32 1986222447, ; 318: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 210
	i32 2003115576, ; 319: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 308
	i32 2011961780, ; 320: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 321: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 263
	i32 2025202353, ; 322: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 303
	i32 2031763787, ; 323: Xamarin.Android.Glide => 0x791a414b => 220
	i32 2045470958, ; 324: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 325: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 191
	i32 2055257422, ; 326: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 258
	i32 2060060697, ; 327: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 328: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 307
	i32 2070888862, ; 329: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 330: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 200
	i32 2079903147, ; 331: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 332: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 333: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 334: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 335: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 336: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 337: Microsoft.Maui => 0x80bd55ad => 215
	i32 2169148018, ; 338: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 315
	i32 2181898931, ; 339: Microsoft.Extensions.Options.dll => 0x820d22b3 => 205
	i32 2192057212, ; 340: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 203
	i32 2192166651, ; 341: Microsoft.AspNetCore.Components.Authorization.dll => 0x82a9cefb => 176
	i32 2193016926, ; 342: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 343: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 302
	i32 2201231467, ; 344: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 345: it\Microsoft.Maui.Controls.resources => 0x839595db => 317
	i32 2217644978, ; 346: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 285
	i32 2222056684, ; 347: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2229158877, ; 348: Microsoft.Extensions.Features.dll => 0x84de43dd => 196
	i32 2244775296, ; 349: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 267
	i32 2252106437, ; 350: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 351: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 352: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 353: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 190
	i32 2267999099, ; 354: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 222
	i32 2270573516, ; 355: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 311
	i32 2279755925, ; 356: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 274
	i32 2293034957, ; 357: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 358: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 359: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 360: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 321
	i32 2305521784, ; 361: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 362: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 226
	i32 2319144366, ; 363: Microsoft.AspNetCore.SignalR.Client => 0x8a3b55ae => 185
	i32 2320631194, ; 364: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 365: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 366: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 367: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 368: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 369: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 209
	i32 2371007202, ; 370: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 189
	i32 2378619854, ; 371: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 372: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 373: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 316
	i32 2401565422, ; 374: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 375: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 249
	i32 2411328690, ; 376: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 175
	i32 2421380589, ; 377: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 378: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 236
	i32 2427813419, ; 379: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 313
	i32 2435356389, ; 380: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 381: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 382: Microsoft.JSInterop.dll => 0x919672ca => 211
	i32 2454642406, ; 383: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 384: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 385: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 386: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 239
	i32 2471841756, ; 387: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 388: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 389: Microsoft.Maui.Controls => 0x93dba8a1 => 213
	i32 2483903535, ; 390: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 391: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 392: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 393: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 394: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 261
	i32 2522472828, ; 395: Xamarin.Android.Glide.dll => 0x9659e17c => 220
	i32 2537015816, ; 396: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 174
	i32 2538310050, ; 397: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 398: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 314
	i32 2562349572, ; 399: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 400: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 401: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 262
	i32 2581819634, ; 402: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 284
	i32 2585220780, ; 403: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 404: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 405: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 177
	i32 2589602615, ; 406: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 407: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 197
	i32 2593496499, ; 408: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 323
	i32 2605712449, ; 409: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 302
	i32 2615233544, ; 410: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 253
	i32 2616218305, ; 411: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 204
	i32 2617129537, ; 412: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 413: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 414: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 243
	i32 2624644809, ; 415: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 248
	i32 2626831493, ; 416: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 318
	i32 2627185994, ; 417: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 418: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 419: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 257
	i32 2637500010, ; 420: Microsoft.Extensions.Features => 0x9d350e6a => 196
	i32 2640290731, ; 421: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 209
	i32 2663391936, ; 422: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 222
	i32 2663698177, ; 423: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 424: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 425: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 426: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 427: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2692077919, ; 428: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 179
	i32 2693849962, ; 429: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 430: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 282
	i32 2715334215, ; 431: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 432: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 433: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 434: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 435: Xamarin.AndroidX.Activity => 0xa2e0939b => 224
	i32 2735172069, ; 436: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 437: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 174
	i32 2737747696, ; 438: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 230
	i32 2740948882, ; 439: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 440: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 441: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 324
	i32 2758225723, ; 442: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 214
	i32 2764765095, ; 443: Microsoft.Maui.dll => 0xa4caf7a7 => 215
	i32 2765824710, ; 444: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 445: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 296
	i32 2778768386, ; 446: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 287
	i32 2779977773, ; 447: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 275
	i32 2785988530, ; 448: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 330
	i32 2788224221, ; 449: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 253
	i32 2801831435, ; 450: Microsoft.Maui.Graphics => 0xa7008e0b => 217
	i32 2803228030, ; 451: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 452: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 309
	i32 2810250172, ; 453: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 240
	i32 2819470561, ; 454: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 455: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 456: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 275
	i32 2824502124, ; 457: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2828610098, ; 458: chattersfront.dll => 0xa8992a32 => 0
	i32 2831556043, ; 459: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 322
	i32 2833784645, ; 460: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 184
	i32 2838993487, ; 461: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 264
	i32 2849599387, ; 462: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 463: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 287
	i32 2855708567, ; 464: Xamarin.AndroidX.Transition => 0xaa36a797 => 283
	i32 2861098320, ; 465: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 466: Microsoft.Maui.Essentials => 0xaa8a4878 => 216
	i32 2870099610, ; 467: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 225
	i32 2875164099, ; 468: Jsr305Binding.dll => 0xab5f85c3 => 292
	i32 2875220617, ; 469: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2875347124, ; 470: Microsoft.AspNetCore.Http.Connections.Client.dll => 0xab6250b4 => 182
	i32 2884993177, ; 471: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 251
	i32 2887636118, ; 472: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 473: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 178
	i32 2899753641, ; 474: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 475: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 476: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 477: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 478: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 479: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 200
	i32 2916838712, ; 480: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 288
	i32 2919462931, ; 481: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 482: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 227
	i32 2936416060, ; 483: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 484: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 485: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 486: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 487: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 488: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 489: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 247
	i32 2987532451, ; 490: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 278
	i32 2996846495, ; 491: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 260
	i32 3016983068, ; 492: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 280
	i32 3023353419, ; 493: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 494: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 255
	i32 3038032645, ; 495: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 337
	i32 3056245963, ; 496: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 277
	i32 3057625584, ; 497: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 268
	i32 3059408633, ; 498: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 499: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 500: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 501: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 315
	i32 3084678329, ; 502: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 210
	i32 3090735792, ; 503: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 504: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 505: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 506: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 507: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 508: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 509: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 510: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 511: GoogleGson.dll => 0xbba64c02 => 173
	i32 3159123045, ; 512: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 513: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 514: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 269
	i32 3192346100, ; 515: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 516: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 517: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 518: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 519: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 246
	i32 3220365878, ; 520: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 521: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 522: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 523: Xamarin.AndroidX.CardView => 0xc235e84d => 234
	i32 3265493905, ; 524: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 525: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 526: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 527: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 528: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 529: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 530: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 531: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 532: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 310
	i32 3312457198, ; 533: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 208
	i32 3316684772, ; 534: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 535: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 244
	i32 3317144872, ; 536: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 537: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 232
	i32 3345895724, ; 538: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 273
	i32 3346324047, ; 539: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 270
	i32 3357674450, ; 540: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 327
	i32 3358260929, ; 541: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 542: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 225
	i32 3362522851, ; 543: Xamarin.AndroidX.Core => 0xc86c06e3 => 241
	i32 3366347497, ; 544: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 545: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 274
	i32 3381016424, ; 546: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 306
	i32 3395150330, ; 547: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 548: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 549: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 245
	i32 3406629867, ; 550: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 198
	i32 3421170118, ; 551: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 191
	i32 3428513518, ; 552: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 194
	i32 3429136800, ; 553: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 554: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 555: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 248
	i32 3445260447, ; 556: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 557: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 212
	i32 3463511458, ; 558: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 314
	i32 3464190856, ; 559: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 177
	i32 3466904072, ; 560: Microsoft.AspNetCore.SignalR.Client.dll => 0xcea4c208 => 185
	i32 3471940407, ; 561: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 562: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 563: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 327
	i32 3484440000, ; 564: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 326
	i32 3485117614, ; 565: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 566: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 567: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 237
	i32 3500000672, ; 568: Microsoft.JSInterop => 0xd09dc5a0 => 211
	i32 3509114376, ; 569: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 570: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 571: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 572: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 573: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 574: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 575: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 334
	i32 3597029428, ; 576: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 223
	i32 3598340787, ; 577: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 578: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 579: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 580: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 272
	i32 3633644679, ; 581: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 227
	i32 3638274909, ; 582: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 583: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 258
	i32 3643446276, ; 584: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 331
	i32 3643854240, ; 585: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 269
	i32 3645089577, ; 586: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 587: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 190
	i32 3660523487, ; 588: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 589: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 590: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 233
	i32 3684561358, ; 591: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 237
	i32 3691870036, ; 592: Microsoft.AspNetCore.SignalR.Protocols.Json => 0xdc0d7754 => 188
	i32 3697841164, ; 593: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 336
	i32 3700591436, ; 594: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 207
	i32 3700866549, ; 595: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 596: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 242
	i32 3716563718, ; 597: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 598: Xamarin.AndroidX.Annotation => 0xdda814c6 => 226
	i32 3722202641, ; 599: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 193
	i32 3724971120, ; 600: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 268
	i32 3732100267, ; 601: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 602: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 184
	i32 3737834244, ; 603: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 604: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 605: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3758424670, ; 606: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 192
	i32 3786282454, ; 607: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 235
	i32 3787005001, ; 608: Microsoft.AspNetCore.Connections.Abstractions => 0xe1b91c49 => 181
	i32 3792276235, ; 609: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 610: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 212
	i32 3802395368, ; 611: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 612: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 613: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 614: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 615: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 195
	i32 3844307129, ; 616: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 617: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 618: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 619: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 620: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 621: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 622: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 283
	i32 3888767677, ; 623: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 273
	i32 3889960447, ; 624: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 335
	i32 3896106733, ; 625: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 626: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 241
	i32 3901907137, ; 627: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 628: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 629: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 286
	i32 3928044579, ; 630: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 631: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 632: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 271
	i32 3945713374, ; 633: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 634: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 635: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 229
	i32 3959773229, ; 636: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 260
	i32 3980434154, ; 637: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 330
	i32 3987592930, ; 638: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 312
	i32 4003436829, ; 639: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 640: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 228
	i32 4023392905, ; 641: System.IO.Pipelines => 0xefd01a89 => 219
	i32 4025784931, ; 642: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 643: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 214
	i32 4054681211, ; 644: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 645: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 646: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 647: Microsoft.Maui.Essentials.dll => 0xf40add04 => 216
	i32 4099507663, ; 648: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 649: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 650: Xamarin.AndroidX.Emoji2 => 0xf479582c => 249
	i32 4102112229, ; 651: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 325
	i32 4125707920, ; 652: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 320
	i32 4126470640, ; 653: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 194
	i32 4127667938, ; 654: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 655: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 656: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 657: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 332
	i32 4151237749, ; 658: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 659: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 660: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 661: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 662: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 663: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 265
	i32 4185676441, ; 664: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 665: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 666: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 667: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 242
	i32 4258378803, ; 668: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 264
	i32 4260525087, ; 669: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 670: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 218
	i32 4271975918, ; 671: Microsoft.Maui.Controls.dll => 0xfea12dee => 213
	i32 4274976490, ; 672: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 673: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 265
	i32 4294648842, ; 674: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 199
	i32 4294763496 ; 675: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 251
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [676 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 261, ; 3
	i32 295, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 30, ; 8
	i32 336, ; 9
	i32 124, ; 10
	i32 217, ; 11
	i32 102, ; 12
	i32 279, ; 13
	i32 107, ; 14
	i32 279, ; 15
	i32 139, ; 16
	i32 299, ; 17
	i32 77, ; 18
	i32 124, ; 19
	i32 13, ; 20
	i32 235, ; 21
	i32 132, ; 22
	i32 281, ; 23
	i32 151, ; 24
	i32 333, ; 25
	i32 334, ; 26
	i32 18, ; 27
	i32 233, ; 28
	i32 26, ; 29
	i32 182, ; 30
	i32 255, ; 31
	i32 1, ; 32
	i32 59, ; 33
	i32 42, ; 34
	i32 176, ; 35
	i32 91, ; 36
	i32 175, ; 37
	i32 238, ; 38
	i32 147, ; 39
	i32 257, ; 40
	i32 254, ; 41
	i32 305, ; 42
	i32 54, ; 43
	i32 69, ; 44
	i32 333, ; 45
	i32 224, ; 46
	i32 83, ; 47
	i32 318, ; 48
	i32 256, ; 49
	i32 183, ; 50
	i32 317, ; 51
	i32 131, ; 52
	i32 55, ; 53
	i32 149, ; 54
	i32 74, ; 55
	i32 145, ; 56
	i32 62, ; 57
	i32 146, ; 58
	i32 337, ; 59
	i32 165, ; 60
	i32 329, ; 61
	i32 239, ; 62
	i32 12, ; 63
	i32 252, ; 64
	i32 125, ; 65
	i32 152, ; 66
	i32 187, ; 67
	i32 113, ; 68
	i32 166, ; 69
	i32 164, ; 70
	i32 254, ; 71
	i32 207, ; 72
	i32 267, ; 73
	i32 84, ; 74
	i32 316, ; 75
	i32 310, ; 76
	i32 206, ; 77
	i32 150, ; 78
	i32 299, ; 79
	i32 60, ; 80
	i32 202, ; 81
	i32 51, ; 82
	i32 103, ; 83
	i32 114, ; 84
	i32 40, ; 85
	i32 292, ; 86
	i32 290, ; 87
	i32 199, ; 88
	i32 120, ; 89
	i32 324, ; 90
	i32 52, ; 91
	i32 44, ; 92
	i32 119, ; 93
	i32 244, ; 94
	i32 322, ; 95
	i32 250, ; 96
	i32 81, ; 97
	i32 136, ; 98
	i32 286, ; 99
	i32 231, ; 100
	i32 8, ; 101
	i32 73, ; 102
	i32 304, ; 103
	i32 155, ; 104
	i32 301, ; 105
	i32 154, ; 106
	i32 92, ; 107
	i32 296, ; 108
	i32 45, ; 109
	i32 319, ; 110
	i32 307, ; 111
	i32 300, ; 112
	i32 109, ; 113
	i32 129, ; 114
	i32 25, ; 115
	i32 221, ; 116
	i32 72, ; 117
	i32 55, ; 118
	i32 46, ; 119
	i32 328, ; 120
	i32 205, ; 121
	i32 245, ; 122
	i32 180, ; 123
	i32 22, ; 124
	i32 259, ; 125
	i32 86, ; 126
	i32 43, ; 127
	i32 160, ; 128
	i32 188, ; 129
	i32 71, ; 130
	i32 272, ; 131
	i32 3, ; 132
	i32 42, ; 133
	i32 63, ; 134
	i32 16, ; 135
	i32 53, ; 136
	i32 331, ; 137
	i32 295, ; 138
	i32 105, ; 139
	i32 300, ; 140
	i32 293, ; 141
	i32 256, ; 142
	i32 34, ; 143
	i32 158, ; 144
	i32 85, ; 145
	i32 32, ; 146
	i32 12, ; 147
	i32 51, ; 148
	i32 201, ; 149
	i32 56, ; 150
	i32 276, ; 151
	i32 36, ; 152
	i32 195, ; 153
	i32 306, ; 154
	i32 294, ; 155
	i32 229, ; 156
	i32 35, ; 157
	i32 58, ; 158
	i32 263, ; 159
	i32 183, ; 160
	i32 173, ; 161
	i32 17, ; 162
	i32 297, ; 163
	i32 164, ; 164
	i32 192, ; 165
	i32 319, ; 166
	i32 262, ; 167
	i32 204, ; 168
	i32 289, ; 169
	i32 325, ; 170
	i32 153, ; 171
	i32 197, ; 172
	i32 285, ; 173
	i32 270, ; 174
	i32 323, ; 175
	i32 231, ; 176
	i32 29, ; 177
	i32 52, ; 178
	i32 186, ; 179
	i32 321, ; 180
	i32 290, ; 181
	i32 5, ; 182
	i32 305, ; 183
	i32 280, ; 184
	i32 284, ; 185
	i32 236, ; 186
	i32 301, ; 187
	i32 228, ; 188
	i32 247, ; 189
	i32 85, ; 190
	i32 289, ; 191
	i32 61, ; 192
	i32 112, ; 193
	i32 57, ; 194
	i32 335, ; 195
	i32 276, ; 196
	i32 99, ; 197
	i32 19, ; 198
	i32 240, ; 199
	i32 111, ; 200
	i32 101, ; 201
	i32 181, ; 202
	i32 102, ; 203
	i32 303, ; 204
	i32 104, ; 205
	i32 0, ; 206
	i32 293, ; 207
	i32 71, ; 208
	i32 38, ; 209
	i32 32, ; 210
	i32 198, ; 211
	i32 103, ; 212
	i32 73, ; 213
	i32 218, ; 214
	i32 309, ; 215
	i32 9, ; 216
	i32 123, ; 217
	i32 46, ; 218
	i32 230, ; 219
	i32 206, ; 220
	i32 9, ; 221
	i32 43, ; 222
	i32 4, ; 223
	i32 277, ; 224
	i32 313, ; 225
	i32 208, ; 226
	i32 308, ; 227
	i32 201, ; 228
	i32 31, ; 229
	i32 138, ; 230
	i32 92, ; 231
	i32 180, ; 232
	i32 93, ; 233
	i32 328, ; 234
	i32 49, ; 235
	i32 141, ; 236
	i32 112, ; 237
	i32 140, ; 238
	i32 246, ; 239
	i32 115, ; 240
	i32 294, ; 241
	i32 157, ; 242
	i32 76, ; 243
	i32 79, ; 244
	i32 266, ; 245
	i32 37, ; 246
	i32 288, ; 247
	i32 193, ; 248
	i32 250, ; 249
	i32 243, ; 250
	i32 64, ; 251
	i32 138, ; 252
	i32 15, ; 253
	i32 179, ; 254
	i32 116, ; 255
	i32 282, ; 256
	i32 291, ; 257
	i32 238, ; 258
	i32 48, ; 259
	i32 70, ; 260
	i32 80, ; 261
	i32 126, ; 262
	i32 94, ; 263
	i32 121, ; 264
	i32 298, ; 265
	i32 26, ; 266
	i32 259, ; 267
	i32 97, ; 268
	i32 28, ; 269
	i32 234, ; 270
	i32 326, ; 271
	i32 304, ; 272
	i32 149, ; 273
	i32 219, ; 274
	i32 169, ; 275
	i32 4, ; 276
	i32 98, ; 277
	i32 178, ; 278
	i32 33, ; 279
	i32 93, ; 280
	i32 281, ; 281
	i32 202, ; 282
	i32 21, ; 283
	i32 41, ; 284
	i32 170, ; 285
	i32 320, ; 286
	i32 252, ; 287
	i32 312, ; 288
	i32 266, ; 289
	i32 297, ; 290
	i32 291, ; 291
	i32 271, ; 292
	i32 2, ; 293
	i32 134, ; 294
	i32 111, ; 295
	i32 203, ; 296
	i32 332, ; 297
	i32 221, ; 298
	i32 329, ; 299
	i32 58, ; 300
	i32 95, ; 301
	i32 311, ; 302
	i32 39, ; 303
	i32 232, ; 304
	i32 25, ; 305
	i32 94, ; 306
	i32 89, ; 307
	i32 99, ; 308
	i32 10, ; 309
	i32 87, ; 310
	i32 186, ; 311
	i32 100, ; 312
	i32 278, ; 313
	i32 187, ; 314
	i32 189, ; 315
	i32 298, ; 316
	i32 223, ; 317
	i32 210, ; 318
	i32 308, ; 319
	i32 7, ; 320
	i32 263, ; 321
	i32 303, ; 322
	i32 220, ; 323
	i32 88, ; 324
	i32 191, ; 325
	i32 258, ; 326
	i32 154, ; 327
	i32 307, ; 328
	i32 33, ; 329
	i32 200, ; 330
	i32 116, ; 331
	i32 82, ; 332
	i32 20, ; 333
	i32 11, ; 334
	i32 162, ; 335
	i32 3, ; 336
	i32 215, ; 337
	i32 315, ; 338
	i32 205, ; 339
	i32 203, ; 340
	i32 176, ; 341
	i32 84, ; 342
	i32 302, ; 343
	i32 64, ; 344
	i32 317, ; 345
	i32 285, ; 346
	i32 143, ; 347
	i32 196, ; 348
	i32 267, ; 349
	i32 157, ; 350
	i32 41, ; 351
	i32 117, ; 352
	i32 190, ; 353
	i32 222, ; 354
	i32 311, ; 355
	i32 274, ; 356
	i32 131, ; 357
	i32 75, ; 358
	i32 66, ; 359
	i32 321, ; 360
	i32 172, ; 361
	i32 226, ; 362
	i32 185, ; 363
	i32 143, ; 364
	i32 106, ; 365
	i32 151, ; 366
	i32 70, ; 367
	i32 156, ; 368
	i32 209, ; 369
	i32 189, ; 370
	i32 121, ; 371
	i32 127, ; 372
	i32 316, ; 373
	i32 152, ; 374
	i32 249, ; 375
	i32 175, ; 376
	i32 141, ; 377
	i32 236, ; 378
	i32 313, ; 379
	i32 20, ; 380
	i32 14, ; 381
	i32 211, ; 382
	i32 135, ; 383
	i32 75, ; 384
	i32 59, ; 385
	i32 239, ; 386
	i32 167, ; 387
	i32 168, ; 388
	i32 213, ; 389
	i32 15, ; 390
	i32 74, ; 391
	i32 6, ; 392
	i32 23, ; 393
	i32 261, ; 394
	i32 220, ; 395
	i32 174, ; 396
	i32 91, ; 397
	i32 314, ; 398
	i32 1, ; 399
	i32 136, ; 400
	i32 262, ; 401
	i32 284, ; 402
	i32 134, ; 403
	i32 69, ; 404
	i32 177, ; 405
	i32 146, ; 406
	i32 197, ; 407
	i32 323, ; 408
	i32 302, ; 409
	i32 253, ; 410
	i32 204, ; 411
	i32 88, ; 412
	i32 96, ; 413
	i32 243, ; 414
	i32 248, ; 415
	i32 318, ; 416
	i32 31, ; 417
	i32 45, ; 418
	i32 257, ; 419
	i32 196, ; 420
	i32 209, ; 421
	i32 222, ; 422
	i32 109, ; 423
	i32 158, ; 424
	i32 35, ; 425
	i32 22, ; 426
	i32 114, ; 427
	i32 179, ; 428
	i32 57, ; 429
	i32 282, ; 430
	i32 144, ; 431
	i32 118, ; 432
	i32 120, ; 433
	i32 110, ; 434
	i32 224, ; 435
	i32 139, ; 436
	i32 174, ; 437
	i32 230, ; 438
	i32 54, ; 439
	i32 105, ; 440
	i32 324, ; 441
	i32 214, ; 442
	i32 215, ; 443
	i32 133, ; 444
	i32 296, ; 445
	i32 287, ; 446
	i32 275, ; 447
	i32 330, ; 448
	i32 253, ; 449
	i32 217, ; 450
	i32 159, ; 451
	i32 309, ; 452
	i32 240, ; 453
	i32 163, ; 454
	i32 132, ; 455
	i32 275, ; 456
	i32 161, ; 457
	i32 0, ; 458
	i32 322, ; 459
	i32 184, ; 460
	i32 264, ; 461
	i32 140, ; 462
	i32 287, ; 463
	i32 283, ; 464
	i32 169, ; 465
	i32 216, ; 466
	i32 225, ; 467
	i32 292, ; 468
	i32 40, ; 469
	i32 182, ; 470
	i32 251, ; 471
	i32 81, ; 472
	i32 178, ; 473
	i32 56, ; 474
	i32 37, ; 475
	i32 97, ; 476
	i32 166, ; 477
	i32 172, ; 478
	i32 200, ; 479
	i32 288, ; 480
	i32 82, ; 481
	i32 227, ; 482
	i32 98, ; 483
	i32 30, ; 484
	i32 159, ; 485
	i32 18, ; 486
	i32 127, ; 487
	i32 119, ; 488
	i32 247, ; 489
	i32 278, ; 490
	i32 260, ; 491
	i32 280, ; 492
	i32 165, ; 493
	i32 255, ; 494
	i32 337, ; 495
	i32 277, ; 496
	i32 268, ; 497
	i32 170, ; 498
	i32 16, ; 499
	i32 144, ; 500
	i32 315, ; 501
	i32 210, ; 502
	i32 125, ; 503
	i32 118, ; 504
	i32 38, ; 505
	i32 115, ; 506
	i32 47, ; 507
	i32 142, ; 508
	i32 117, ; 509
	i32 34, ; 510
	i32 173, ; 511
	i32 95, ; 512
	i32 53, ; 513
	i32 269, ; 514
	i32 129, ; 515
	i32 153, ; 516
	i32 24, ; 517
	i32 161, ; 518
	i32 246, ; 519
	i32 148, ; 520
	i32 104, ; 521
	i32 89, ; 522
	i32 234, ; 523
	i32 60, ; 524
	i32 142, ; 525
	i32 100, ; 526
	i32 5, ; 527
	i32 13, ; 528
	i32 122, ; 529
	i32 135, ; 530
	i32 28, ; 531
	i32 310, ; 532
	i32 208, ; 533
	i32 72, ; 534
	i32 244, ; 535
	i32 24, ; 536
	i32 232, ; 537
	i32 273, ; 538
	i32 270, ; 539
	i32 327, ; 540
	i32 137, ; 541
	i32 225, ; 542
	i32 241, ; 543
	i32 168, ; 544
	i32 274, ; 545
	i32 306, ; 546
	i32 101, ; 547
	i32 123, ; 548
	i32 245, ; 549
	i32 198, ; 550
	i32 191, ; 551
	i32 194, ; 552
	i32 163, ; 553
	i32 167, ; 554
	i32 248, ; 555
	i32 39, ; 556
	i32 212, ; 557
	i32 314, ; 558
	i32 177, ; 559
	i32 185, ; 560
	i32 17, ; 561
	i32 171, ; 562
	i32 327, ; 563
	i32 326, ; 564
	i32 137, ; 565
	i32 150, ; 566
	i32 237, ; 567
	i32 211, ; 568
	i32 155, ; 569
	i32 130, ; 570
	i32 19, ; 571
	i32 65, ; 572
	i32 147, ; 573
	i32 47, ; 574
	i32 334, ; 575
	i32 223, ; 576
	i32 79, ; 577
	i32 61, ; 578
	i32 106, ; 579
	i32 272, ; 580
	i32 227, ; 581
	i32 49, ; 582
	i32 258, ; 583
	i32 331, ; 584
	i32 269, ; 585
	i32 14, ; 586
	i32 190, ; 587
	i32 68, ; 588
	i32 171, ; 589
	i32 233, ; 590
	i32 237, ; 591
	i32 188, ; 592
	i32 336, ; 593
	i32 207, ; 594
	i32 78, ; 595
	i32 242, ; 596
	i32 108, ; 597
	i32 226, ; 598
	i32 193, ; 599
	i32 268, ; 600
	i32 67, ; 601
	i32 184, ; 602
	i32 63, ; 603
	i32 27, ; 604
	i32 160, ; 605
	i32 192, ; 606
	i32 235, ; 607
	i32 181, ; 608
	i32 10, ; 609
	i32 212, ; 610
	i32 11, ; 611
	i32 78, ; 612
	i32 126, ; 613
	i32 83, ; 614
	i32 195, ; 615
	i32 66, ; 616
	i32 107, ; 617
	i32 65, ; 618
	i32 128, ; 619
	i32 122, ; 620
	i32 77, ; 621
	i32 283, ; 622
	i32 273, ; 623
	i32 335, ; 624
	i32 8, ; 625
	i32 241, ; 626
	i32 2, ; 627
	i32 44, ; 628
	i32 286, ; 629
	i32 156, ; 630
	i32 128, ; 631
	i32 271, ; 632
	i32 23, ; 633
	i32 133, ; 634
	i32 229, ; 635
	i32 260, ; 636
	i32 330, ; 637
	i32 312, ; 638
	i32 29, ; 639
	i32 228, ; 640
	i32 219, ; 641
	i32 62, ; 642
	i32 214, ; 643
	i32 90, ; 644
	i32 87, ; 645
	i32 148, ; 646
	i32 216, ; 647
	i32 36, ; 648
	i32 86, ; 649
	i32 249, ; 650
	i32 325, ; 651
	i32 320, ; 652
	i32 194, ; 653
	i32 50, ; 654
	i32 6, ; 655
	i32 90, ; 656
	i32 332, ; 657
	i32 21, ; 658
	i32 162, ; 659
	i32 96, ; 660
	i32 50, ; 661
	i32 113, ; 662
	i32 265, ; 663
	i32 130, ; 664
	i32 76, ; 665
	i32 27, ; 666
	i32 242, ; 667
	i32 264, ; 668
	i32 7, ; 669
	i32 218, ; 670
	i32 213, ; 671
	i32 110, ; 672
	i32 265, ; 673
	i32 199, ; 674
	i32 251 ; 675
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
