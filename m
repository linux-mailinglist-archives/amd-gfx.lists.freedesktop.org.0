Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD872B525F
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Nov 2020 21:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257536EA73;
	Mon, 16 Nov 2020 20:22:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06C26EA6D;
 Mon, 16 Nov 2020 20:22:57 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s13so530559wmh.4;
 Mon, 16 Nov 2020 12:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DuarJJhpDRx/9+5W9R32EPHRCg72/dsV/R3Fbi0RzDs=;
 b=n5YNkhvz2jgmhEYoGRO52BVn39NMFzJeAMVzPnk2GFxvat3OFpcsA14OgKCuzZBkGV
 J6LxhWzBrneFA7zOXzZHdtM3XGbQRTY4VwJHFxNp4+fnSSgEowpIVm1QSq0xTSrnDYJc
 0BQclXCXie08LNhNQB06y7LT5CLjni46ebzc+/FHRH1ZdoEATdjHwrM4TnTvXzlgyY5b
 arnh1JUnnuA9hW2D+8w87YanuVuFMxcWSCzAVH13iatKy6QZu9XYnYOSdggNL3+WXGoM
 GE+q9d7bNYtUDPGnM0KeExWCqU7FLaTwqRkJirujTBxZPP7wACaDB98X+e+jHC6aMJdl
 RCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DuarJJhpDRx/9+5W9R32EPHRCg72/dsV/R3Fbi0RzDs=;
 b=qv78EpR6jQbOqVOtrJH9MbIr8sXBmZ2IDxFettyJ9i4lOn4/uJ5QZi7E0UIWLZ0gyL
 rbWJtbFXLmY+NCpF6YAm64J/fq/jK4GCIQdWIfQKaI6k8deT3KnkN0UZE1nQRWEBHUP1
 076xhhytAwg5uyF4vrM1D/buOENzaFAxWNaRIyzrXh5LD5eTeuug02smNZ3GiaOOZTph
 Edy//9Q4bLPmMEQvIw7TVEE5VAp03m/tioHqmm1NBHq8FnM+ZQddefvWXaVGhQgZuY5a
 pmZDT1ELQ99cFwdzUxE9YwDU8NZcbEYovYQG6thqZdc1pCy+TXrdh/NrK/RSyRzcmI/u
 tOHA==
X-Gm-Message-State: AOAM531w8KFWE7/WwtBk/kqJVgLa2sK2+DO6GbndIIappJmpbIEdcXpy
 ydLyrA9Iu20W+jnSW8NrFXeXwrnAaJEieqxRHmM=
X-Google-Smtp-Source: ABdhPJwz82pD94+4fHfPu9TrMqYJhfqMOndS19nP3bK3JLBd7APsbnE2rca+aktpzzLoMcga8iZC30CJFIiJqT4HWz4=
X-Received: by 2002:a1c:2dc8:: with SMTP id t191mr262491wmt.73.1605558176583; 
 Mon, 16 Nov 2020 12:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org>
 <20201116173700.1830487-29-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-29-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 15:22:45 -0500
