Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647F92B51C7
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Nov 2020 21:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACB46E0E8;
	Mon, 16 Nov 2020 20:01:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5E56E0E8;
 Mon, 16 Nov 2020 20:01:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so20160981wrt.4;
 Mon, 16 Nov 2020 12:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i9rFlE2uudHRXHlUzGJW+/KB+kG0eK2nW0DHUFQV3e8=;
 b=q+JXSyXLhND8w0dYkWeaeitp2mVx9wpTTfBU7xRSH26LTJ48G01diXHvuyuLFo717T
 l2158FxGhiZC7L2W2nwfMVXCqv0sbbVgtOBayegdeHYEvz0afCsAymf8fynkWoBvCteN
 EQxUrGwMSeCPMdh5teEuKmSQyG+oBohnYPa7fFC/BnKdwNvvVEUhAlT0LYbv2wMNkQAO
 woqDTOvjWjLhIC7PZWeHCI2jWHIin2EA57R8a1kOQF6IcgrIQadVPKzIIRO0dMV5p8de
 FqoX/OQaFj//65XaPVCnimFIInBS7v1EPf3qChsPHLcnNP+wwhyhu/+ukGArLvGmFX+E
 rieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i9rFlE2uudHRXHlUzGJW+/KB+kG0eK2nW0DHUFQV3e8=;
 b=CBUZaGx4hKKGXa8akVSl0EGRSOH8cl62NukcU1JlkCNYT5fyEYrVABnL/AoQentC6i
 dFnLF00OWDAcCJDfvLj1fTTv0UYKSihoiGWsMH3N0X84mvSTlC6y4x5uXJ9NDsaERa6Y
 4EUz2beFp4ZlKGW59krjqC2oPJM5symh22NacU3aPOwG461JYSzvaPinoWQ/QCOV5eYF
 zu0PcmFGbLaMetdHj0STxalXf67h+R/778x2fpKy0DTq/JoHeHnhmMkhBWW3lGJpQQ+h
 kiDtWS9xz6PHADur9GeDI8wYB0+bRZoiXMAl6OTrK6Nls+cqFWLwrmmuN1NVca0O/6N9
 OUuw==
X-Gm-Message-State: AOAM530PVRXSq6bWWc2hjHa3igAedKP38R6S6kUgEBVlAancAfn9MT3W
 PMHOjKojnOZnvFKM77Qxg6Q9EE5Mj4iBoo446XHPFbZZ
X-Google-Smtp-Source: ABdhPJw/MvUfpsvlbnFT4Kd2k77E5jOI7/MIbWVoEjofECB9v1MTwKWyan5LhqxMEIXml5fzQK4kSclxi4iUM1gcNq0=
X-Received: by 2002:adf:e551:: with SMTP id z17mr21517670wrm.374.1605556890498; 
 Mon, 16 Nov 2020 12:01:30 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org>
 <20201116173700.1830487-18-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-18-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 15:01:19 -0500
Message-ID: <CADnq5_PyKMo3pH_qXTeX+hytn+2skrpBMVZynfWh4t1=6-T3NQ@mail.gmail.com>
Subject: Re: [PATCH 17/43] drm/radeon/evergreen_hdmi: Move 'evergreen_*()' and
 'dce4_*()' HDMI prototypes to shared header
