Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D9616EA07
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Feb 2020 16:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10676EB32;
	Tue, 25 Feb 2020 15:26:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5986EB30;
 Tue, 25 Feb 2020 15:26:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p17so3574144wma.1;
 Tue, 25 Feb 2020 07:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p+v0yj4GcicavepFfFLrFSUrKh0F18F8tR73dqab3jI=;
 b=VCtEhcc6caXal2R9E0fjZip1pgWsCFe340oel3Sf6Z86Pznv9FslGRo2eBWSIGBLBE
 rBJdshllS6kRWdWapVUD/YFIKxiyNTmEHJSQQtCImtQKBcC9DXfwcsCoovfu72wAZ7+O
 h6SCZWxQxGB32QLruu+F+THL+9GPs1C+vDekumRFDNOoQbm/z83lVKygviGeaCDfaVsD
 Z7IU5AlhHBgPgv3zx6mW4E4LXC86cyZ5+Uh292ABubkq0DvTroQRafvUwqmkRlGDkSdH
 0vrx1lukzSunifmpCau8RuTn/Bzd5dxOF8V6NYrMbGzpJDiwo5/Q8g2KPoALWjdpgd5J
 8vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p+v0yj4GcicavepFfFLrFSUrKh0F18F8tR73dqab3jI=;
 b=kiBoijT4tabriduaeCIZSJoRjytCniHTyzTFW+9WNyaun30cTDes29y5WpSmo5p3gM
 46yhBYQ3JiLNM6yP3sWue6uzMW4WCfSUyrV9a/TbmlHgXrIz9GW7e38tB45MEtSCmtdu
 WjfBsWjs7T996accWLtghmIX1gtzDM3c1eQKScLExBK4YnoY9U5va9WJaVMHDUqOvYwS
 yg098ynVMct6P/a+br9rKAi5Po/b9skQKma9PrTJ4dfUXF3pfqC46j7eGcuYWeooQcNV
 xBCBdVnchT+GM+Usl7SpskfDNOvkVBubRWFj/HBTFrYsF7tL7I7QKNsnW4mWQxv9wJrd
 ma5A==
X-Gm-Message-State: APjAAAWCgh470eyGzoIDAotGPpDE0RlAsya4V9P7ntw3zi5JIfEjMUiH
 RxiIU+szCKWIcI/7EDQK9Uu42fjvZvL4Yj12Zxo=
X-Google-Smtp-Source: APXvYqxxofGSuZdFdvpo4ANq+4QICAhKN7Jcciw/o1iUQ2CVsp3uwdGZyYPAq6DXzeJmKYYNIqhQQSShL7gbX0XHzz4=
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr5861137wmc.39.1582644406515; 
 Tue, 25 Feb 2020 07:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20200222175433.2259158-1-daniel.vetter@ffwll.ch>
 <20200222175433.2259158-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20200222175433.2259158-2-daniel.vetter@ffwll.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Feb 2020 10:26:35 -0500
