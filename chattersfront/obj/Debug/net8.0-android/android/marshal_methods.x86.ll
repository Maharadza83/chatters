; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [345 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [684 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 265
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 299
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 340
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 221
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 98325684, ; 13: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 197
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 283
	i32 117431740, ; 15: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 16: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 283
	i32 122350210, ; 17: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 18: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 303
	i32 142721839, ; 19: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 239
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 285
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 337
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 338
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 237
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221063263, ; 31: Microsoft.AspNetCore.Http.Connections.Client => 0xd2d285f => 182
	i32 221958352, ; 32: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 196
	i32 230216969, ; 33: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 259
	i32 230752869, ; 34: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 35: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 36: System.Globalization => 0xdd133ce => 42
	i32 244348769, ; 37: Microsoft.AspNetCore.Components.Authorization => 0xe907761 => 176
	i32 246610117, ; 38: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 254259026, ; 39: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 175
	i32 261689757, ; 40: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 242
	i32 276479776, ; 41: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 42: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 261
	i32 280482487, ; 43: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 258
	i32 280992041, ; 44: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 309
	i32 291076382, ; 45: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 291275502, ; 46: Microsoft.Extensions.Http.dll => 0x115c82ee => 204
	i32 298918909, ; 47: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 48: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 337
	i32 318968648, ; 49: Xamarin.AndroidX.Activity.dll => 0x13031348 => 228
	i32 321597661, ; 50: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 51: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 322
	i32 342366114, ; 52: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 260
	i32 348048101, ; 53: Microsoft.AspNetCore.Http.Connections.Common.dll => 0x14becae5 => 183
	i32 356389973, ; 54: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 321
	i32 360082299, ; 55: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 56: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 57: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 58: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 59: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 60: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 61: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 62: _Microsoft.Android.Resource.Designer => 0x17969339 => 341
	i32 403441872, ; 63: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 64: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 333
	i32 441335492, ; 65: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 243
	i32 442565967, ; 66: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 67: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 256
	i32 451504562, ; 68: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 69: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 458494020, ; 70: Microsoft.AspNetCore.SignalR.Common.dll => 0x1b541044 => 187
	i32 459347974, ; 71: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 72: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 73: System.dll => 0x1bff388e => 164
	i32 476646585, ; 74: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 258
	i32 485463106, ; 75: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 211
	i32 486930444, ; 76: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 271
	i32 498788369, ; 77: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 78: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 320
	i32 503918385, ; 79: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 314
	i32 513247710, ; 80: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 210
	i32 526420162, ; 81: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 82: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 303
	i32 530272170, ; 83: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 84: Microsoft.Extensions.Logging => 0x20216150 => 205
	i32 540030774, ; 85: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 86: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 87: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 88: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 89: Jsr305Binding => 0x213954e7 => 296
	i32 569601784, ; 90: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 294
	i32 571435654, ; 91: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 201
	i32 577335427, ; 92: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 93: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 328
	i32 601371474, ; 94: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 95: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 96: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 97: Xamarin.AndroidX.CustomView => 0x2568904f => 248
	i32 627931235, ; 98: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 326
	i32 639843206, ; 99: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 254
	i32 643868501, ; 100: System.Net => 0x2660a755 => 81
	i32 662205335, ; 101: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 102: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 290
	i32 666292255, ; 103: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 235
	i32 672442732, ; 104: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 105: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 106: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 308
	i32 690569205, ; 107: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 108: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 305
	i32 693804605, ; 109: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 110: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 111: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 300
	i32 700358131, ; 112: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 113: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 323
	i32 709557578, ; 114: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 311
	i32 720511267, ; 115: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 304
	i32 722857257, ; 116: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 731701662, ; 117: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 209
	i32 735137430, ; 118: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 119: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 120: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 225
	i32 759454413, ; 121: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 122: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 123: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 124: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 332
	i32 789151979, ; 125: Microsoft.Extensions.Options => 0x2f0980eb => 208
	i32 790371945, ; 126: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 249
	i32 804008546, ; 127: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 180
	i32 804715423, ; 128: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 129: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 263
	i32 823281589, ; 130: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 131: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 132: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 832711436, ; 133: Microsoft.AspNetCore.SignalR.Protocols.Json.dll => 0x31a22b0c => 188
	i32 834051424, ; 134: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 135: Xamarin.AndroidX.Print => 0x3246f6cd => 276
	i32 873119928, ; 136: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 137: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 138: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 139: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 140: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 141: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 335
	i32 928116545, ; 142: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 299
	i32 952186615, ; 143: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 144: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 304
	i32 966729478, ; 145: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 297
	i32 967690846, ; 146: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 260
	i32 975236339, ; 147: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 148: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 149: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 150: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 151: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 152: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 153: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 203
	i32 1001831731, ; 154: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 155: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 280
	i32 1019214401, ; 156: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 157: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 195
	i32 1029334545, ; 158: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 310
	i32 1031528504, ; 159: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 298
	i32 1035644815, ; 160: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 233
	i32 1036536393, ; 161: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 162: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1048992957, ; 163: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 197
	i32 1052210849, ; 164: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 267
	i32 1058641855, ; 165: Microsoft.AspNetCore.Http.Connections.Common => 0x3f1997bf => 183
	i32 1067306892, ; 166: GoogleGson => 0x3f9dcf8c => 173
	i32 1082857460, ; 167: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 168: Xamarin.Kotlin.StdLib => 0x409e66d8 => 301
	i32 1098259244, ; 169: System => 0x41761b2c => 164
	i32 1106973742, ; 170: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 192
	i32 1118262833, ; 171: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 323
	i32 1121599056, ; 172: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 266
	i32 1127624469, ; 173: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 207
	i32 1149092582, ; 174: Xamarin.AndroidX.Window => 0x447dc2e6 => 293
	i32 1168523401, ; 175: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 329
	i32 1170634674, ; 176: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 177: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 199
	i32 1175144683, ; 178: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 289
	i32 1178241025, ; 179: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 274
	i32 1203215381, ; 180: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 327
	i32 1204270330, ; 181: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 235
	i32 1208641965, ; 182: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 183: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1233093933, ; 184: Microsoft.AspNetCore.SignalR.Client.Core.dll => 0x497f852d => 186
	i32 1234928153, ; 185: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 325
	i32 1243150071, ; 186: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 294
	i32 1253011324, ; 187: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 188: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 309
	i32 1264511973, ; 189: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 284
	i32 1267360935, ; 190: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 288
	i32 1273260888, ; 191: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 240
	i32 1275534314, ; 192: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 305
	i32 1278448581, ; 193: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 232
	i32 1293217323, ; 194: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 251
	i32 1309188875, ; 195: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 196: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 293
	i32 1324164729, ; 197: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 198: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 199: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 200: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 339
	i32 1376866003, ; 201: Xamarin.AndroidX.SavedState => 0x52114ed3 => 280
	i32 1379779777, ; 202: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 203: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 204: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 244
	i32 1408764838, ; 205: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 206: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1414043276, ; 207: Microsoft.AspNetCore.Connections.Abstractions.dll => 0x5448968c => 181
	i32 1422545099, ; 208: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 209: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 307
	i32 1434145427, ; 210: System.Runtime.Handles => 0x557b5293 => 104
	i32 1434533169, ; 211: chattersfront => 0x55813d31 => 0
	i32 1435222561, ; 212: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 297
	i32 1439761251, ; 213: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 214: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 215: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 216: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 200
	i32 1457743152, ; 217: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 218: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 219: System.IdentityModel.Tokens.Jwt => 0x57137723 => 222
	i32 1461004990, ; 220: es\Microsoft.Maui.Controls.resources => 0x57152abe => 313
	i32 1461234159, ; 221: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 222: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 223: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 224: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 234
	i32 1470490898, ; 225: Microsoft.Extensions.Primitives => 0x57a5e912 => 210
	i32 1479771757, ; 226: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 227: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 228: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 229: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 281
	i32 1493001747, ; 230: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 317
	i32 1498168481, ; 231: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 212
	i32 1505131794, ; 232: Microsoft.Extensions.Http => 0x59b67d12 => 204
	i32 1514721132, ; 233: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 312
	i32 1521091094, ; 234: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 203
	i32 1536373174, ; 235: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 236: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 237: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1546581739, ; 238: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 180
	i32 1550322496, ; 239: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 240: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 332
	i32 1565862583, ; 241: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 242: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 243: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 244: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 245: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 250
	i32 1592978981, ; 246: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 247: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 298
	i32 1601112923, ; 248: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 249: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 250: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 251: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 270
	i32 1622358360, ; 252: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 253: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 292
	i32 1632842087, ; 254: Microsoft.Extensions.Configuration.Json => 0x61533167 => 193
	i32 1635184631, ; 255: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 254
	i32 1636350590, ; 256: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 247
	i32 1639515021, ; 257: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 258: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 259: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 260: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 179
	i32 1657153582, ; 261: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 262: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 286
	i32 1658251792, ; 263: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 295
	i32 1670060433, ; 264: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 242
	i32 1675553242, ; 265: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 266: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 267: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 268: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 269: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 270: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 271: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 302
	i32 1701541528, ; 272: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 273: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 263
	i32 1726116996, ; 274: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 275: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 276: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 238
	i32 1736233607, ; 277: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 330
	i32 1743415430, ; 278: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 308
	i32 1744735666, ; 279: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 280: System.IO.Pipelines.dll => 0x68139a0d => 223
	i32 1746316138, ; 281: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 282: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 283: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 284: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 178
	i32 1763938596, ; 285: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 286: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 287: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 285
	i32 1770582343, ; 288: Microsoft.Extensions.Logging.dll => 0x6988f147 => 205
	i32 1776026572, ; 289: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 290: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 291: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 292: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 324
	i32 1788241197, ; 293: Xamarin.AndroidX.Fragment => 0x6a96652d => 256
	i32 1793755602, ; 294: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 316
	i32 1808609942, ; 295: Xamarin.AndroidX.Loader => 0x6bcd3296 => 270
	i32 1813058853, ; 296: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 301
	i32 1813201214, ; 297: Xamarin.Google.Android.Material => 0x6c13413e => 295
	i32 1818569960, ; 298: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 275
	i32 1818787751, ; 299: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 300: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 301: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 302: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 206
	i32 1842015223, ; 303: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 336
	i32 1847515442, ; 304: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 225
	i32 1853025655, ; 305: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 333
	i32 1858542181, ; 306: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 307: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 308: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 315
	i32 1879696579, ; 309: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 310: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 236
	i32 1888955245, ; 311: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 312: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 313: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 314: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 315: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 316: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1945717188, ; 317: Microsoft.AspNetCore.SignalR.Client.Core => 0x73f949c4 => 186
	i32 1956758971, ; 318: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 319: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 282
	i32 1967334205, ; 320: Microsoft.AspNetCore.SignalR.Common => 0x7543233d => 187
	i32 1968388702, ; 321: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 189
	i32 1983156543, ; 322: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 302
	i32 1985761444, ; 323: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 227
	i32 1986222447, ; 324: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 214
	i32 2003115576, ; 325: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 312
	i32 2011961780, ; 326: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 327: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 267
	i32 2025202353, ; 328: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 307
	i32 2031763787, ; 329: Xamarin.Android.Glide => 0x791a414b => 224
	i32 2045470958, ; 330: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 331: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 191
	i32 2055257422, ; 332: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 262
	i32 2060060697, ; 333: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 334: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 311
	i32 2070888862, ; 335: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 336: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 202
	i32 2079903147, ; 337: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 338: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 339: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 340: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 341: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 342: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 343: Microsoft.Maui => 0x80bd55ad => 219
	i32 2169148018, ; 344: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 319
	i32 2181898931, ; 345: Microsoft.Extensions.Options.dll => 0x820d22b3 => 208
	i32 2192057212, ; 346: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 206
	i32 2192166651, ; 347: Microsoft.AspNetCore.Components.Authorization.dll => 0x82a9cefb => 176
	i32 2193016926, ; 348: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 349: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 306
	i32 2201231467, ; 350: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 351: it\Microsoft.Maui.Controls.resources => 0x839595db => 321
	i32 2217644978, ; 352: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 289
	i32 2222056684, ; 353: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2229158877, ; 354: Microsoft.Extensions.Features.dll => 0x84de43dd => 198
	i32 2244775296, ; 355: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 271
	i32 2252106437, ; 356: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 357: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 358: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 359: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 190
	i32 2267999099, ; 360: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 226
	i32 2270573516, ; 361: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 315
	i32 2279755925, ; 362: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 278
	i32 2293034957, ; 363: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 364: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 365: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 366: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 325
	i32 2305521784, ; 367: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 368: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 230
	i32 2319144366, ; 369: Microsoft.AspNetCore.SignalR.Client => 0x8a3b55ae => 185
	i32 2320631194, ; 370: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 371: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 372: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 373: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 374: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 375: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 213
	i32 2371007202, ; 376: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 189
	i32 2378619854, ; 377: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 378: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 379: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 320
	i32 2401565422, ; 380: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 381: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 253
	i32 2411328690, ; 382: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 175
	i32 2421380589, ; 383: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 384: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 240
	i32 2427813419, ; 385: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 317
	i32 2435356389, ; 386: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 387: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 388: Microsoft.JSInterop.dll => 0x919672ca => 215
	i32 2454642406, ; 389: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 390: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 391: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 392: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 243
	i32 2471841756, ; 393: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 394: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 395: Microsoft.Maui.Controls => 0x93dba8a1 => 217
	i32 2483903535, ; 396: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 397: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 398: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 399: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 400: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 265
	i32 2522472828, ; 401: Xamarin.Android.Glide.dll => 0x9659e17c => 224
	i32 2537015816, ; 402: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 174
	i32 2538310050, ; 403: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 404: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 318
	i32 2562349572, ; 405: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 406: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 407: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 266
	i32 2581819634, ; 408: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 288
	i32 2585220780, ; 409: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 410: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 411: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 177
	i32 2589602615, ; 412: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 413: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 199
	i32 2593496499, ; 414: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 327
	i32 2605712449, ; 415: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 306
	i32 2615233544, ; 416: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 257
	i32 2616218305, ; 417: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 207
	i32 2617129537, ; 418: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 419: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 420: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 247
	i32 2624644809, ; 421: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 252
	i32 2626831493, ; 422: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 322
	i32 2627185994, ; 423: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 424: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 425: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 261
	i32 2637500010, ; 426: Microsoft.Extensions.Features => 0x9d350e6a => 198
	i32 2640290731, ; 427: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 213
	i32 2663391936, ; 428: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 226
	i32 2663698177, ; 429: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 430: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 431: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 432: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 433: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2692077919, ; 434: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 179
	i32 2693849962, ; 435: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 436: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 286
	i32 2715334215, ; 437: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 438: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 439: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 440: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 441: Xamarin.AndroidX.Activity => 0xa2e0939b => 228
	i32 2735172069, ; 442: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 443: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 174
	i32 2737747696, ; 444: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 234
	i32 2740948882, ; 445: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 446: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 447: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 328
	i32 2758225723, ; 448: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 218
	i32 2764765095, ; 449: Microsoft.Maui.dll => 0xa4caf7a7 => 219
	i32 2765824710, ; 450: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 451: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 300
	i32 2778768386, ; 452: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 291
	i32 2779977773, ; 453: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 279
	i32 2785988530, ; 454: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 334
	i32 2788224221, ; 455: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 257
	i32 2801831435, ; 456: Microsoft.Maui.Graphics => 0xa7008e0b => 221
	i32 2803228030, ; 457: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 458: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 313
	i32 2810250172, ; 459: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 244
	i32 2819470561, ; 460: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 461: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 462: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 279
	i32 2824502124, ; 463: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2828610098, ; 464: chattersfront.dll => 0xa8992a32 => 0
	i32 2831556043, ; 465: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 326
	i32 2833784645, ; 466: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 184
	i32 2838993487, ; 467: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 268
	i32 2849599387, ; 468: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 469: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 291
	i32 2855708567, ; 470: Xamarin.AndroidX.Transition => 0xaa36a797 => 287
	i32 2861098320, ; 471: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 472: Microsoft.Maui.Essentials => 0xaa8a4878 => 220
	i32 2870099610, ; 473: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 229
	i32 2875164099, ; 474: Jsr305Binding.dll => 0xab5f85c3 => 296
	i32 2875220617, ; 475: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2875347124, ; 476: Microsoft.AspNetCore.Http.Connections.Client.dll => 0xab6250b4 => 182
	i32 2884993177, ; 477: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 255
	i32 2887636118, ; 478: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 479: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 178
	i32 2899753641, ; 480: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 481: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 482: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 483: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 484: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 485: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 202
	i32 2916838712, ; 486: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 292
	i32 2919462931, ; 487: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 488: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 231
	i32 2936416060, ; 489: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 490: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 491: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 492: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 493: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2971004615, ; 494: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 209
	i32 2972252294, ; 495: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 496: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 251
	i32 2987532451, ; 497: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 282
	i32 2996846495, ; 498: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 264
	i32 3016983068, ; 499: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 284
	i32 3020703001, ; 500: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 196
	i32 3023353419, ; 501: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 502: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 259
	i32 3038032645, ; 503: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 341
	i32 3056245963, ; 504: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 281
	i32 3057625584, ; 505: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 272
	i32 3059408633, ; 506: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 507: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 508: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 509: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 319
	i32 3084678329, ; 510: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 214
	i32 3090735792, ; 511: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 512: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 513: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 514: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 515: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 516: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 517: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 518: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 519: GoogleGson.dll => 0xbba64c02 => 173
	i32 3159123045, ; 520: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 521: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 522: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 273
	i32 3192346100, ; 523: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 524: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 525: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 526: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 527: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 250
	i32 3220365878, ; 528: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 529: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 530: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 531: Xamarin.AndroidX.CardView => 0xc235e84d => 238
	i32 3265493905, ; 532: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 533: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 534: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 535: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 536: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 537: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 538: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 539: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 540: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 314
	i32 3312457198, ; 541: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 212
	i32 3316684772, ; 542: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 543: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 248
	i32 3317144872, ; 544: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 545: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 236
	i32 3345895724, ; 546: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 277
	i32 3346324047, ; 547: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 274
	i32 3357674450, ; 548: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 331
	i32 3358260929, ; 549: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 550: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 229
	i32 3362522851, ; 551: Xamarin.AndroidX.Core => 0xc86c06e3 => 245
	i32 3366347497, ; 552: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 553: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 278
	i32 3381016424, ; 554: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 310
	i32 3395150330, ; 555: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 556: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 557: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 249
	i32 3406629867, ; 558: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 200
	i32 3421170118, ; 559: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 191
	i32 3428513518, ; 560: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 194
	i32 3429136800, ; 561: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 562: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 563: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 252
	i32 3445260447, ; 564: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 565: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 216
	i32 3463511458, ; 566: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 318
	i32 3464190856, ; 567: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 177
	i32 3466904072, ; 568: Microsoft.AspNetCore.SignalR.Client.dll => 0xcea4c208 => 185
	i32 3471940407, ; 569: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 570: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 571: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 331
	i32 3484440000, ; 572: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 330
	i32 3485117614, ; 573: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 574: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 575: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 241
	i32 3500000672, ; 576: Microsoft.JSInterop => 0xd09dc5a0 => 215
	i32 3509114376, ; 577: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 578: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 579: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 580: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 581: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 582: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 583: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 338
	i32 3597029428, ; 584: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 227
	i32 3598340787, ; 585: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 586: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 587: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 588: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 276
	i32 3633644679, ; 589: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 231
	i32 3638274909, ; 590: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 591: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 262
	i32 3643446276, ; 592: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 335
	i32 3643854240, ; 593: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 273
	i32 3645089577, ; 594: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 595: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 190
	i32 3660523487, ; 596: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 597: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 598: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 237
	i32 3684561358, ; 599: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 241
	i32 3691870036, ; 600: Microsoft.AspNetCore.SignalR.Protocols.Json => 0xdc0d7754 => 188
	i32 3697841164, ; 601: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 340
	i32 3700591436, ; 602: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 211
	i32 3700866549, ; 603: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 604: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 246
	i32 3716563718, ; 605: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 606: Xamarin.AndroidX.Annotation => 0xdda814c6 => 230
	i32 3722202641, ; 607: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 193
	i32 3724971120, ; 608: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 272
	i32 3732100267, ; 609: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 610: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 184
	i32 3737834244, ; 611: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 612: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 613: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3758424670, ; 614: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 192
	i32 3786282454, ; 615: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 239
	i32 3787005001, ; 616: Microsoft.AspNetCore.Connections.Abstractions => 0xe1b91c49 => 181
	i32 3792276235, ; 617: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 618: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 216
	i32 3802395368, ; 619: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 620: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 621: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 622: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 623: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 195
	i32 3844307129, ; 624: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 625: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 626: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 627: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 628: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 629: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 630: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 287
	i32 3888767677, ; 631: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 277
	i32 3889960447, ; 632: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 339
	i32 3896106733, ; 633: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 634: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 245
	i32 3901907137, ; 635: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 636: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 637: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 290
	i32 3928044579, ; 638: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 639: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 640: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 275
	i32 3945713374, ; 641: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 642: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 643: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 233
	i32 3959773229, ; 644: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 264
	i32 3980434154, ; 645: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 334
	i32 3987592930, ; 646: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 316
	i32 4003436829, ; 647: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 648: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 232
	i32 4023392905, ; 649: System.IO.Pipelines => 0xefd01a89 => 223
	i32 4025784931, ; 650: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 651: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 218
	i32 4054681211, ; 652: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 653: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 654: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 655: Microsoft.Maui.Essentials.dll => 0xf40add04 => 220
	i32 4099507663, ; 656: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 657: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 658: Xamarin.AndroidX.Emoji2 => 0xf479582c => 253
	i32 4102112229, ; 659: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 329
	i32 4125707920, ; 660: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 324
	i32 4126470640, ; 661: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 194
	i32 4127667938, ; 662: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 663: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 664: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 665: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 336
	i32 4151237749, ; 666: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 667: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 668: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 669: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 670: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 671: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 269
	i32 4185676441, ; 672: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 673: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 674: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 675: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 246
	i32 4258378803, ; 676: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 268
	i32 4260525087, ; 677: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 678: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 222
	i32 4271975918, ; 679: Microsoft.Maui.Controls.dll => 0xfea12dee => 217
	i32 4274976490, ; 680: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 681: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 269
	i32 4294648842, ; 682: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 201
	i32 4294763496 ; 683: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 255
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [684 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 265, ; 3
	i32 299, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 30, ; 8
	i32 340, ; 9
	i32 124, ; 10
	i32 221, ; 11
	i32 102, ; 12
	i32 197, ; 13
	i32 283, ; 14
	i32 107, ; 15
	i32 283, ; 16
	i32 139, ; 17
	i32 303, ; 18
	i32 77, ; 19
	i32 124, ; 20
	i32 13, ; 21
	i32 239, ; 22
	i32 132, ; 23
	i32 285, ; 24
	i32 151, ; 25
	i32 337, ; 26
	i32 338, ; 27
	i32 18, ; 28
	i32 237, ; 29
	i32 26, ; 30
	i32 182, ; 31
	i32 196, ; 32
	i32 259, ; 33
	i32 1, ; 34
	i32 59, ; 35
	i32 42, ; 36
	i32 176, ; 37
	i32 91, ; 38
	i32 175, ; 39
	i32 242, ; 40
	i32 147, ; 41
	i32 261, ; 42
	i32 258, ; 43
	i32 309, ; 44
	i32 54, ; 45
	i32 204, ; 46
	i32 69, ; 47
	i32 337, ; 48
	i32 228, ; 49
	i32 83, ; 50
	i32 322, ; 51
	i32 260, ; 52
	i32 183, ; 53
	i32 321, ; 54
	i32 131, ; 55
	i32 55, ; 56
	i32 149, ; 57
	i32 74, ; 58
	i32 145, ; 59
	i32 62, ; 60
	i32 146, ; 61
	i32 341, ; 62
	i32 165, ; 63
	i32 333, ; 64
	i32 243, ; 65
	i32 12, ; 66
	i32 256, ; 67
	i32 125, ; 68
	i32 152, ; 69
	i32 187, ; 70
	i32 113, ; 71
	i32 166, ; 72
	i32 164, ; 73
	i32 258, ; 74
	i32 211, ; 75
	i32 271, ; 76
	i32 84, ; 77
	i32 320, ; 78
	i32 314, ; 79
	i32 210, ; 80
	i32 150, ; 81
	i32 303, ; 82
	i32 60, ; 83
	i32 205, ; 84
	i32 51, ; 85
	i32 103, ; 86
	i32 114, ; 87
	i32 40, ; 88
	i32 296, ; 89
	i32 294, ; 90
	i32 201, ; 91
	i32 120, ; 92
	i32 328, ; 93
	i32 52, ; 94
	i32 44, ; 95
	i32 119, ; 96
	i32 248, ; 97
	i32 326, ; 98
	i32 254, ; 99
	i32 81, ; 100
	i32 136, ; 101
	i32 290, ; 102
	i32 235, ; 103
	i32 8, ; 104
	i32 73, ; 105
	i32 308, ; 106
	i32 155, ; 107
	i32 305, ; 108
	i32 154, ; 109
	i32 92, ; 110
	i32 300, ; 111
	i32 45, ; 112
	i32 323, ; 113
	i32 311, ; 114
	i32 304, ; 115
	i32 109, ; 116
	i32 209, ; 117
	i32 129, ; 118
	i32 25, ; 119
	i32 225, ; 120
	i32 72, ; 121
	i32 55, ; 122
	i32 46, ; 123
	i32 332, ; 124
	i32 208, ; 125
	i32 249, ; 126
	i32 180, ; 127
	i32 22, ; 128
	i32 263, ; 129
	i32 86, ; 130
	i32 43, ; 131
	i32 160, ; 132
	i32 188, ; 133
	i32 71, ; 134
	i32 276, ; 135
	i32 3, ; 136
	i32 42, ; 137
	i32 63, ; 138
	i32 16, ; 139
	i32 53, ; 140
	i32 335, ; 141
	i32 299, ; 142
	i32 105, ; 143
	i32 304, ; 144
	i32 297, ; 145
	i32 260, ; 146
	i32 34, ; 147
	i32 158, ; 148
	i32 85, ; 149
	i32 32, ; 150
	i32 12, ; 151
	i32 51, ; 152
	i32 203, ; 153
	i32 56, ; 154
	i32 280, ; 155
	i32 36, ; 156
	i32 195, ; 157
	i32 310, ; 158
	i32 298, ; 159
	i32 233, ; 160
	i32 35, ; 161
	i32 58, ; 162
	i32 197, ; 163
	i32 267, ; 164
	i32 183, ; 165
	i32 173, ; 166
	i32 17, ; 167
	i32 301, ; 168
	i32 164, ; 169
	i32 192, ; 170
	i32 323, ; 171
	i32 266, ; 172
	i32 207, ; 173
	i32 293, ; 174
	i32 329, ; 175
	i32 153, ; 176
	i32 199, ; 177
	i32 289, ; 178
	i32 274, ; 179
	i32 327, ; 180
	i32 235, ; 181
	i32 29, ; 182
	i32 52, ; 183
	i32 186, ; 184
	i32 325, ; 185
	i32 294, ; 186
	i32 5, ; 187
	i32 309, ; 188
	i32 284, ; 189
	i32 288, ; 190
	i32 240, ; 191
	i32 305, ; 192
	i32 232, ; 193
	i32 251, ; 194
	i32 85, ; 195
	i32 293, ; 196
	i32 61, ; 197
	i32 112, ; 198
	i32 57, ; 199
	i32 339, ; 200
	i32 280, ; 201
	i32 99, ; 202
	i32 19, ; 203
	i32 244, ; 204
	i32 111, ; 205
	i32 101, ; 206
	i32 181, ; 207
	i32 102, ; 208
	i32 307, ; 209
	i32 104, ; 210
	i32 0, ; 211
	i32 297, ; 212
	i32 71, ; 213
	i32 38, ; 214
	i32 32, ; 215
	i32 200, ; 216
	i32 103, ; 217
	i32 73, ; 218
	i32 222, ; 219
	i32 313, ; 220
	i32 9, ; 221
	i32 123, ; 222
	i32 46, ; 223
	i32 234, ; 224
	i32 210, ; 225
	i32 9, ; 226
	i32 43, ; 227
	i32 4, ; 228
	i32 281, ; 229
	i32 317, ; 230
	i32 212, ; 231
	i32 204, ; 232
	i32 312, ; 233
	i32 203, ; 234
	i32 31, ; 235
	i32 138, ; 236
	i32 92, ; 237
	i32 180, ; 238
	i32 93, ; 239
	i32 332, ; 240
	i32 49, ; 241
	i32 141, ; 242
	i32 112, ; 243
	i32 140, ; 244
	i32 250, ; 245
	i32 115, ; 246
	i32 298, ; 247
	i32 157, ; 248
	i32 76, ; 249
	i32 79, ; 250
	i32 270, ; 251
	i32 37, ; 252
	i32 292, ; 253
	i32 193, ; 254
	i32 254, ; 255
	i32 247, ; 256
	i32 64, ; 257
	i32 138, ; 258
	i32 15, ; 259
	i32 179, ; 260
	i32 116, ; 261
	i32 286, ; 262
	i32 295, ; 263
	i32 242, ; 264
	i32 48, ; 265
	i32 70, ; 266
	i32 80, ; 267
	i32 126, ; 268
	i32 94, ; 269
	i32 121, ; 270
	i32 302, ; 271
	i32 26, ; 272
	i32 263, ; 273
	i32 97, ; 274
	i32 28, ; 275
	i32 238, ; 276
	i32 330, ; 277
	i32 308, ; 278
	i32 149, ; 279
	i32 223, ; 280
	i32 169, ; 281
	i32 4, ; 282
	i32 98, ; 283
	i32 178, ; 284
	i32 33, ; 285
	i32 93, ; 286
	i32 285, ; 287
	i32 205, ; 288
	i32 21, ; 289
	i32 41, ; 290
	i32 170, ; 291
	i32 324, ; 292
	i32 256, ; 293
	i32 316, ; 294
	i32 270, ; 295
	i32 301, ; 296
	i32 295, ; 297
	i32 275, ; 298
	i32 2, ; 299
	i32 134, ; 300
	i32 111, ; 301
	i32 206, ; 302
	i32 336, ; 303
	i32 225, ; 304
	i32 333, ; 305
	i32 58, ; 306
	i32 95, ; 307
	i32 315, ; 308
	i32 39, ; 309
	i32 236, ; 310
	i32 25, ; 311
	i32 94, ; 312
	i32 89, ; 313
	i32 99, ; 314
	i32 10, ; 315
	i32 87, ; 316
	i32 186, ; 317
	i32 100, ; 318
	i32 282, ; 319
	i32 187, ; 320
	i32 189, ; 321
	i32 302, ; 322
	i32 227, ; 323
	i32 214, ; 324
	i32 312, ; 325
	i32 7, ; 326
	i32 267, ; 327
	i32 307, ; 328
	i32 224, ; 329
	i32 88, ; 330
	i32 191, ; 331
	i32 262, ; 332
	i32 154, ; 333
	i32 311, ; 334
	i32 33, ; 335
	i32 202, ; 336
	i32 116, ; 337
	i32 82, ; 338
	i32 20, ; 339
	i32 11, ; 340
	i32 162, ; 341
	i32 3, ; 342
	i32 219, ; 343
	i32 319, ; 344
	i32 208, ; 345
	i32 206, ; 346
	i32 176, ; 347
	i32 84, ; 348
	i32 306, ; 349
	i32 64, ; 350
	i32 321, ; 351
	i32 289, ; 352
	i32 143, ; 353
	i32 198, ; 354
	i32 271, ; 355
	i32 157, ; 356
	i32 41, ; 357
	i32 117, ; 358
	i32 190, ; 359
	i32 226, ; 360
	i32 315, ; 361
	i32 278, ; 362
	i32 131, ; 363
	i32 75, ; 364
	i32 66, ; 365
	i32 325, ; 366
	i32 172, ; 367
	i32 230, ; 368
	i32 185, ; 369
	i32 143, ; 370
	i32 106, ; 371
	i32 151, ; 372
	i32 70, ; 373
	i32 156, ; 374
	i32 213, ; 375
	i32 189, ; 376
	i32 121, ; 377
	i32 127, ; 378
	i32 320, ; 379
	i32 152, ; 380
	i32 253, ; 381
	i32 175, ; 382
	i32 141, ; 383
	i32 240, ; 384
	i32 317, ; 385
	i32 20, ; 386
	i32 14, ; 387
	i32 215, ; 388
	i32 135, ; 389
	i32 75, ; 390
	i32 59, ; 391
	i32 243, ; 392
	i32 167, ; 393
	i32 168, ; 394
	i32 217, ; 395
	i32 15, ; 396
	i32 74, ; 397
	i32 6, ; 398
	i32 23, ; 399
	i32 265, ; 400
	i32 224, ; 401
	i32 174, ; 402
	i32 91, ; 403
	i32 318, ; 404
	i32 1, ; 405
	i32 136, ; 406
	i32 266, ; 407
	i32 288, ; 408
	i32 134, ; 409
	i32 69, ; 410
	i32 177, ; 411
	i32 146, ; 412
	i32 199, ; 413
	i32 327, ; 414
	i32 306, ; 415
	i32 257, ; 416
	i32 207, ; 417
	i32 88, ; 418
	i32 96, ; 419
	i32 247, ; 420
	i32 252, ; 421
	i32 322, ; 422
	i32 31, ; 423
	i32 45, ; 424
	i32 261, ; 425
	i32 198, ; 426
	i32 213, ; 427
	i32 226, ; 428
	i32 109, ; 429
	i32 158, ; 430
	i32 35, ; 431
	i32 22, ; 432
	i32 114, ; 433
	i32 179, ; 434
	i32 57, ; 435
	i32 286, ; 436
	i32 144, ; 437
	i32 118, ; 438
	i32 120, ; 439
	i32 110, ; 440
	i32 228, ; 441
	i32 139, ; 442
	i32 174, ; 443
	i32 234, ; 444
	i32 54, ; 445
	i32 105, ; 446
	i32 328, ; 447
	i32 218, ; 448
	i32 219, ; 449
	i32 133, ; 450
	i32 300, ; 451
	i32 291, ; 452
	i32 279, ; 453
	i32 334, ; 454
	i32 257, ; 455
	i32 221, ; 456
	i32 159, ; 457
	i32 313, ; 458
	i32 244, ; 459
	i32 163, ; 460
	i32 132, ; 461
	i32 279, ; 462
	i32 161, ; 463
	i32 0, ; 464
	i32 326, ; 465
	i32 184, ; 466
	i32 268, ; 467
	i32 140, ; 468
	i32 291, ; 469
	i32 287, ; 470
	i32 169, ; 471
	i32 220, ; 472
	i32 229, ; 473
	i32 296, ; 474
	i32 40, ; 475
	i32 182, ; 476
	i32 255, ; 477
	i32 81, ; 478
	i32 178, ; 479
	i32 56, ; 480
	i32 37, ; 481
	i32 97, ; 482
	i32 166, ; 483
	i32 172, ; 484
	i32 202, ; 485
	i32 292, ; 486
	i32 82, ; 487
	i32 231, ; 488
	i32 98, ; 489
	i32 30, ; 490
	i32 159, ; 491
	i32 18, ; 492
	i32 127, ; 493
	i32 209, ; 494
	i32 119, ; 495
	i32 251, ; 496
	i32 282, ; 497
	i32 264, ; 498
	i32 284, ; 499
	i32 196, ; 500
	i32 165, ; 501
	i32 259, ; 502
	i32 341, ; 503
	i32 281, ; 504
	i32 272, ; 505
	i32 170, ; 506
	i32 16, ; 507
	i32 144, ; 508
	i32 319, ; 509
	i32 214, ; 510
	i32 125, ; 511
	i32 118, ; 512
	i32 38, ; 513
	i32 115, ; 514
	i32 47, ; 515
	i32 142, ; 516
	i32 117, ; 517
	i32 34, ; 518
	i32 173, ; 519
	i32 95, ; 520
	i32 53, ; 521
	i32 273, ; 522
	i32 129, ; 523
	i32 153, ; 524
	i32 24, ; 525
	i32 161, ; 526
	i32 250, ; 527
	i32 148, ; 528
	i32 104, ; 529
	i32 89, ; 530
	i32 238, ; 531
	i32 60, ; 532
	i32 142, ; 533
	i32 100, ; 534
	i32 5, ; 535
	i32 13, ; 536
	i32 122, ; 537
	i32 135, ; 538
	i32 28, ; 539
	i32 314, ; 540
	i32 212, ; 541
	i32 72, ; 542
	i32 248, ; 543
	i32 24, ; 544
	i32 236, ; 545
	i32 277, ; 546
	i32 274, ; 547
	i32 331, ; 548
	i32 137, ; 549
	i32 229, ; 550
	i32 245, ; 551
	i32 168, ; 552
	i32 278, ; 553
	i32 310, ; 554
	i32 101, ; 555
	i32 123, ; 556
	i32 249, ; 557
	i32 200, ; 558
	i32 191, ; 559
	i32 194, ; 560
	i32 163, ; 561
	i32 167, ; 562
	i32 252, ; 563
	i32 39, ; 564
	i32 216, ; 565
	i32 318, ; 566
	i32 177, ; 567
	i32 185, ; 568
	i32 17, ; 569
	i32 171, ; 570
	i32 331, ; 571
	i32 330, ; 572
	i32 137, ; 573
	i32 150, ; 574
	i32 241, ; 575
	i32 215, ; 576
	i32 155, ; 577
	i32 130, ; 578
	i32 19, ; 579
	i32 65, ; 580
	i32 147, ; 581
	i32 47, ; 582
	i32 338, ; 583
	i32 227, ; 584
	i32 79, ; 585
	i32 61, ; 586
	i32 106, ; 587
	i32 276, ; 588
	i32 231, ; 589
	i32 49, ; 590
	i32 262, ; 591
	i32 335, ; 592
	i32 273, ; 593
	i32 14, ; 594
	i32 190, ; 595
	i32 68, ; 596
	i32 171, ; 597
	i32 237, ; 598
	i32 241, ; 599
	i32 188, ; 600
	i32 340, ; 601
	i32 211, ; 602
	i32 78, ; 603
	i32 246, ; 604
	i32 108, ; 605
	i32 230, ; 606
	i32 193, ; 607
	i32 272, ; 608
	i32 67, ; 609
	i32 184, ; 610
	i32 63, ; 611
	i32 27, ; 612
	i32 160, ; 613
	i32 192, ; 614
	i32 239, ; 615
	i32 181, ; 616
	i32 10, ; 617
	i32 216, ; 618
	i32 11, ; 619
	i32 78, ; 620
	i32 126, ; 621
	i32 83, ; 622
	i32 195, ; 623
	i32 66, ; 624
	i32 107, ; 625
	i32 65, ; 626
	i32 128, ; 627
	i32 122, ; 628
	i32 77, ; 629
	i32 287, ; 630
	i32 277, ; 631
	i32 339, ; 632
	i32 8, ; 633
	i32 245, ; 634
	i32 2, ; 635
	i32 44, ; 636
	i32 290, ; 637
	i32 156, ; 638
	i32 128, ; 639
	i32 275, ; 640
	i32 23, ; 641
	i32 133, ; 642
	i32 233, ; 643
	i32 264, ; 644
	i32 334, ; 645
	i32 316, ; 646
	i32 29, ; 647
	i32 232, ; 648
	i32 223, ; 649
	i32 62, ; 650
	i32 218, ; 651
	i32 90, ; 652
	i32 87, ; 653
	i32 148, ; 654
	i32 220, ; 655
	i32 36, ; 656
	i32 86, ; 657
	i32 253, ; 658
	i32 329, ; 659
	i32 324, ; 660
	i32 194, ; 661
	i32 50, ; 662
	i32 6, ; 663
	i32 90, ; 664
	i32 336, ; 665
	i32 21, ; 666
	i32 162, ; 667
	i32 96, ; 668
	i32 50, ; 669
	i32 113, ; 670
	i32 269, ; 671
	i32 130, ; 672
	i32 76, ; 673
	i32 27, ; 674
	i32 246, ; 675
	i32 268, ; 676
	i32 7, ; 677
	i32 222, ; 678
	i32 217, ; 679
	i32 110, ; 680
	i32 269, ; 681
	i32 201, ; 682
	i32 255 ; 683
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

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
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