To: Lee Jones <lee.jones@linaro.org>
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzcgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9oZG1pLmM6
Mzc6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2U0X2F1ZGlvX2Vu
YWJsZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
ZXZlcmdyZWVuX2hkbWkuYzo2Nzo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9y
IOKAmGV2ZXJncmVlbl9oZG1pX3VwZGF0ZV9hY3LigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+
ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9oZG1pLmM6OTc6Njogd2FybmluZzog
bm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2U0X2FmbXRfd3JpdGVfbGF0ZW5jeV9maWVs
ZHPigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2
ZXJncmVlbl9oZG1pLmM6MTE5OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig
4oCYZGNlNF9hZm10X2hkbWlfd3JpdGVfc3BlYWtlcl9hbGxvY2F0aW9u4oCZIFstV21pc3Npbmct
cHJvdG90eXBlc10KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5faGRtaS5jOjEz
Nzo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTRfYWZtdF9kcF93
cml0ZV9zcGVha2VyX2FsbG9jYXRpb27igJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9oZG1pLmM6MTU1OjY6IHdhcm5pbmc6IG5vIHBy
ZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZXZlcmdyZWVuX2hkbWlfd3JpdGVfc2FkX3JlZ3PigJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVl
bl9oZG1pLmM6MjA4OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZXZl
cmdyZWVuX3NldF9hdmlfcGFja2V04oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5faGRtaS5jOjIyNzo2OiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTRfaGRtaV9hdWRpb19zZXRfZHRv4oCZIFstV21pc3Np
bmctcHJvdG90eXBlc10KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5faGRtaS5j
OjI3MDo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTRfZHBfYXVk
aW9fc2V0X2R0b+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vZXZlcmdyZWVuX2hkbWkuYzozMDY6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciDigJhkY2U0X3NldF92YmlfcGFja2V04oCZIFstV21pc3NpbmctcHJvdG90eXBlc10K
PiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5faGRtaS5jOjMxNzo2OiB3YXJuaW5n
OiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTRfaGRtaV9zZXRfY29sb3JfZGVwdGji
gJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJn
cmVlbl9oZG1pLmM6MzU0OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCY
ZGNlNF9zZXRfYXVkaW9fcGFja2V04oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5faGRtaS5jOjM4OTo2OiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTRfc2V0X211dGXigJkgWy1XbWlzc2luZy1wcm90b3R5
cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9oZG1pLmM6NDAwOjY6IHdh
cm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZXZlcmdyZWVuX2hkbWlfZW5hYmxl
4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVy
Z3JlZW5faGRtaS5jOjQ0MDo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKA
mGV2ZXJncmVlbl9kcF9lbmFibGXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+Cj4gQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBL
w7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENj
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KCkFwcGxpZWQgd2l0aCBtaW5vciBjaGFuZ2VzLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5faGRtaS5jIHwgIDEgKwo+ICBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9oZG1pLmggfCA2OSArKysrKysrKysrKysrKysr
KysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F1ZGlvLmMgICB8IDI2
ICstLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCAyNSBkZWxl
dGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZl
cmdyZWVuX2hkbWkuaAo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZl
cmdyZWVuX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2hkbWkuYwo+
IGluZGV4IDczOTMzNmE0OGQwODUuLjVmMzA3OGY4YWI5NTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5faGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9ldmVyZ3JlZW5faGRtaS5jCj4gQEAgLTI3LDYgKzI3LDcgQEAKPiAgI2luY2x1ZGUg
PGxpbnV4L2hkbWkuaD4KPgo+ICAjaW5jbHVkZSA8ZHJtL3JhZGVvbl9kcm0uaD4KPiArI2luY2x1
ZGUgImV2ZXJncmVlbl9oZG1pLmgiCj4gICNpbmNsdWRlICJyYWRlb24uaCIKPiAgI2luY2x1ZGUg
InJhZGVvbl9hc2ljLmgiCj4gICNpbmNsdWRlICJyYWRlb25fYXVkaW8uaCIKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5faGRtaS5oIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9ldmVyZ3JlZW5faGRtaS5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAwLi5jODYyNzZiOGQ3ZjU4Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2hkbWkuaAo+IEBAIC0wLDAgKzEsNjkgQEAK
PiArLyogZXZlcmdyZWVuX2hkbWkuaCAtLSBQcml2YXRlIGhlYWRlciBmb3IgcmFkZW9uIGRyaXZl
ciAtKi0gbGludXgtYyAtKi0KPiArICoKPiArICogQ29weXJpZ2h0IDE5OTkgUHJlY2lzaW9uIElu
c2lnaHQsIEluYy4sIENlZGFyIFBhcmssIFRleGFzLgo+ICsgKiBDb3B5cmlnaHQgMjAwMCBWQSBM
aW51eCBTeXN0ZW1zLCBJbmMuLCBGcmVtb250LCBDYWxpZm9ybmlhLgo+ICsgKiBBbGwgcmlnaHRz
IHJlc2VydmVkLgo+ICsgKgo+ICsgKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVl
IG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQo+ICsgKiBjb3B5IG9mIHRoaXMg
c29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2Fy
ZSIpLAo+ICsgKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBp
bmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uCj4gKyAqIHRoZSByaWdodHMgdG8gdXNlLCBjb3B5
LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLAo+ICsgKiBh
bmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMg
dG8gd2hvbSB0aGUKPiArICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0
IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKPiArICoKPiArICogVGhlIGFib3ZlIGNvcHly
aWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2UgKGluY2x1ZGluZyB0aGUgbmV4
dAo+ICsgKiBwYXJhZ3JhcGgpIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFsbCBjb3BpZXMgb3Igc3Vi
c3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlCj4gKyAqIFNvZnR3YXJlLgo+ICsgKgo+ICsgKiBUSEUg
U09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lO
RCwgRVhQUkVTUyBPUgo+ICsgKiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRP
IFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKPiArICogRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5PIEVWRU5UIFNIQUxM
Cj4gKyAqIFBSRUNJU0lPTiBJTlNJR0hUIEFORC9PUiBJVFMgU1VQUExJRVJTIEJFIExJQUJMRSBG
T1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SCj4gKyAqIE9USEVSIExJQUJJTElUWSwgV0hFVEhFUiBJ
TiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLAo+ICsgKiBBUklTSU5H
IEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBV
U0UgT1IgT1RIRVIKPiArICogREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgo+ICsgKgo+ICsgKi8K
PiArCj4gKyNpZm5kZWYgX19FVkVSR1JFRU5fSERNSV9IX18KPiArI2RlZmluZSBfX0VWRVJHUkVF
Tl9IRE1JX0hfXwo+ICsKPiArc3RydWN0IGNlYV9zYTsKPiArc3RydWN0IGNlYV9zYWQ7Cj4gK3N0
cnVjdCBkcm1fY29ubmVjdG9yOwo+ICtzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZTsKPiArc3RydWN0
IGRybV9lbmNvZGVyOwo+ICtzdHJ1Y3QgcjYwMF9hdWRpb19waW47Cj4gK3N0cnVjdCByYWRlb25f
Y3J0YzsKPiArc3RydWN0IHJhZGVvbl9kZXZpY2U7Cj4gK3N0cnVjdCByYWRlb25faGRtaV9hY3I7
Cj4gKwo+ICt2b2lkIGV2ZXJncmVlbl9oZG1pX3dyaXRlX3NhZF9yZWdzKHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBjZWFfc2FkICpzYWRzLCBpbnQgc2FkX2NvdW50KTsKPiArdm9pZCBldmVyZ3JlZW5fc2V0X2F2
aV9wYWNrZXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHUzMiBvZmZzZXQsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgY2hhciAqYnVmZmVyLCBzaXplX3Qgc2l6
ZSk7Cj4gK3ZvaWQgZXZlcmdyZWVuX2hkbWlfdXBkYXRlX2FjcihzdHJ1Y3QgZHJtX2VuY29kZXIg
KmVuY29kZXIsIGxvbmcgb2Zmc2V0LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgcmFkZW9uX2hkbWlfYWNyICphY3IpOwo+ICt2b2lkIGV2ZXJncmVlbl9oZG1p
X2VuYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIGJvb2wgZW5hYmxlKTsKPiArdm9p
ZCBldmVyZ3JlZW5fZHBfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgYm9vbCBl
bmFibGUpOwo+ICsKPiArdm9pZCBkY2U0X2F1ZGlvX2VuYWJsZShzdHJ1Y3QgcmFkZW9uX2Rldmlj
ZSAqcmRldiwgc3RydWN0IHI2MDBfYXVkaW9fcGluICpwaW4sCj4gKyAgICAgICAgICAgICAgICAg
ICAgICB1OCBlbmFibGVfbWFzayk7Cj4gK3ZvaWQgZGNlNF9hZm10X2hkbWlfd3JpdGVfc3BlYWtl
cl9hbGxvY2F0aW9uKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1OCAqc2FkYiwgaW50IHNhZF9jb3VudCk7
Cj4gK3ZvaWQgZGNlNF9hZm10X2RwX3dyaXRlX3NwZWFrZXJfYWxsb2NhdGlvbihzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHU4ICpzYWRiLCBpbnQgc2FkX2NvdW50KTsKPiArdm9pZCBkY2U0X2FmbXRfd3JpdGVf
bGF0ZW5jeV9maWVsZHMoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Is
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKm1vZGUpOwo+ICt2b2lkIGRjZTRfaGRtaV9hdWRpb19zZXRfZHRvKHN0cnVjdCByYWRl
b25fZGV2aWNlICpyZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJh
ZGVvbl9jcnRjICpjcnRjLCB1bnNpZ25lZCBpbnQgY2xvY2spOwo+ICt2b2lkIGRjZTRfZHBfYXVk
aW9fc2V0X2R0byhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgcmFkZW9uX2NydGMgKmNydGMsIHVuc2lnbmVkIGludCBjbG9jayk7
Cj4gK3ZvaWQgZGNlNF9zZXRfdmJpX3BhY2tldChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIs
IHUzMiBvZmZzZXQpOwo+ICt2b2lkIGRjZTRfaGRtaV9zZXRfY29sb3JfZGVwdGgoc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIg
b2Zmc2V0LCBpbnQgYnBjKTsKPiArdm9pZCBkY2U0X3NldF9hdWRpb19wYWNrZXQoc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyLCB1MzIgb2Zmc2V0KTsKPiArdm9pZCBkY2U0X3NldF9tdXRlKHN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgdTMyIG9mZnNldCwgYm9vbCBtdXRlKTsKPiArCj4g
KyNlbmRpZiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBfX0VWRVJHUkVFTl9IRE1JX0hfXyAq
Lwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdWRpby5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXVkaW8uYwo+IGluZGV4IGY2Yzc4M2UxOWM5
ODguLjNjYzUzZGIwNGQ2NDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fYXVkaW8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F1ZGlv
LmMKPiBAQCAtMjUsMzMgKzI1LDI0IEBACj4gICNpbmNsdWRlIDxsaW51eC9nY2QuaD4KPgo+ICAj
aW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+Cj4gKyNpbmNsdWRlICJldmVyZ3JlZW5faGRtaS5oIgo+
ICAjaW5jbHVkZSAicmFkZW9uLmgiCj4gICNpbmNsdWRlICJhdG9tLmgiCj4gICNpbmNsdWRlICJy
YWRlb25fYXVkaW8uaCIKPgo+ICB2b2lkIHI2MDBfYXVkaW9fZW5hYmxlKHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2LCBzdHJ1Y3QgcjYwMF9hdWRpb19waW4gKnBpbiwKPiAgICAgICAgICAgICAg
ICAgdTggZW5hYmxlX21hc2spOwo+IC12b2lkIGRjZTRfYXVkaW9fZW5hYmxlKHN0cnVjdCByYWRl
b25fZGV2aWNlICpyZGV2LCBzdHJ1Y3QgcjYwMF9hdWRpb19waW4gKnBpbiwKPiAtICAgICAgICAg
ICAgICAgdTggZW5hYmxlX21hc2spOwo+ICB2b2lkIGRjZTZfYXVkaW9fZW5hYmxlKHN0cnVjdCBy
YWRlb25fZGV2aWNlICpyZGV2LCBzdHJ1Y3QgcjYwMF9hdWRpb19waW4gKnBpbiwKPiAgICAgICAg
ICAgICAgICAgdTggZW5hYmxlX21hc2spOwo+ICB1MzIgZGNlNl9lbmRwb2ludF9ycmVnKHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2LCB1MzIgb2Zmc2V0LCB1MzIgcmVnKTsKPiAgdm9pZCBkY2U2
X2VuZHBvaW50X3dyZWcoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCj4gICAgICAgICAgICAg
ICAgIHUzMiBvZmZzZXQsIHUzMiByZWcsIHUzMiB2KTsKPiAtdm9pZCBldmVyZ3JlZW5faGRtaV93
cml0ZV9zYWRfcmVncyhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gLSAgICAgICAgICAg
ICAgIHN0cnVjdCBjZWFfc2FkICpzYWRzLCBpbnQgc2FkX2NvdW50KTsKPiAgdm9pZCBkY2U2X2Fm
bXRfd3JpdGVfc2FkX3JlZ3Moc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+ICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgY2VhX3NhZCAqc2FkcywgaW50IHNhZF9jb3VudCk7Cj4gLXZvaWQgZGNl
NF9hZm10X2hkbWlfd3JpdGVfc3BlYWtlcl9hbGxvY2F0aW9uKHN0cnVjdCBkcm1fZW5jb2RlciAq
ZW5jb2RlciwKPiAtICAgICAgICAgICAgICAgdTggKnNhZGIsIGludCBzYWRfY291bnQpOwo+IC12
b2lkIGRjZTRfYWZtdF9kcF93cml0ZV9zcGVha2VyX2FsbG9jYXRpb24oc3RydWN0IGRybV9lbmNv
ZGVyICplbmNvZGVyLAo+IC0gICAgICAgICAgICAgICB1OCAqc2FkYiwgaW50IHNhZF9jb3VudCk7
Cj4gIHZvaWQgZGNlNl9hZm10X2hkbWlfd3JpdGVfc3BlYWtlcl9hbGxvY2F0aW9uKHN0cnVjdCBk
cm1fZW5jb2RlciAqZW5jb2RlciwKPiAgICAgICAgICAgICAgICAgdTggKnNhZGIsIGludCBzYWRf
Y291bnQpOwo+ICB2b2lkIGRjZTZfYWZtdF9kcF93cml0ZV9zcGVha2VyX2FsbG9jYXRpb24oc3Ry
dWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+ICAgICAgICAgICAgICAgICB1OCAqc2FkYiwgaW50
IHNhZF9jb3VudCk7Cj4gLXZvaWQgZGNlNF9hZm10X3dyaXRlX2xhdGVuY3lfZmllbGRzKHN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiAtICAgICAgICAgICAgICAgc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwo+ICB2b2lk
IGRjZTZfYWZtdF93cml0ZV9sYXRlbmN5X2ZpZWxkcyhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29k
ZXIsCj4gICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIHN0
cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKTsKPiAgc3RydWN0IHI2MDBfYXVkaW9fcGluKiBy
NjAwX2F1ZGlvX2dldF9waW4oc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+IEBAIC01OSwz
NyArNTAsMjIgQEAgc3RydWN0IHI2MDBfYXVkaW9fcGluKiBkY2U2X2F1ZGlvX2dldF9waW4oc3Ry
dWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+ICB2b2lkIGRjZTZfYWZtdF9zZWxlY3RfcGluKHN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rlcik7Cj4gIHZvaWQgcjYwMF9oZG1pX2F1ZGlvX3NldF9k
dG8oc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCj4gICAgICAgICBzdHJ1Y3QgcmFkZW9uX2Ny
dGMgKmNydGMsIHVuc2lnbmVkIGludCBjbG9jayk7Cj4gLXZvaWQgZGNlNF9oZG1pX2F1ZGlvX3Nl
dF9kdG8oc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCj4gLSAgICAgICBzdHJ1Y3QgcmFkZW9u
X2NydGMgKmNydGMsIHVuc2lnbmVkIGludCBjbG9jayk7Cj4gLXZvaWQgZGNlNF9kcF9hdWRpb19z
ZXRfZHRvKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+IC0gICAgICAgc3RydWN0IHJhZGVv
bl9jcnRjICpjcnRjLCB1bnNpZ25lZCBpbnQgY2xvY2spOwo+ICB2b2lkIGRjZTZfaGRtaV9hdWRp
b19zZXRfZHRvKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+ICAgICAgICAgc3RydWN0IHJh
ZGVvbl9jcnRjICpjcnRjLCB1bnNpZ25lZCBpbnQgY2xvY2spOwo+ICB2b2lkIGRjZTZfZHBfYXVk
aW9fc2V0X2R0byhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKPiAgICAgICAgIHN0cnVjdCBy
YWRlb25fY3J0YyAqY3J0YywgdW5zaWduZWQgaW50IGNsb2NrKTsKPiAgdm9pZCByNjAwX3NldF9h
dmlfcGFja2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCB1MzIgb2Zmc2V0LAo+ICAgICAg
ICAgdW5zaWduZWQgY2hhciAqYnVmZmVyLCBzaXplX3Qgc2l6ZSk7Cj4gLXZvaWQgZXZlcmdyZWVu
X3NldF9hdmlfcGFja2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCB1MzIgb2Zmc2V0LAo+
IC0gICAgICAgdW5zaWduZWQgY2hhciAqYnVmZmVyLCBzaXplX3Qgc2l6ZSk7Cj4gIHZvaWQgcjYw
MF9oZG1pX3VwZGF0ZV9hY3Ioc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCBsb25nIG9mZnNl
dCwKPiAgICAgICAgIGNvbnN0IHN0cnVjdCByYWRlb25faGRtaV9hY3IgKmFjcik7Cj4gLXZvaWQg
ZXZlcmdyZWVuX2hkbWlfdXBkYXRlX2FjcihzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIGxv
bmcgb2Zmc2V0LAo+IC0gICAgICAgY29uc3Qgc3RydWN0IHJhZGVvbl9oZG1pX2FjciAqYWNyKTsK
PiAgdm9pZCByNjAwX3NldF92YmlfcGFja2V0KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rlciwg
dTMyIG9mZnNldCk7Cj4gLXZvaWQgZGNlNF9zZXRfdmJpX3BhY2tldChzdHJ1Y3QgZHJtX2VuY29k
ZXIgKmVuY29kZXIsIHUzMiBvZmZzZXQpOwo+IC12b2lkIGRjZTRfaGRtaV9zZXRfY29sb3JfZGVw
dGgoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+IC0gICAgICAgdTMyIG9mZnNldCwgaW50
IGJwYyk7Cj4gIHZvaWQgcjYwMF9zZXRfYXVkaW9fcGFja2V0KHN0cnVjdCBkcm1fZW5jb2RlciAq
ZW5jb2RlciwgdTMyIG9mZnNldCk7Cj4gLXZvaWQgZGNlNF9zZXRfYXVkaW9fcGFja2V0KHN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jb2RlciwgdTMyIG9mZnNldCk7Cj4gIHZvaWQgcjYwMF9zZXRfbXV0
ZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIHUzMiBvZmZzZXQsIGJvb2wgbXV0ZSk7Cj4g
LXZvaWQgZGNlNF9zZXRfbXV0ZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIHUzMiBvZmZz
ZXQsIGJvb2wgbXV0ZSk7Cj4gIHN0YXRpYyB2b2lkIHJhZGVvbl9hdWRpb19oZG1pX21vZGVfc2V0
KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiAgICAgICAgIHN0cnVjdCBkcm1fZGlzcGxh
eV9tb2RlICptb2RlKTsKPiAgc3RhdGljIHZvaWQgcmFkZW9uX2F1ZGlvX2RwX21vZGVfc2V0KHN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiAgICAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9t
b2RlICptb2RlKTsKPiAgdm9pZCByNjAwX2hkbWlfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAq
ZW5jb2RlciwgYm9vbCBlbmFibGUpOwo+IC12b2lkIGV2ZXJncmVlbl9oZG1pX2VuYWJsZShzdHJ1
Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIGJvb2wgZW5hYmxlKTsKPiAtdm9pZCBldmVyZ3JlZW5f
ZHBfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgYm9vbCBlbmFibGUpOwo+Cj4g
IHN0YXRpYyBjb25zdCB1MzIgcGluX29mZnNldHNbN10gPQo+ICB7Cj4gLS0KPiAyLjI1LjEKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