Message-ID: <CADnq5_OLK_Qo=_FeKP4Lnp3kZEhP2OFquO02rG3-4k270C4FWQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/radeon: Inline drm_get_pci_dev
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCBGZWIgMjIsIDIwMjAgYXQgMTI6NTQgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4gd3JvdGU6Cj4KPiBJdCdzIHRoZSBsYXN0IHVzZXIsIGFuZCBtb3JlIGlt
cG9ydGFudGx5LCBpdCdzIHRoZSBsYXN0IG5vbi1sZWdhY3kKPiB1c2VyIG9mIGFueXRoaW5nIGlu
IGRybV9wY2kuYy4KPgo+IFRoZSBvbmx5IHRyaWNreSBiaXQgaXMgdGhlIGFncCBpbml0aWFsaXph
dGlvbi4gQnV0IGEgY2xvc2UgbG9vayBzaG93cwo+IHRoYXQgcmFkZW9uIGRvZXMgbm90IHVzZSB0
aGUgZHJtX2FncCBtaWRsYXllciAodGhlIG1haW4gdXNlIG9mIHRoYXQgaXMKPiBkcm1fYnVmcyBm
b3IgbGVnYWN5IGRyaXZlcnMpLCBhbmQgaW5zdGVhZCBjb3VsZCB1c2UgdGhlIGFncCBzdWJzeXN0
ZW0KPiBkaXJlY3RseSAobGlrZSBub3V2ZWF1IGRvZXMgYWxyZWFkeSkuIEhlbmNlIHdlIGNhbiBq
dXN0IHB1bGwgdGhpcyBpbgo+IHRvby4KPgo+IEEgZnVydGhlciBzdGVwIHdvdWxkIGJlIHRvIGVu
dGlyZWx5IGRyb3AgdGhlIHVzZSBvZiBkcm1fZGV2aWNlLT5hZ3AsCj4gYnV0IGZlZWxzIGxpa2Ug
dG9vIG11Y2ggY2h1cm4ganVzdCBmb3IgdGhpcyBwYXRjaC4KPgo+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiAiRGF2aWQgKENodW5NaW5nKSBaaG91IiA8RGF2
aWQxLlpob3VAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKCkFw
cGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9kcnYuYyB8IDQzICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jIHwgIDYgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDQ3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9kcnYuYwo+IGluZGV4IDQ5Y2UyZTdkNWY5ZS4uNTlmODE4NmEyNDE1IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKPiBAQCAtMzcsNiArMzcsNyBAQAo+ICAjaW5jbHVk
ZSA8bGludXgvdmdhX3N3aXRjaGVyb28uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21tdV9ub3RpZmll
ci5oPgo+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX2FncHN1cHBvcnQuaD4KPiAgI2luY2x1ZGUgPGRy
bS9kcm1fY3J0Y19oZWxwZXIuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+Cj4gICNpbmNs
dWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPgo+IEBAIC0zMjIsNiArMzIzLDcgQEAgc3RhdGljIGlu
dCByYWRlb25fcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQo+ICB7Cj4gICAg
ICAgICB1bnNpZ25lZCBsb25nIGZsYWdzID0gMDsKPiArICAgICAgIHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXY7Cj4gICAgICAgICBpbnQgcmV0Owo+Cj4gICAgICAgICBpZiAoIWVudCkKPiBAQCAtMzYy
LDcgKzM2NCw0NCBAQCBzdGF0aWMgaW50IHJhZGVvbl9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYg
KnBkZXYsCj4gICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+
Cj4gLSAgICAgICByZXR1cm4gZHJtX2dldF9wY2lfZGV2KHBkZXYsIGVudCwgJmttc19kcml2ZXIp
Owo+ICsgICAgICAgZGV2ID0gZHJtX2Rldl9hbGxvYygma21zX2RyaXZlciwgJnBkZXYtPmRldik7
Cj4gKyAgICAgICBpZiAoSVNfRVJSKGRldikpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBQVFJf
RVJSKGRldik7Cj4gKwo+ICsgICAgICAgcmV0ID0gcGNpX2VuYWJsZV9kZXZpY2UocGRldik7Cj4g
KyAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICBnb3RvIGVycl9mcmVlOwo+ICsKPiAr
ICAgICAgIGRldi0+cGRldiA9IHBkZXY7Cj4gKyNpZmRlZiBfX2FscGhhX18KPiArICAgICAgIGRl
di0+aG9zZSA9IHBkZXYtPnN5c2RhdGE7Cj4gKyNlbmRpZgo+ICsKPiArICAgICAgIHBjaV9zZXRf
ZHJ2ZGF0YShwZGV2LCBkZXYpOwo+ICsKPiArICAgICAgIGlmIChwY2lfZmluZF9jYXBhYmlsaXR5
KGRldi0+cGRldiwgUENJX0NBUF9JRF9BR1ApKQo+ICsgICAgICAgICAgICAgICBkZXYtPmFncCA9
IGRybV9hZ3BfaW5pdChkZXYpOwo+ICsgICAgICAgaWYgKGRldi0+YWdwKSB7Cj4gKyAgICAgICAg
ICAgICAgIGRldi0+YWdwLT5hZ3BfbXRyciA9IGFyY2hfcGh5c193Y19hZGQoCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZGV2LT5hZ3AtPmFncF9pbmZvLmFwZXJfYmFzZSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICBkZXYtPmFncC0+YWdwX2luZm8uYXBlcl9zaXplICoKPiArICAgICAgICAg
ICAgICAgICAgICAgICAxMDI0ICogMTAyNCk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0
ID0gZHJtX2Rldl9yZWdpc3RlcihkZXYsIGVudC0+ZHJpdmVyX2RhdGEpOwo+ICsgICAgICAgaWYg
KHJldCkKPiArICAgICAgICAgICAgICAgZ290byBlcnJfYWdwOwo+ICsKPiArICAgICAgIHJldHVy
biAwOwo+ICsKPiArZXJyX2FncDoKPiArICAgICAgIGlmIChkZXYtPmFncCkKPiArICAgICAgICAg
ICAgICAgYXJjaF9waHlzX3djX2RlbChkZXYtPmFncC0+YWdwX210cnIpOwo+ICsgICAgICAga2Zy
ZWUoZGV2LT5hZ3ApOwo+ICsgICAgICAgcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwo+ICtlcnJf
ZnJlZToKPiArICAgICAgIGRybV9kZXZfcHV0KGRldik7Cj4gKyAgICAgICByZXR1cm4gcmV0Owo+
ICB9Cj4KPiAgc3RhdGljIHZvaWQKPiBAQCAtNTYyLDcgKzYwMSw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHJhZGVvbl9kcml2ZXJfa21zX2ZvcHMgPSB7Cj4KPiAgc3Rh
dGljIHN0cnVjdCBkcm1fZHJpdmVyIGttc19kcml2ZXIgPSB7Cj4gICAgICAgICAuZHJpdmVyX2Zl
YXR1cmVzID0KPiAtICAgICAgICAgICBEUklWRVJfVVNFX0FHUCB8IERSSVZFUl9HRU0gfCBEUklW
RVJfUkVOREVSLAo+ICsgICAgICAgICAgIERSSVZFUl9HRU0gfCBEUklWRVJfUkVOREVSLAo+ICAg
ICAgICAgLmxvYWQgPSByYWRlb25fZHJpdmVyX2xvYWRfa21zLAo+ICAgICAgICAgLm9wZW4gPSBy
YWRlb25fZHJpdmVyX29wZW5fa21zLAo+ICAgICAgICAgLnBvc3RjbG9zZSA9IHJhZGVvbl9kcml2
ZXJfcG9zdGNsb3NlX2ttcywKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYwo+IGluZGV4
IGNhYjg5MWY4NmRjMC4uNTgxNzZkYjg1OTUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fa21zLmMKPiBAQCAtMzIsNiArMzIsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvdmdhX3N3aXRjaGVyb28uaD4KPgo+ICsjaW5jbHVkZSA8ZHJt
L2RybV9hZ3BzdXBwb3J0Lmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPgo+ICAj
aW5jbHVkZSA8ZHJtL2RybV9maWxlLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+Cj4g
QEAgLTc3LDYgKzc4LDExIEBAIHZvaWQgcmFkZW9uX2RyaXZlcl91bmxvYWRfa21zKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpCj4gICAgICAgICByYWRlb25fbW9kZXNldF9maW5pKHJkZXYpOwo+ICAg
ICAgICAgcmFkZW9uX2RldmljZV9maW5pKHJkZXYpOwo+Cj4gKyAgICAgICBpZiAoZGV2LT5hZ3Ap
Cj4gKyAgICAgICAgICAgICAgIGFyY2hfcGh5c193Y19kZWwoZGV2LT5hZ3AtPmFncF9tdHJyKTsK
PiArICAgICAgIGtmcmVlKGRldi0+YWdwKTsKPiArICAgICAgIGRldi0+YWdwID0gTlVMTDsKPiAr
Cj4gIGRvbmVfZnJlZToKPiAgICAgICAgIGtmcmVlKHJkZXYpOwo+ICAgICAgICAgZGV2LT5kZXZf
cHJpdmF0ZSA9IE5VTEw7Cj4gLS0KPiAyLjI0LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngK
