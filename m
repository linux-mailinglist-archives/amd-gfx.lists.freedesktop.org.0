Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D39C059E
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 14:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0126E075;
	Fri, 27 Sep 2019 12:48:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990326E075
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 12:48:49 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y21so6062003wmi.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 05:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xWuBciwocc7X20SO1tRG2YW0cQmAZk1zBgxNXbtRscs=;
 b=FzQ0AJFhaiKpwEztbSWcKVUJeY3lITaPa5I5uOnka2kvAqNiRxbVCiv+VCvu47Szzi
 TicrpEq+MYoKKeagKlRZ1KGT9hwaG99ITbwuiEVqZqLaRCnXTaxpkOQNioIq8poPJaMI
 SjAg6wcVeRXu3FgsmoMqMEi62zDnJhrE5dm60sp6ABamiNUxDFhLLuHKrsKqwUIsRrzl
 K0X91xVGNJviWzt52Djb9cizvTkXj7AeYxTH5s7DddVH58ZWXlP6fZ5b00o8gbvBRIBq
 biCPCFqwBQRNfuq4XT7Jv4P0x2uiMiwNHqqRryXPj7WqCWjq+GXTHIqZMgqnzC/Dl6zK
 mhMA==
X-Gm-Message-State: APjAAAXYyipgHB+1772aFFuHWSdlXfFo133Z4QsiKHPxgzyxXq/1pw3m
 IxJLj3QywkPKiGE/W4hwjPP9D5Oag+AwQPlwsjMglA==
X-Google-Smtp-Source: APXvYqxNqDrbnCiw+xJx9C3djG/wRO1gIQBK43/PrLvQmSZGEicNBSTC22QYQLYuqnPFD01/imLx3kkb5ncid7fAgak=
X-Received: by 2002:a1c:1a45:: with SMTP id a66mr6988460wma.102.1569588528079; 
 Fri, 27 Sep 2019 05:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <1569578864-4558-1-git-send-email-zhexi.zhang@amd.com>
In-Reply-To: <1569578864-4558-1-git-send-email-zhexi.zhang@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 27 Sep 2019 08:48:35 -0400
Message-ID: <CADnq5_PcyHecFa5mLvzSWhfNWcYzCc_Xxuu5ST8dNj5SiMBkRA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: Protect backend resource when unload
 driver
To: Jesse Zhang <zhexi.zhang@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xWuBciwocc7X20SO1tRG2YW0cQmAZk1zBgxNXbtRscs=;
 b=ugCwNRovyBDyEFswj7RXwJ32nEV1hzxulDID0gyi12IihCGGKHW1kQrContRFHDmw/
 Pw77JsAL7QmU8uqyMpXPguzQ8JzDBQCFO9Ss9j6Rr43KEGQm9KY6xQGa3LEfzuMYgavh
 f3v6d1QdnKj96zFmdHsrvaNsIoRFm93jdhW54DCHHf6Mn59NCfzIx2mbkNKji3US7q2q
 3fRElWVL3ViKG2PFcrL4J25vtjHSy9qzKs8PQo5CVFYESERPYFTlkPqi9Y9YIjf7fahM
 1dREuSJVp5pJf5qm0W4bZ1+Qopsv9XwFHqO1+Ab8ZSVCNNLLN9HlPmEcK4s5B8nKKVAI
 kf3Q==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: root <root@debian.debian>, amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgNjowOCBBTSBKZXNzZSBaaGFuZyA8emhleGkuemhhbmdA
