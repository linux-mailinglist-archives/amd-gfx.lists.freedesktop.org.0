Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD5F18CEA
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 17:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579EB891C5;
	Thu,  9 May 2019 15:25:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3587489D52
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 15:25:28 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r7so2987919wrr.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 May 2019 08:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hxHiIeVSfNWp5RZLElkrFJOn/cRYgBCoNUJoslkozM0=;
 b=hr61eEPX4IJB7pkPY8XaRxO2pdpvOnzmsjcCqCcpNj9o8tr5wBG8WwB4XhVipnzlGQ
 cxA/VeeVqk7weRgNER/7cxUJQww2xB5Cjwm3J63oaVNFbOfKgguTN3EcOSS4uTB14Z6j
 PMeJvoehJW/YNYzkChQHj58eVKjhIZt5RI2maQy5QXa9pETGut1z6AZl67bKqdIpZSlW
 zzRzPqW/gnvQBiXMoJXpmP/FRfILGwwPKe+4vmuVmr1W2+r0lFaeaajP4/ie48gTnHb6
 dbfrWOxH7HiznFml2YizxXhhQMtIFsqfGMi5YJfSe3iqPhtqEVdlXJd0pvbMNlwHA+ay
 iVAA==
X-Gm-Message-State: APjAAAXkZV62naxCCO01I+wwFqw+F70Z8UqqrtKQQ5+NBitVbQnU8YR3
 boXlJQ3wTcOeU0DDO/9FNJHHHheyhEpGYNjUsapKtw==
X-Google-Smtp-Source: APXvYqyLGY/8iJkWP9W1PS/Tt55xU9ZBBEseNNrBMzIMjCcnui1CVIXU1Zs5a07hi1yo4Gp1nW5OBOTHDzs+Z2pNbPc=
X-Received: by 2002:adf:e5cb:: with SMTP id a11mr3818480wrn.128.1557415526872; 
 Thu, 09 May 2019 08:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <1557348409-18026-1-git-send-email-James.Zhu@amd.com>
In-Reply-To: <1557348409-18026-1-git-send-email-James.Zhu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 May 2019 11:25:14 -0400
Message-ID: <CADnq5_NgnQEpNdnozxtB_22LLgFxBuNQ8EVx7yLBrA-Ws=DGeg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix S3 test issue
To: "Zhu, James" <James.Zhu@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hxHiIeVSfNWp5RZLElkrFJOn/cRYgBCoNUJoslkozM0=;
 b=HnLL0uopJTIYxzWxrOziTKiNFOp/79ZcB3VW9JTEBGvFgfQ1p8gQs55ULv5oOnDZon
 8LT6G/pI3W1OSzcZyucXP8w+IgXhmPnmd8Q0549pFrxG24nh0avW1ElFSBRSvBq1xQyL
 Bz5RVVnBGbPqtUwxeVtkrVG1sis6EESVH6p1Y7AHfo8iv9d4erefgxjOzeOhSmyhcGbO
 V9MGPt3EfZbNRjybll7cHZbyQEWr9FKtY2RqiVMQMcZ6vOPFJxK0Jiorah8bQipKVCwI
 Nq9c5H1ZGLhy+amm/iI2eOSIR5tL6r6d0kyjigABnRX5d3/TXTVXi0j3m3vC/QFgQV15
 MeFQ==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgOCwgMjAxOSBhdCA0OjQ3IFBNIFpodSwgSmFtZXMgPEphbWVzLlpodUBhbWQu
