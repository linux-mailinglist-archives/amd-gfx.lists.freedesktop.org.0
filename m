Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EE22B5141
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Nov 2020 20:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7E689C16;
	Mon, 16 Nov 2020 19:36:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A02289C16;
 Mon, 16 Nov 2020 19:36:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 23so556187wmg.1;
 Mon, 16 Nov 2020 11:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Jd4NYM09nIgiVAxjCFV+Ai4BIQhFfa+s3Pg4oNazxak=;
 b=CMWIMP7HUXJzq1+JtJzn9l3x3/CrNuPx77v46/Ed7ywYzt3NoaI1eqWV/WN8oPamWc
 J3dOmYoD/qBMPgXZov1nuN8GmZV1qZaNfBOuxmgi1IAZpDm61f12LQFDt5q8B6UM0b7l
 QjLjRvLakB8D74LobNOJxDLu2at+GI/VOffClcvjIVc8aGpTOFpWnZmXS3XaHR0o+AbK
 DOF2bPGV6P5C9vyTZKzcZdImYYDPK3w8qN8+g9GhxTizJ494golUxzC3a3MSP8EzrslI
 nqaHJ1uusiMSB+1na22w/WQVNL8wWyJtky3FKB3Xtj6zHmaihhsWolLQIp5N3oMisy0G
 gskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Jd4NYM09nIgiVAxjCFV+Ai4BIQhFfa+s3Pg4oNazxak=;
 b=HH+o6NC2cGkwUayDcU1E7rYX2UU0+Ld8jog5i6QbZk/AHEHY3mOvOOzI58bMKoT1Xi
 cqjd9cPUstq3Nym8ltYTo+ksJiQ+QDntsOQBpaW0ScWbJUAQX1JGIcodHyJ25e0bigh6
 WE4eIv10HoqqZMIIpQq8q+gWVPQ/ZTeuYP4y2I/meCZ/O+XrhS/QWzHH4Zsu+MlxvWNt
 pFHkzofmpDrX2IFHEzHU5UdeImG2SREJl0xqCkt2sAEEDxCsCq5nf/MlZ3YGVwpAxMD+
 ElGuZT+/tM5XjMWur+cgEmvXzCmMXEjibwsAlN/XYOgwsDuud7GwlUGVtKjGkWSgV5lT
 wbpA==
X-Gm-Message-State: AOAM533CtmTeyNfH+iHtt2ZfQ7yrAVhoZcz0jIIMGLBikhUGSvwTKpcS
 RMv1SOJiPkJTjB/fXGxWnJo4RnjTS6x3hwbQ2j8=
X-Google-Smtp-Source: ABdhPJwwedHpQP8TC22Plw3AmPLyM53Oqs5C6ao4BlprKxqBsMtvBBZFpha3W4NY0cIvWVuoBd1EO7VcpHjzLZyJmaQ=
X-Received: by 2002:a7b:c015:: with SMTP id c21mr468641wmb.79.1605555378107;
 Mon, 16 Nov 2020 11:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20201116173005.1825880-1-lee.jones@linaro.org>
 <20201116173005.1825880-6-lee.jones@linaro.org>
