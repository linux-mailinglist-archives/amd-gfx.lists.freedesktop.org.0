Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A112B50F8
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Nov 2020 20:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDD96E098;
	Mon, 16 Nov 2020 19:25:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83DB6E098;
 Mon, 16 Nov 2020 19:25:14 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h21so363923wmb.2;
 Mon, 16 Nov 2020 11:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mg9GFMofk+sNZIbonQjgi+ktaHQagod8RuLC5zHvQK0=;
 b=rB+vEPl48Ca+f8EI7f5SO2q5/LWEbc7bSHAJFRsPimkl1j36X/0nzRpHjlCiydJnfC
 CucGh4QUOtpZgxue52ccVifl2nPuI7uSEbLRGQFk+ABL+uTErfD2mOa7yX4ErdxLEk76
 hp/pyV5Wv5/0XTWfR+pDstfw1hh+ujOFB4OOFPgDYvXrcHMfMDiJHRtPnXUK62EwhDFZ
 9uoac2oh4WipImhJSkHG1s+/bZ2QPe3Gs8Lu2TbxCQkE072uNBxWMEhBMntfsLmgG8HA
 fDUVQA9MGKibcMakQr1LF37EVK5EK/IKTD5ark56QHlTpDdAR1qoKG1+1K6WMzZ2wnAX
 jOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mg9GFMofk+sNZIbonQjgi+ktaHQagod8RuLC5zHvQK0=;
 b=IiQmycTGBI9kDg8nNZLW+Z/fUIVrAtQRHh4vAifdKX0jyeGoHZFXFaX17re12wtQkB
 RueKRp8h7882PFbOEvhRjdwUhWW8Hn6yC6z6YnCSun5sVR2vJkJPiUsHt88xtT7LqahU
 RKcpt71o8v+8I+FSvFwoWFJM851OHn9mxDVZZVgf6gK8pTTNmQy2dQMf4NG2wOT0vPPq
 AEdoe+In4rVRGQ9dSbd5aAzzrUIjDpuHXE1nzacbfMrb3VX8sfRcq52ktkbm1kTLmFHu
 w/DkkZnBpftNMnVI2wMW1gXLbaUsJjqMoQlzev9WdRSeVYHGCdxJ7r6AIcQ5sKVm3BEs
 284w==
X-Gm-Message-State: AOAM533XgyIXMCs3sgkpGRmZ0roMnQbI9Np2KCvx17CL+MS+9KdEB1ZL
 RMfDpVPj96vd5R9CB4t57L2GZyTptLXMKOl4GNc=
X-Google-Smtp-Source: ABdhPJz0HZu46+nxNC8z8L+/DfcnRH3UuWmiHnBVvanfqFzICAnYk6XZyIPNfEadutzPlrSwLNJ7M1XR78sOdKUBGZk=
X-Received: by 2002:a1c:2dc8:: with SMTP id t191mr56014wmt.73.1605554713457;
 Mon, 16 Nov 2020 11:25:13 -0800 (PST)
MIME-Version: 1.0
References: <20201116173005.1825880-1-lee.jones@linaro.org>
 <20201116173005.1825880-2-lee.jones@linaro.org>
