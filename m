Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30CB2AC830
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Nov 2020 23:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29566895B6;
	Mon,  9 Nov 2020 22:20:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12C4892F1;
 Mon,  9 Nov 2020 22:20:19 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a65so1061670wme.1;
 Mon, 09 Nov 2020 14:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vGhNCc6VVewZry0wq35Lxy3zuv2TnMJ7Nic4jXYaqhI=;
 b=Rwyctf8tX7OhS2+nfu/PZZmG5jV1uAmkp3NvuHlugxKjDGKOkiQkdegHxv7l4Jyq0R
 j9B76HgpSGi8DNsIfB06YNrXIYP/mPhvJ86FkXmUNAseMftI7jPqvlJ1H7GF6UeZf5sh
 hhbE9oiXrf3wwsTtz04Z1IuFAPabpPWHn33T3GY/otaCyAEpGcxr6B5eZhbbJQR8OG9J
 JEgRid50wlGnzOEsVepBBZRPc3VBEc9e4sSWZ7P3tcj0kHJKNEXT4mFAmDefH7bowOPi
 qfRKPwokcGeVIFAtpdSi1xOlOuqgaxfRLmX+NLjdh+xMxdS11wamPtl54g96Lp/ArOFA
 8ANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vGhNCc6VVewZry0wq35Lxy3zuv2TnMJ7Nic4jXYaqhI=;
 b=RorpmP1OCPSXK5abm9yRpLQD/RrYnFySWRxtugHBCnDxjb4jI/tqspcjw9NB+tsjXb
 aLPAYNJlHxRDtmHwSFzn9XfJEeNnar3fWno+QBfj8htNctffcnAVuVo+w3gjG8M4NwtB
 tHoboloKeDMDMiUI53iKAWszs2QB5ITNu5le1/nUotdtfMjc8/srdV+D9rfGm9D6eFLp
 xKAHHFGgFz/fAydMPXj0IWr0rTrIyyZf9C90YQVyHBZmrm0yaVjpokMZ4MD0Bs2s+l8W
 zEzF9yPT8PXkOu2e33qdrqofsVdoPndfgEEBzjQF6JsnNeW9D/zQoEvmUcYsWUhPFVQw
 4sEQ==
X-Gm-Message-State: AOAM53030eSTvRO91iFqzXHMnuUOHGKQg1/gWtkf9KY9+sPZfVHufAq7
 2JuhwJVnod4h5WygByBberoBr/n4xrA6mSfF1SI=
X-Google-Smtp-Source: ABdhPJxiyjZlUDPOFY3G7x+17Jo3GAkhTVvY+9kpsTfW8bz5ICtO/+F2bct4Y9onw3IT2o1baa3bcQ+fDgql5AM/Vd0=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr1309185wmb.39.1604960418386;
 Mon, 09 Nov 2020 14:20:18 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-16-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-16-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Nov 2020 17:20:07 -0500
Message-ID: <CADnq5_NvitEQWH3Z+5EgOH3zJn=P5YTqwHQo4LLQLi0Hj0Dpww@mail.gmail.com>
Subject: Re: [PATCH 15/20] drm/radeon/r600d: Move 'rc600_*' prototypes into
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