In-Reply-To: <20201116173005.1825880-6-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 14:36:07 -0500
Message-ID: <CADnq5_N0FVXjao6W+kNQJAMmL2ARt1Qw2A6726=Vh2jN_ms8jA@mail.gmail.com>
Subject: Re: [PATCH 05/43] drm/radeon: Move radeon_ttm{init,
 fini} to shared location
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzAgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYzogQXQg
dG9wIGxldmVsOgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYzo4MTc6NTog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhyYWRlb25fdHRtX2luaXTigJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICA4MTcgfCBpbnQgcmFkZW9uX3R0bV9pbml0KHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2KQo+ICB8IF5+fn5+fn5+fn5+fn5+fgo+ICBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYzo4Nzg6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJv
dG90eXBlIGZvciDigJhyYWRlb25fdHRtX2ZpbmnigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+
ICA4NzggfCB2b2lkIHJhZGVvbl90dG1fZmluaShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikK
PiAgfCBefn5+fn5+fn5+fn5+fn4KPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13
YWxAbGluYXJvLm9yZz4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtl
cm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gU2lnbmVkLW9m
Zi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3Mh
CgpBbGV4CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMg
fCAgMyArLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgICAgfCAgMSAr
Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5oICAgIHwgMzYgKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fdHRtLmgKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5jCj4g
aW5kZXggYWI4MWUzNWNiMDYwNi4uOGJjNWFkMWQ2NTg1NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX29iamVjdC5jCj4gQEAgLTQwLDkgKzQwLDggQEAKPgo+ICAjaW5jbHVkZSAi
cmFkZW9uLmgiCj4gICNpbmNsdWRlICJyYWRlb25fdHJhY2UuaCIKPiArI2luY2x1ZGUgInJhZGVv
bl90dG0uaCIKPgo+IC1pbnQgcmFkZW9uX3R0bV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpy
ZGV2KTsKPiAtdm9pZCByYWRlb25fdHRtX2Zpbmkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYp
Owo+ICBzdGF0aWMgdm9pZCByYWRlb25fYm9fY2xlYXJfc3VyZmFjZV9yZWcoc3RydWN0IHJhZGVv
bl9ibyAqYm8pOwo+Cj4gIC8qCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiBpbmRl
eCAyOTM5ZTcxY2ViNzAwLi4yOGIzMDBlZDIwMGVhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fdHRtLmMKPiBAQCAtNTEsNiArNTEsNyBAQAo+Cj4gICNpbmNsdWRlICJyYWRlb25fcmVn
LmgiCj4gICNpbmNsdWRlICJyYWRlb24uaCIKPiArI2luY2x1ZGUgInJhZGVvbl90dG0uaCIKPgo+
ICBzdGF0aWMgaW50IHJhZGVvbl90dG1fZGVidWdmc19pbml0KHN0cnVjdCByYWRlb25fZGV2aWNl
ICpyZGV2KTsKPiAgc3RhdGljIHZvaWQgcmFkZW9uX3R0bV9kZWJ1Z2ZzX2Zpbmkoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl90dG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5oCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi45MWVhNzE0MWJjODEyCj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5o
Cj4gQEAgLTAsMCArMSwzNiBAQAo+ICsvKiByYWRlb25fdHRtLmggLS0gUHJpdmF0ZSBoZWFkZXIg
Zm9yIHJhZGVvbiBkcml2ZXIgLSotIGxpbnV4LWMgLSotCj4gKyAqCj4gKyAqIENvcHlyaWdodCAx
OTk5IFByZWNpc2lvbiBJbnNpZ2h0LCBJbmMuLCBDZWRhciBQYXJrLCBUZXhhcy4KPiArICogQ29w
eXJpZ2h0IDIwMDAgVkEgTGludXggU3lzdGVtcywgSW5jLiwgRnJlbW9udCwgQ2FsaWZvcm5pYS4K
PiArICogQWxsIHJpZ2h0cyByZXNlcnZlZC4KPiArICoKPiArICogUGVybWlzc2lvbiBpcyBoZXJl
YnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEKPiAr
ICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmls
ZXMgKHRoZSAiU29mdHdhcmUiKSwKPiArICogdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91
dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbgo+ICsgKiB0aGUgcmln
aHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3Vi
bGljZW5zZSwKPiArICogYW5kL29yIHNlbGwgY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRv
IHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlCj4gKyAqIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0
byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6Cj4gKyAqCj4gKyAq
IFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIChp
bmNsdWRpbmcgdGhlIG5leHQKPiArICogcGFyYWdyYXBoKSBzaGFsbCBiZSBpbmNsdWRlZCBpbiBh
bGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZQo+ICsgKiBTb2Z0d2FyZS4K
PiArICoKPiArICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FS
UkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKPiArICogSU1QTElFRCwgSU5DTFVESU5HIEJV
VCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCj4gKyAq
IEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuICBJ
TiBOTyBFVkVOVCBTSEFMTAo+ICsgKiBQUkVDSVNJT04gSU5TSUdIVCBBTkQvT1IgSVRTIFNVUFBM
SUVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUgo+ICsgKiBPVEhFUiBMSUFC
SUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lT
RSwKPiArICogQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBT
T0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSCj4gKyAqIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FS
RS4KPiArICoKPiArICovCj4gKwo+ICsjaWZuZGVmIF9fUkFERU9OX1RUTV9IX18KPiArI2RlZmlu
ZSBfX1JBREVPTl9UVE1fSF9fCj4gKwo+ICtzdHJ1Y3QgcmFkZW9uX2RldmljZTsKPiArCj4gK2lu
dCByYWRlb25fdHRtX2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+ICt2b2lkIHJh
ZGVvbl90dG1fZmluaShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4gKwo+ICsjZW5kaWYg
ICAgICAgICAgICAgICAgICAgICAgICAgLyogX19SQURFT05fVFRNX0hfXyAqLwo+IC0tCj4gMi4y
NS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