In-Reply-To: <20201116173005.1825880-2-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 14:25:02 -0500
Message-ID: <CADnq5_NnPiySfPv4Jgk4j8rvzxYkoVxRBGUAjdQJW_tL2RuTBA@mail.gmail.com>
Subject: Re: [PATCH 01/43] drm/radeon/atombios_encoders: Move
 'radeon_atom_get_tv_timings()'s prototype into shared location
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

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzAgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdG9tYmlvcy5j
OjE3OTE6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhyYWRlb25fYXRv
bV9nZXRfdHZfdGltaW5nc+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDE3OTEgfCBib29s
IHJhZGVvbl9hdG9tX2dldF90dl90aW1pbmdzKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBp
bnQgaW5kZXgsCj4gIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPgo+IENjOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmln
IiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9hdG9tYmlvc19lbmNvZGVycy5jIHwgIDUgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2F0b21iaW9zLmMgICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fYXRvbWJpb3MuaCAgIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNo
YW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdG9tYmlvcy5oCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tYmlvc19lbmNvZGVycy5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9hdG9tYmlvc19lbmNvZGVycy5jCj4gaW5kZXggY2M1ZWUxYjNhZjg0
Zi4uNjgzZGUxOThlMThkOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0
b21iaW9zX2VuY29kZXJzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b21iaW9z
X2VuY29kZXJzLmMKPiBAQCAtMzMsNiArMzMsNyBAQAo+ICAjaW5jbHVkZSA8ZHJtL3JhZGVvbl9k
cm0uaD4KPgo+ICAjaW5jbHVkZSAiYXRvbS5oIgo+ICsjaW5jbHVkZSAicmFkZW9uX2F0b21iaW9z
LmgiCj4gICNpbmNsdWRlICJyYWRlb24uaCIKPiAgI2luY2x1ZGUgInJhZGVvbl9hc2ljLmgiCj4g
ICNpbmNsdWRlICJyYWRlb25fYXVkaW8uaCIKPiBAQCAtMjk2LDEwICsyOTcsNiBAQCBzdGF0aWMg
dm9pZCByYWRlb25fYXRvbV9iYWNrbGlnaHRfZXhpdChzdHJ1Y3QgcmFkZW9uX2VuY29kZXIgKmVu
Y29kZXIpCj4KPiAgI2VuZGlmCj4KPiAtLyogZXZpbCBidXQgaW5jbHVkaW5nIGF0b21iaW9zLmgg
aXMgbXVjaCB3b3JzZSAqLwo+IC1ib29sIHJhZGVvbl9hdG9tX2dldF90dl90aW1pbmdzKHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2LCBpbnQgaW5kZXgsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7Cj4gLQo+ICBzdGF0aWMg
Ym9vbCByYWRlb25fYXRvbV9tb2RlX2ZpeHVwKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICptb2RlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGRybV9kaXNwbGF5X21vZGUgKmFkanVzdGVkX21vZGUpCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9hdG9tYmlvcy5jCj4gaW5kZXggNWQyNTkxNzI1MTg5Mi4uNzFiZjJlZDE3MjY5
NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdG9tYmlvcy5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYwo+IEBAIC0z
NCw2ICszNCw3IEBACj4gICNpbmNsdWRlICJhdG9tLmgiCj4gICNpbmNsdWRlICJhdG9tLWJpdHMu
aCIKPiAgI2luY2x1ZGUgInJhZGVvbl9hc2ljLmgiCj4gKyNpbmNsdWRlICJyYWRlb25fYXRvbWJp
b3MuaCIKPgo+ICBleHRlcm4gdm9pZAo+ICByYWRlb25fYWRkX2F0b21fZW5jb2RlcihzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB1aW50MzJfdCBlbmNvZGVyX2VudW0sCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmggYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9hdG9tYmlvcy5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwMDAwLi5iN2M3NjkyMGZlYjdkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmgKPiBAQCAtMCwwICsxLDM3IEBACj4g
Ky8qIHJhZGVvbl9hdG9tYmlvcy5oIC0tIFByaXZhdGUgaGVhZGVyIGZvciByYWRlb24gZHJpdmVy
IC0qLSBsaW51eC1jIC0qLQo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgMjAwNy04IEFkdmFuY2VkIE1p
Y3JvIERldmljZXMsIEluYy4KPiArICogQ29weXJpZ2h0IDIwMDggUmVkIEhhdCBJbmMuCj4gKyAq
Cj4gKyAqIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBh
bnkgcGVyc29uIG9idGFpbmluZyBhCj4gKyAqIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNz
b2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksCj4gKyAqIHRvIGRl
YWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0
IGxpbWl0YXRpb24KPiArICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2Us
IHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsCj4gKyAqIGFuZC9vciBzZWxsIGNvcGll
cyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZQo+ICsg
KiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2lu
ZyBjb25kaXRpb25zOgo+ICsgKgo+ICsgKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQg
dGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgo+ICsgKiBhbGwgY29w
aWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KPiArICoKPiArICog
VEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5Z
IEtJTkQsIEVYUFJFU1MgT1IKPiArICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRF
RCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCj4gKyAqIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuICBJTiBOTyBFVkVOVCBT
SEFMTAo+ICsgKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBPUiBBVVRIT1IoUykgQkUgTElBQkxF
IEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IKPiArICogT1RIRVIgTElBQklMSVRZLCBXSEVUSEVS
IElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsCj4gKyAqIEFSSVNJ
TkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhF
IFVTRSBPUgo+ICsgKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCj4gKyAqCj4gKyAq
IEF1dGhvcnM6IERhdmUgQWlybGllCj4gKyAqICAgICAgICAgIEFsZXggRGV1Y2hlcgo+ICsgKi8K
PiArCj4gKyNpZm5kZWYgX19SQURFT05fQVRPTUJJT1NfSF9fCj4gKyNkZWZpbmUgX19SQURFT05f
QVRPTUJJT1NfSF9fCj4gKwo+ICtzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZTsKPiArc3RydWN0IHJh
ZGVvbl9kZXZpY2U7Cj4gKwo+ICtib29sIHJhZGVvbl9hdG9tX2dldF90dl90aW1pbmdzKHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2LCBpbnQgaW5kZXgsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7Cj4gKwo+ICsjZW5kaWYg
ICAgICAgICAgICAgICAgICAgICAgICAgLyogX19SQURFT05fQVRPTUJJT1NfSF9fICovCj4gLS0K
PiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