Message-ID: <CADnq5_O4CTPD=cCmeme955WHOuyFo40rDaNMjmFKpsFn_pOYzw@mail.gmail.com>
Subject: Re: [PATCH 28/43] drm/radeon/ci_dpm: Move 'ci_*()'s prototypes to
 shared header
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

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzggUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jOjE4Njg6NTogd2Fy
bmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhjaV9tY19sb2FkX21pY3JvY29kZeKA
mSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDE4NjggfCBpbnQgY2lfbWNfbG9hZF9taWNyb2Nv
ZGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4gIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn4K
PiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYzo1ODQ3OjY6IHdhcm5pbmc6IG5vIHByZXZp
b3VzIHByb3RvdHlwZSBmb3Ig4oCYY2lrX2VudGVyX3JsY19zYWZlX21vZGXigJkgWy1XbWlzc2lu
Zy1wcm90b3R5cGVzXQo+ICA1ODQ3IHwgdm9pZCBjaWtfZW50ZXJfcmxjX3NhZmVfbW9kZShzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldikKPiAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jOjU4Njg6Njogd2FybmluZzogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciDigJhjaWtfZXhpdF9ybGNfc2FmZV9tb2Rl4oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KPiAgNTg2OCB8IHZvaWQgY2lrX2V4aXRfcmxjX3NhZmVfbW9kZShzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldikKPiAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vY2lrLmM6NjI4Njo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5
cGUgZm9yIOKAmGNpa191cGRhdGVfY2figJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICA2Mjg2
IHwgdm9pZCBjaWtfdXBkYXRlX2NnKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+ICB8IF5+
fn5+fn5+fn5+fn4KPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaV9kcG0uYyB8ICA3ICstLS0tLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYyAgICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9jaWsuaCAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAz
IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5oCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaV9kcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vY2lfZHBtLmMKPiBpbmRleCA4MzI0YWNhNWZkMDA2Li5hOWZjMGE1NTI3MzZjIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lfZHBtLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL2NpX2RwbS5jCj4gQEAgLTI3LDYgKzI3LDcgQEAKPgo+ICAjaW5jbHVkZSAi
YXRvbS5oIgo+ICAjaW5jbHVkZSAiY2lfZHBtLmgiCj4gKyNpbmNsdWRlICJjaWsuaCIKPiAgI2lu
Y2x1ZGUgImNpa2QuaCIKPiAgI2luY2x1ZGUgInI2MDBfZHBtLmgiCj4gICNpbmNsdWRlICJyYWRl
b24uaCIKPiBAQCAtMTU3LDEyICsxNTgsNiBAQCBleHRlcm4gdTggc2lfZ2V0X21jbGtfZnJlcXVl
bmN5X3JhdGlvKHUzMiBtZW1vcnlfY2xvY2ssIGJvb2wgc3Ryb2JlX21vZGUpOwo+ICBleHRlcm4g
dm9pZCBzaV90cmltX3ZvbHRhZ2VfdGFibGVfdG9fZml0X3N0YXRlX3RhYmxlKHN0cnVjdCByYWRl
b25fZGV2aWNlICpyZGV2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdTMyIG1heF92b2x0YWdlX3N0ZXBzLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGF0b21fdm9sdGFnZV90
YWJsZSAqdm9sdGFnZV90YWJsZSk7Cj4gLWV4dGVybiB2b2lkIGNpa19lbnRlcl9ybGNfc2FmZV9t
b2RlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKPiAtZXh0ZXJuIHZvaWQgY2lrX2V4aXRf
cmxjX3NhZmVfbW9kZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4gLWV4dGVybiBpbnQg
Y2lfbWNfbG9hZF9taWNyb2NvZGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+IC1leHRl
cm4gdm9pZCBjaWtfdXBkYXRlX2NnKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgdTMyIGJsb2NrLCBib29sIGVuYWJsZSk7Cj4gLQo+ICBzdGF0
aWMgaW50IGNpX2dldF9zdGRfdm9sdGFnZV92YWx1ZV9zaWRkKHN0cnVjdCByYWRlb25fZGV2aWNl
ICpyZGV2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGF0b21fdm9sdGFnZV90YWJsZV9lbnRyeSAqdm9sdGFnZV90YWJsZSwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUxNiAqc3RkX3ZvbHRhZ2VfaGlfc2lkZCwgdTE2
ICpzdGRfdm9sdGFnZV9sb19zaWRkKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9jaWsuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMKPiBpbmRleCA5ODBiNTBk
MDQ2Y2JjLi5hZTAyMGFkN2IzMTg1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vY2lrLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jCj4gQEAgLTMyLDYg
KzMyLDcgQEAKPiAgI2luY2x1ZGUgImF0b20uaCIKPiAgI2luY2x1ZGUgImV2ZXJncmVlbi5oIgo+
ICAjaW5jbHVkZSAiY2lrX2JsaXRfc2hhZGVycy5oIgo+ICsjaW5jbHVkZSAiY2lrLmgiCj4gICNp
bmNsdWRlICJjaWtkLmgiCj4gICNpbmNsdWRlICJjbGVhcnN0YXRlX2NpLmgiCj4gICNpbmNsdWRl
ICJyNjAwLmgiCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmggYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAwLi4yOTdiM2MxZmY4MDRmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmgKPiBAQCAtMCwwICsxLDMzIEBACj4gKy8qIGNpay5o
IC0tIFByaXZhdGUgaGVhZGVyIGZvciByYWRlb24gZHJpdmVyIC0qLSBsaW51eC1jIC0qLQo+ICsg
KiBDb3B5cmlnaHQgMjAxMiBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCj4gKyAqCj4gKyAq
IFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVy
c29uIG9idGFpbmluZyBhCj4gKyAqIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRl
ZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksCj4gKyAqIHRvIGRlYWwgaW4g
dGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0
YXRpb24KPiArICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxp
c2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsCj4gKyAqIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0
aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZQo+ICsgKiBTb2Z0
d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25k
aXRpb25zOgo+ICsgKgo+ICsgKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBw
ZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgo+ICsgKiBhbGwgY29waWVzIG9y
IHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KPiArICoKPiArICogVEhFIFNP
RlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQs
IEVYUFJFU1MgT1IKPiArICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBU
SEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCj4gKyAqIEZJVE5FU1MgRk9SIEEgUEFS
VElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuICBJTiBOTyBFVkVOVCBTSEFMTAo+
ICsgKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBPUiBBVVRIT1IoUykgQkUgTElBQkxFIEZPUiBB
TlkgQ0xBSU0sIERBTUFHRVMgT1IKPiArICogT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSIElOIEFO
IEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsCj4gKyAqIEFSSVNJTkcgRlJP
TSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBP
Ugo+ICsgKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCj4gKyAqLwo+ICsKPiArI2lm
bmRlZiBfX0NJS19IX18KPiArI2RlZmluZSBfX0NJS19IX18KPiArCj4gK3N0cnVjdCByYWRlb25f
ZGV2aWNlOwo+ICsKPiArdm9pZCBjaWtfZW50ZXJfcmxjX3NhZmVfbW9kZShzdHJ1Y3QgcmFkZW9u
X2RldmljZSAqcmRldik7Cj4gK3ZvaWQgY2lrX2V4aXRfcmxjX3NhZmVfbW9kZShzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldik7Cj4gK2ludCBjaV9tY19sb2FkX21pY3JvY29kZShzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldik7Cj4gK3ZvaWQgY2lrX3VwZGF0ZV9jZyhzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldiwgdTMyIGJsb2NrLCBib29sIGVuYWJsZSk7Cj4gKwo+ICsjZW5kaWYgICAgICAg
ICAgICAgICAgICAgICAgICAgLyogX19DSUtfSF9fICovCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1h
aWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