Y29tPiB3cm90ZToKPgo+IER1cmluZyBTMyB0ZXN0LCB3aGVuIHN5c3RlbSB3YWtlIHVwIGFuZCBy
ZXN1bWUsIHJhcyBpbnRlcmZhY2UKPiBpcyBhbHJlYWR5IGFsbG9jYXRlZC4gTW92ZSB3b3JrYXJv
dW5kIGJlZm9yZSByYXMganVtcHMgdG8gcmVzdW1lCj4gc3RlcCBpbiBnZnhfdjlfMF9lY2NfbGF0
ZV9pbml0LCBhbmQgbWFrZSBzdXJlIHdvcmthcm91bmQgYXBwbGllZAo+IGR1cmluZyByZXN1bWUu
IEFsc28gcmVtb3ZlIHVudXNlZCBtbUdCX0VEQ19NT0RFIGNsZWFyaW5nLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KCkFja2VkLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgMTQgKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y5XzAuYwo+IGluZGV4IDE0ZTY3MWQuLjM0YTAxZjIgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKPiBAQCAtMzYzMCw3ICszNjMwLDYgQEAgc3RhdGlj
IGludCBnZnhfdjlfMF9kb19lZGNfZ3ByX3dvcmthcm91bmRzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQo+ICAgICAgICAgc3RydWN0IGFtZGdwdV9pYiBpYjsKPiAgICAgICAgIHN0cnVjdCBk
bWFfZmVuY2UgKmYgPSBOVUxMOwo+ICAgICAgICAgaW50IHIsIGksIGo7Cj4gLSAgICAgICB1MzIg
dG1wOwo+ICAgICAgICAgdW5zaWduZWQgdG90YWxfc2l6ZSwgdmdwcl9vZmZzZXQsIHNncHJfb2Zm
c2V0Owo+ICAgICAgICAgdTY0IGdwdV9hZGRyOwo+Cj4gQEAgLTM2NDIsOSArMzY0MSw2IEBAIHN0
YXRpYyBpbnQgZ2Z4X3Y5XzBfZG9fZWRjX2dwcl93b3JrYXJvdW5kcyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKPiAgICAgICAgIGlmICghcmluZy0+c2NoZWQucmVhZHkpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiAwOwo+Cj4gLSAgICAgICB0bXAgPSBSUkVHMzJfU09DMTUoR0MsIDAsIG1t
R0JfRURDX01PREUpOwo+IC0gICAgICAgV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUdCX0VEQ19NT0RF
LCAwKTsKPiAtCj4gICAgICAgICB0b3RhbF9zaXplID0KPiAgICAgICAgICAgICAgICAgKChBUlJB
WV9TSVpFKHZncHJfaW5pdF9yZWdzKSAqIDMpICsgNCArIDUgKyAyKSAqIDQ7Cj4gICAgICAgICB0
b3RhbF9zaXplICs9Cj4gQEAgLTM4MTAsNiArMzgwNiwxMSBAQCBzdGF0aWMgaW50IGdmeF92OV8w
X2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsK
PiAgICAgICAgIH0KPgo+ICsgICAgICAgLyogcmVxdWlyZXMgSUJzIHNvIGRvIGluIGxhdGUgaW5p
dCBhZnRlciBJQiBwb29sIGlzIGluaXRpYWxpemVkICovCj4gKyAgICAgICByID0gZ2Z4X3Y5XzBf
ZG9fZWRjX2dwcl93b3JrYXJvdW5kcyhhZGV2KTsKPiArICAgICAgIGlmIChyKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gcjsKPiArCj4gICAgICAgICBpZiAoKnJhc19pZikKPiAgICAgICAgICAg
ICAgICAgZ290byByZXN1bWU7Cj4KPiBAQCAtMzgxNywxMSArMzgxOCw2IEBAIHN0YXRpYyBpbnQg
Z2Z4X3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCj4gICAgICAgICBpZiAoISpyYXNf
aWYpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Cj4gLSAgICAgICAvKiByZXF1
aXJlcyBJQnMgc28gZG8gaW4gbGF0ZSBpbml0IGFmdGVyIElCIHBvb2wgaXMgaW5pdGlhbGl6ZWQg
Ki8KPiAtICAgICAgIHIgPSBnZnhfdjlfMF9kb19lZGNfZ3ByX3dvcmthcm91bmRzKGFkZXYpOwo+
IC0gICAgICAgaWYgKHIpCj4gLSAgICAgICAgICAgICAgIHJldHVybiByOwo+IC0KPiAgICAgICAg
ICoqcmFzX2lmID0gcmFzX2Jsb2NrOwo+Cj4gICAgICAgICByID0gYW1kZ3B1X3Jhc19mZWF0dXJl
X2VuYWJsZV9vbl9ib290KGFkZXYsICpyYXNfaWYsIDEpOwo+IC0tCj4gMi43LjQKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWls
aW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
