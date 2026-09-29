# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.

# Retrofit annotations and interfaces
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes RuntimeVisibleAnnotations
-keepattributes RuntimeInvisibleAnnotations
-keepattributes RuntimeVisibleParameterAnnotations
-keepattributes RuntimeInvisibleParameterAnnotations

-keep interface retrofit2.** { *; }
-keep class retrofit2.** { *; }
-keep class okhttp3.** { *; }
-keep class okio.** { *; }

# PayHere Classes
-keep class lk.payhere.** { *; }
-keep interface lk.payhere.androidsdk.PayhereSDK { *; }
-keep interface u2.c { *; }
-keep class lk.payhere.androidsdk.models.PaymentMethodResponse { *; }
-keep class lk.payhere.androidsdk.models.** { *; }
-keep class lk.payhere.androidsdk.** { *; }

# Keep annotation classes
-dontwarn javax.annotation.**
-dontwarn org.conscrypt.**
-dontwarn org.bouncycastle.**
-dontwarn org.openjsse.**

# OkHttp platform
-dontwarn okhttp3.internal.platform.**
-dontwarn org.conscrypt.ConscryptHostnameVerifier

# Keep generic signature of retrofit2.Call, Response
-keepattributes Signature
-keepattributes Exceptions

# JSR 305 annotations
-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.ParametersAreNonnullByDefault
-dontwarn javax.annotation.concurrent.GuardedBy