YW1kLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiByb290IDxyb290QGRlYmlhbi5kZWJpYW4+CgpQbGVh
c2UgZml4IHlvdXIgZ2l0IHNldHVwIHRvIHVzZSB5b3VyIHByb3BlciBlbWFpbC4KCkFsZXgKCj4K
PiBHdWVzdCBkcml2ZXIgY2FuIGJlIHVubG9hZGVkIHdoaWxlIGVuZ2luZXMgc3RpbGwgdXNpbmcg
c29tZQo+IGJhY2tlbmQgcmVzb3VyY2VzLiBUaGF0IHdvdWxkIGxlYWQgdG8gdXNlIGFmdGVyIGZy
ZWUgYW5kIHRoZW4KPiBjYXVzZSBndWVzdCBkcml2ZXIgZmFpbGVkLgo+Cj4gTmVlZCB0byBhZGQg
bXV0ZXggbG9jayBiZWZvcmUgYmFja2VuZCByZXNvdXJjZXMgZnJlZSB0byBtYWtlCj4gc3VyZSBu
b2JvZHkgaXMgdXNpbmcgaXQuCj4KPiBOZWVkIHRvIGNoZWNrIGJhY2tlbmQgZGF0YSBhdmFpbGFi
bGlsaXR5IGJlZm9yZSBWQ0UvVVZEIGVudGVyCj4gcG93ZXJnYXRpbmcgbW9kZSwgaWYgYmFja2Vu
ZCByZXNvdXJjZXMgaGF2ZSBiZWVuIGZyZWUsIHRoZW4KPiBza2lwIGVudGVyaW5nIHBvd2VyZ2F0
aW5nLgo+Cj4gQ2hhbmdlLUlkOiBJZjdmOTMyMjFkZGVjYzU3ODg4NGRjOWU5OWE1MmYyMmE0M2Ux
NmIwNwo+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFpoYW5nIDx6aGV4aS56aGFuZ0BhbWQuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3Iu
YyB8IDE0ICsrKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMKPiBpbmRleCBkMDg0OTNiLi5hOTMyMGE1IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdy
LmMKPiBAQCAtODEwLDggKzgxMCwxMCBAQCBzdGF0aWMgaW50IHZlZ2ExMF9od21ncl9iYWNrZW5k
X2Zpbmkoc3RydWN0IHBwX2h3bWdyICpod21ncikKPiAgICAgICAgIGtmcmVlKGh3bWdyLT5keW5f
c3RhdGUudmRkY19kZXBfb25fZGFsX3B3cmwpOwo+ICAgICAgICAgaHdtZ3ItPmR5bl9zdGF0ZS52
ZGRjX2RlcF9vbl9kYWxfcHdybCA9IE5VTEw7Cj4KPiArICAgICAgIG11dGV4X2xvY2soJmh3bWdy
LT5zbXVfbG9jayk7Cj4gICAgICAgICBrZnJlZShod21nci0+YmFja2VuZCk7Cj4gICAgICAgICBo
d21nci0+YmFja2VuZCA9IE5VTEw7Cj4gKyAgICAgICBtdXRleF91bmxvY2soJmh3bWdyLT5zbXVf
bG9jayk7Cj4KPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gQEAgLTQ2MTksMTYgKzQ2MjEsMjAg
QEAgc3RhdGljIHZvaWQgdmVnYTEwX3Bvd2VyX2dhdGVfdmNlKHN0cnVjdCBwcF9od21nciAqaHdt
Z3IsIGJvb2wgYmdhdGUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCB2ZWdhMTBfaHdtZ3IgKmRhdGEg
PSBod21nci0+YmFja2VuZDsKPgo+IC0gICAgICAgZGF0YS0+dmNlX3Bvd2VyX2dhdGVkID0gYmdh
dGU7Cj4gLSAgICAgICB2ZWdhMTBfZW5hYmxlX2Rpc2FibGVfdmNlX2RwbShod21nciwgIWJnYXRl
KTsKPiArICAgICAgIGlmKGRhdGEpewo+ICsgICAgICAgICAgICAgICBkYXRhLT52Y2VfcG93ZXJf
Z2F0ZWQgPSBiZ2F0ZTsKPiArICAgICAgICAgICAgICAgdmVnYTEwX2VuYWJsZV9kaXNhYmxlX3Zj
ZV9kcG0oaHdtZ3IsICFiZ2F0ZSk7Cj4gKyAgICAgICB9Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCB2
ZWdhMTBfcG93ZXJfZ2F0ZV91dmQoc3RydWN0IHBwX2h3bWdyICpod21nciwgYm9vbCBiZ2F0ZSkK
PiAgewo+ICAgICAgICAgc3RydWN0IHZlZ2ExMF9od21nciAqZGF0YSA9IGh3bWdyLT5iYWNrZW5k
Owo+Cj4gLSAgICAgICBkYXRhLT51dmRfcG93ZXJfZ2F0ZWQgPSBiZ2F0ZTsKPiAtICAgICAgIHZl
Z2ExMF9lbmFibGVfZGlzYWJsZV91dmRfZHBtKGh3bWdyLCAhYmdhdGUpOwo+ICsgICAgICAgaWYo
ZGF0YSl7Cj4gKyAgICAgICAgICAgICAgIGRhdGEtPnV2ZF9wb3dlcl9nYXRlZCA9IGJnYXRlOwo+
ICsgICAgICAgICAgICAgICB2ZWdhMTBfZW5hYmxlX2Rpc2FibGVfdXZkX2RwbShod21nciwgIWJn
YXRlKTsKPiArICAgICAgIH0KPiAgfQo+Cj4gIHN0YXRpYyBpbmxpbmUgYm9vbCB2ZWdhMTBfYXJl
X3Bvd2VyX2xldmVsc19lcXVhbCgKPiAtLQo+IDIuNy40Cj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