T24gTW9uLCBOb3YgOSwgMjAyMCBhdCA0OjE5IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwX2hkbWkuYzoxNzc6Njog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhyNjAwX2hkbWlfdXBkYXRlX2Fj
cuKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDE3NyB8IHZvaWQgcjYwMF9oZG1pX3VwZGF0
ZV9hY3Ioc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCBsb25nIG9mZnNldCwKPiAgfCBefn5+
fn5+fn5+fn5+fn5+fn5+fgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBfaGRtaS5jOjIx
Nzo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHI2MDBfc2V0X2F2aV9w
YWNrZXTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICAyMTcgfCB2b2lkIHI2MDBfc2V0X2F2
aV9wYWNrZXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHUzMiBvZmZzZXQsCj4gIHwgXn5+
fn5+fn5+fn5+fn5+fn5+fgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBfaGRtaS5jOjMx
NDo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHI2MDBfaGRtaV9hdWRp
b19zZXRfZHRv4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgMzE0IHwgdm9pZCByNjAwX2hk
bWlfYXVkaW9fc2V0X2R0byhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKPiAgfCBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBfaGRtaS5jOjM0
MDo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHI2MDBfc2V0X3ZiaV9w
YWNrZXTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICAzNDAgfCB2b2lkIHI2MDBfc2V0X3Zi
aV9wYWNrZXQoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCB1MzIgb2Zmc2V0KQo+ICB8IF5+
fn5+fn5+fn5+fn5+fn5+fn4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwX2hkbWkuYzoz
NTE6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhyNjAwX3NldF9hdWRp
b19wYWNrZXTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICAzNTEgfCB2b2lkIHI2MDBfc2V0
X2F1ZGlvX3BhY2tldChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIHUzMiBvZmZzZXQpCj4g
IHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMF9o
ZG1pLmM6MzkzOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcjYwMF9z
ZXRfbXV0ZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDM5MyB8IHZvaWQgcjYwMF9zZXRf
bXV0ZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIHUzMiBvZmZzZXQsIGJvb2wgbXV0ZSkK
PiAgfCBefn5+fn5+fn5+fn5+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMF9oZG1pLmM6
NDY5OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcjYwMF9oZG1pX2Vu
YWJsZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDQ2OSB8IHZvaWQgcjYwMF9oZG1pX2Vu
YWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIGJvb2wgZW5hYmxlKQo+ICB8IF5+fn5+
fn5+fn5+fn5+fn4KPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcjYwMGQuaCAgICAgICAgfCAxNCArKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9hdWRpby5jIHwgMTEgKy0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBkLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBk
LmgKPiBpbmRleCAyZTAwYTUyODdiZDJkLi5kYjRiY2M4YmVlNGU1IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMGQuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcjYwMGQuaAo+IEBAIC0yNyw2ICsyNywyMCBAQAo+ICAjaWZuZGVmIFI2MDBEX0gKPiAgI2Rl
ZmluZSBSNjAwRF9ICj4KPiArc3RydWN0IHJhZGVvbl9jcnRjOwo+ICtzdHJ1Y3QgcmFkZW9uX2hk
bWlfYWNyOwo+ICsKPiArdm9pZCByNjAwX3NldF9hdWRpb19wYWNrZXQoc3RydWN0IGRybV9lbmNv
ZGVyICplbmNvZGVyLCB1MzIgb2Zmc2V0KTsKPiArdm9pZCByNjAwX3NldF9tdXRlKHN0cnVjdCBk
cm1fZW5jb2RlciAqZW5jb2RlciwgdTMyIG9mZnNldCwgYm9vbCBtdXRlKTsKPiArdm9pZCByNjAw
X2hkbWlfYXVkaW9fc2V0X2R0byhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKPiArICAgICAg
IHN0cnVjdCByYWRlb25fY3J0YyAqY3J0YywgdW5zaWduZWQgaW50IGNsb2NrKTsKPiArdm9pZCBy
NjAwX3NldF9hdmlfcGFja2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCB1MzIgb2Zmc2V0
LAo+ICsgICAgICAgdW5zaWduZWQgY2hhciAqYnVmZmVyLCBzaXplX3Qgc2l6ZSk7Cj4gK3ZvaWQg
cjYwMF9oZG1pX3VwZGF0ZV9hY3Ioc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCBsb25nIG9m
ZnNldCwKPiArICAgICAgIGNvbnN0IHN0cnVjdCByYWRlb25faGRtaV9hY3IgKmFjcik7Cj4gK3Zv
aWQgcjYwMF9zZXRfdmJpX3BhY2tldChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIHUzMiBv
ZmZzZXQpOwo+ICt2b2lkIHI2MDBfaGRtaV9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNv
ZGVyLCBib29sIGVuYWJsZSk7Cj4gKwoKdGhlICpkLmggaGVhZGVycyBhcmUgc3VwcG9zZWQgdG8g
anVzdCBiZSBoYXJkd2FyZSBkZWZpbml0aW9ucy4gIEknZApwcmVmZXIgdG8ga2VlcCBkcml2ZXIg
c3R1ZmYgb3V0IG9mIHRoZW0uCgpBbGV4CgoKPiAgI2RlZmluZSBDUF9QQUNLRVQyICAgICAgICAg
ICAgICAgICAgICAgMHg4MDAwMDAwMAo+ICAjZGVmaW5lICAgICAgICAgICAgICAgIFBBQ0tFVDJf
UEFEX1NISUZUICAgICAgICAgICAgICAgMAo+ICAjZGVmaW5lICAgICAgICAgICAgICAgIFBBQ0tF
VDJfUEFEX01BU0sgICAgICAgICAgICAgICAgKDB4M2ZmZmZmZmYgPDwgMCkKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXVkaW8uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2F1ZGlvLmMKPiBpbmRleCA4YzYzY2NiOGI2MjM1Li5hMmJlNjBhYTNj
ZWM0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F1ZGlvLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdWRpby5jCj4gQEAgLTI3LDYg
KzI3LDcgQEAKPiAgI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgo+ICAjaW5jbHVkZSAicmFkZW9u
LmgiCj4gICNpbmNsdWRlICJhdG9tLmgiCj4gKyNpbmNsdWRlICJyNjAwZC5oIgo+ICAjaW5jbHVk
ZSAicmFkZW9uX2F1ZGlvLmgiCj4KPiAgdm9pZCByNjAwX2F1ZGlvX2VuYWJsZShzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldiwgc3RydWN0IHI2MDBfYXVkaW9fcGluICpwaW4sCj4gQEAgLTYzLDgg
KzY0LDYgQEAgdm9pZCBkY2U2X2FmbXRfd3JpdGVfbGF0ZW5jeV9maWVsZHMoc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyLAo+ICBzdHJ1Y3QgcjYwMF9hdWRpb19waW4qIHI2MDBfYXVkaW9fZ2V0
X3BpbihzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4gIHN0cnVjdCByNjAwX2F1ZGlvX3Bp
biogZGNlNl9hdWRpb19nZXRfcGluKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKPiAgdm9p
ZCBkY2U2X2FmbXRfc2VsZWN0X3BpbihzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpOwo+IC12
b2lkIHI2MDBfaGRtaV9hdWRpb19zZXRfZHRvKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+
IC0gICAgICAgc3RydWN0IHJhZGVvbl9jcnRjICpjcnRjLCB1bnNpZ25lZCBpbnQgY2xvY2spOwo+
ICB2b2lkIGRjZTNfMl9hdWRpb19zZXRfZHRvKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+
ICAgICAgICAgc3RydWN0IHJhZGVvbl9jcnRjICpjcnRjLCB1bnNpZ25lZCBpbnQgY2xvY2spOwo+
ICB2b2lkIGRjZTRfaGRtaV9hdWRpb19zZXRfZHRvKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2
LAo+IEBAIC03NSwzMSArNzQsMjMgQEAgdm9pZCBkY2U2X2hkbWlfYXVkaW9fc2V0X2R0byhzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKPiAgICAgICAgIHN0cnVjdCByYWRlb25fY3J0YyAqY3J0
YywgdW5zaWduZWQgaW50IGNsb2NrKTsKPiAgdm9pZCBkY2U2X2RwX2F1ZGlvX3NldF9kdG8oc3Ry
dWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCj4gICAgICAgICBzdHJ1Y3QgcmFkZW9uX2NydGMgKmNy
dGMsIHVuc2lnbmVkIGludCBjbG9jayk7Cj4gLXZvaWQgcjYwMF9zZXRfYXZpX3BhY2tldChzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgdTMyIG9mZnNldCwKPiAtICAgICAgIHVuc2lnbmVkIGNo
YXIgKmJ1ZmZlciwgc2l6ZV90IHNpemUpOwo+ICB2b2lkIGV2ZXJncmVlbl9zZXRfYXZpX3BhY2tl
dChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgdTMyIG9mZnNldCwKPiAgICAgICAgIHVuc2ln
bmVkIGNoYXIgKmJ1ZmZlciwgc2l6ZV90IHNpemUpOwo+IC12b2lkIHI2MDBfaGRtaV91cGRhdGVf
YWNyKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgbG9uZyBvZmZzZXQsCj4gLSAgICAgICBj
b25zdCBzdHJ1Y3QgcmFkZW9uX2hkbWlfYWNyICphY3IpOwo+ICB2b2lkIGRjZTNfMl9oZG1pX3Vw
ZGF0ZV9hY3Ioc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCBsb25nIG9mZnNldCwKPiAgICAg
ICAgIGNvbnN0IHN0cnVjdCByYWRlb25faGRtaV9hY3IgKmFjcik7Cj4gIHZvaWQgZXZlcmdyZWVu
X2hkbWlfdXBkYXRlX2FjcihzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIGxvbmcgb2Zmc2V0
LAo+ICAgICAgICAgY29uc3Qgc3RydWN0IHJhZGVvbl9oZG1pX2FjciAqYWNyKTsKPiAtdm9pZCBy
NjAwX3NldF92YmlfcGFja2V0KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgdTMyIG9mZnNl
dCk7Cj4gIHZvaWQgZGNlNF9zZXRfdmJpX3BhY2tldChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29k
ZXIsIHUzMiBvZmZzZXQpOwo+ICB2b2lkIGRjZTRfaGRtaV9zZXRfY29sb3JfZGVwdGgoc3RydWN0
IGRybV9lbmNvZGVyICplbmNvZGVyLAo+ICAgICAgICAgdTMyIG9mZnNldCwgaW50IGJwYyk7Cj4g
LXZvaWQgcjYwMF9zZXRfYXVkaW9fcGFja2V0KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rlciwg
dTMyIG9mZnNldCk7Cj4gIHZvaWQgZGNlM18yX3NldF9hdWRpb19wYWNrZXQoc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyLCB1MzIgb2Zmc2V0KTsKPiAgdm9pZCBkY2U0X3NldF9hdWRpb19wYWNr
ZXQoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCB1MzIgb2Zmc2V0KTsKPiAtdm9pZCByNjAw
X3NldF9tdXRlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgdTMyIG9mZnNldCwgYm9vbCBt
dXRlKTsKPiAgdm9pZCBkY2UzXzJfc2V0X211dGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVy
LCB1MzIgb2Zmc2V0LCBib29sIG11dGUpOwo+ICB2b2lkIGRjZTRfc2V0X211dGUoc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyLCB1MzIgb2Zmc2V0LCBib29sIG11dGUpOwo+ICBzdGF0aWMgdm9p
ZCByYWRlb25fYXVkaW9faGRtaV9tb2RlX3NldChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIs
Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7Cj4gIHN0YXRpYyB2b2lk
IHJhZGVvbl9hdWRpb19kcF9tb2RlX3NldChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCj4g
ICAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7Cj4gLXZvaWQgcjYwMF9oZG1p
X2VuYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIGJvb2wgZW5hYmxlKTsKPiAgdm9p
ZCBldmVyZ3JlZW5faGRtaV9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCBib29s
IGVuYWJsZSk7Cj4gIHZvaWQgZXZlcmdyZWVuX2RwX2VuYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIg
KmVuY29kZXIsIGJvb2wgZW5hYmxlKTsKPgo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
