Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FF4BE3A7
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 19:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32559890EF;
	Wed, 25 Sep 2019 17:45:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD3D890F7
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 17:45:02 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id s6so2367118ywe.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 10:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=OwXWZPnQzf3XInXWmq5k6gcPq0axL7VeZ/2pUkeIAO0=;
 b=ARmkXE0EU8jpAZMbtzwgQ6iyZS+5jxvWqsFrbmBYSFa/SamgJcHMPnmvft0O3GrEft
 Cz6DQScpFkx0E7lo9zM+76VYCjcW3EhJ70QNyBHuBwoSwX6ulKU1lag3XNxI/DiNHXwU
 iZJO4vRqBwKge1jTum2R/BLNuhPZ+ErASquWEurEM96dkBdZBaq/+zkN72GrqB6GfB18
 b8591fj0YFsRCVuWv/yvRAR86ZkPrxh1cC0Jzw7MgIhiv290ICc085lM6BEVpg5UFWOD
 avpdxAXlpOstJ7VrPM3fBUl2BywmPN8XjcOnQwo0HsrhLF/7DIhbFbCL51o27ThoVCiK
 7VQQ==
X-Gm-Message-State: APjAAAXQui/0x+hNFibVRLTt9Ahk0xs4WRI0AfSmG68/Isa6apJmUbWs
 dNAgx2UGkKMxZE859ndA0zuqHw==
X-Google-Smtp-Source: APXvYqxiTwnx/w47MoIffPeZy27M224makbmCx5nzSH8a736vVNBtE4G47Q7IhV/AMkoZsqLvj+jkQ==
X-Received: by 2002:a81:6589:: with SMTP id z131mr6316271ywb.262.1569433501520; 
 Wed, 25 Sep 2019 10:45:01 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 189sm1371215ywa.47.2019.09.25.10.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 10:45:00 -0700 (PDT)
Date: Wed, 25 Sep 2019 13:45:00 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 01/27] drm/dp_mst: Move link address dumping into a
 function
Message-ID: <20190925174500.GB218215@art_vandelay>
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903204645.25487-2-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=OwXWZPnQzf3XInXWmq5k6gcPq0axL7VeZ/2pUkeIAO0=;
 b=RuBZqIvukahNvS2RWkJSSIoSGRWT90uYjmjps6VQ1ybNW3AYnanSdd4620DHDwc/yF
 N2132Z2o6rc0ScIkepSll+PIIr1lBpgU29MoUPbGETeSuqTivFQslAQAH3+AqGym/YQv
 n226t8zfFzSifU9oPn5hVQKYfolEPuSacs9PkqBS5iZD08BM2dPV1TC94ONamhSa5CGx
 mlRTN2p8fN432g8cr9uFNmhwLjYFWInOrA6u5wZ30Cv4BbNR1jZuP7+ShVrWs4RDvU6l
 Pji0dM4YDZn9YVYfraDmMuLmKvlrLRDMGMSb6X4tfcFD8bEEsPdl0MYISqAv1F0Lzjo3
 Q/IA==
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Juston Li <juston.li@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <hwentlan@amd.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDQ6NDU6MzlQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBNYWtlcyB0aGluZ3MgZWFzaWVyIHRvIHJlYWQuCj4gCj4gQ2M6IEp1c3RvbiBMaSA8anVz
dG9uLmxpQGludGVsLmNvbT4KPiBDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgo+
IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IENj
OiBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNvbT4KPiBSZXZpZXdlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IFNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5
dWRlQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+
Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMzUgKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMKPiBpbmRleCA4MmFkZDczNmUxN2QuLjM2ZGI2NmEwZGRiMSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC0yMTAzLDYgKzIxMDMsMjggQEAgc3RhdGljIHZv
aWQgZHJtX2RwX3F1ZXVlX2Rvd25fdHgoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICpt
Z3IsCj4gIAltdXRleF91bmxvY2soJm1nci0+cWxvY2spOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9p
ZAo+ICtkcm1fZHBfZHVtcF9saW5rX2FkZHJlc3Moc3RydWN0IGRybV9kcF9saW5rX2FkZHJlc3Nf
YWNrX3JlcGx5ICpyZXBseSkKPiArewo+ICsJc3RydWN0IGRybV9kcF9saW5rX2FkZHJfcmVwbHlf
cG9ydCAqcG9ydF9yZXBseTsKPiArCWludCBpOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCByZXBs
eS0+bnBvcnRzOyBpKyspIHsKPiArCQlwb3J0X3JlcGx5ID0gJnJlcGx5LT5wb3J0c1tpXTsKPiAr
CQlEUk1fREVCVUdfS01TKCJwb3J0ICVkOiBpbnB1dCAlZCwgcGR0OiAlZCwgcG46ICVkLCBkcGNk
X3JldjogJTAyeCwgbWNzOiAlZCwgZGRwczogJWQsIGxkcHMgJWQsIHNkcCAlZC8lZFxuIiwKPiAr
CQkJICAgICAgaSwKPiArCQkJICAgICAgcG9ydF9yZXBseS0+aW5wdXRfcG9ydCwKPiArCQkJICAg
ICAgcG9ydF9yZXBseS0+cGVlcl9kZXZpY2VfdHlwZSwKPiArCQkJICAgICAgcG9ydF9yZXBseS0+
cG9ydF9udW1iZXIsCj4gKwkJCSAgICAgIHBvcnRfcmVwbHktPmRwY2RfcmV2aXNpb24sCj4gKwkJ
CSAgICAgIHBvcnRfcmVwbHktPm1jcywKPiArCQkJICAgICAgcG9ydF9yZXBseS0+ZGRwcywKPiAr
CQkJICAgICAgcG9ydF9yZXBseS0+bGVnYWN5X2RldmljZV9wbHVnX3N0YXR1cywKPiArCQkJICAg
ICAgcG9ydF9yZXBseS0+bnVtX3NkcF9zdHJlYW1zLAo+ICsJCQkgICAgICBwb3J0X3JlcGx5LT5u
dW1fc2RwX3N0cmVhbV9zaW5rcyk7Cj4gKwl9Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIGRybV9k
cF9zZW5kX2xpbmtfYWRkcmVzcyhzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwK
PiAgCQkJCSAgICAgc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiKQo+ICB7Cj4gQEAgLTIx
MjgsMTggKzIxNTAsNyBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfc2VuZF9saW5rX2FkZHJlc3Moc3Ry
dWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCj4gIAkJCURSTV9ERUJVR19LTVMoImxp
bmsgYWRkcmVzcyBuYWsgcmVjZWl2ZWRcbiIpOwo+ICAJCX0gZWxzZSB7Cj4gIAkJCURSTV9ERUJV
R19LTVMoImxpbmsgYWRkcmVzcyByZXBseTogJWRcbiIsIHR4bXNnLT5yZXBseS51LmxpbmtfYWRk
ci5ucG9ydHMpOwo+IC0JCQlmb3IgKGkgPSAwOyBpIDwgdHhtc2ctPnJlcGx5LnUubGlua19hZGRy
Lm5wb3J0czsgaSsrKSB7Cj4gLQkJCQlEUk1fREVCVUdfS01TKCJwb3J0ICVkOiBpbnB1dCAlZCwg
cGR0OiAlZCwgcG46ICVkLCBkcGNkX3JldjogJTAyeCwgbWNzOiAlZCwgZGRwczogJWQsIGxkcHMg
JWQsIHNkcCAlZC8lZFxuIiwgaSwKPiAtCQkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5saW5rX2Fk
ZHIucG9ydHNbaV0uaW5wdXRfcG9ydCwKPiAtCQkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5saW5r
X2FkZHIucG9ydHNbaV0ucGVlcl9kZXZpY2VfdHlwZSwKPiAtCQkJCSAgICAgICB0eG1zZy0+cmVw
bHkudS5saW5rX2FkZHIucG9ydHNbaV0ucG9ydF9udW1iZXIsCj4gLQkJCQkgICAgICAgdHhtc2ct
PnJlcGx5LnUubGlua19hZGRyLnBvcnRzW2ldLmRwY2RfcmV2aXNpb24sCj4gLQkJCQkgICAgICAg
dHhtc2ctPnJlcGx5LnUubGlua19hZGRyLnBvcnRzW2ldLm1jcywKPiAtCQkJCSAgICAgICB0eG1z
Zy0+cmVwbHkudS5saW5rX2FkZHIucG9ydHNbaV0uZGRwcywKPiAtCQkJCSAgICAgICB0eG1zZy0+
cmVwbHkudS5saW5rX2FkZHIucG9ydHNbaV0ubGVnYWN5X2RldmljZV9wbHVnX3N0YXR1cywKPiAt
CQkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIucG9ydHNbaV0ubnVtX3NkcF9zdHJl
YW1zLAo+IC0JCQkJICAgICAgIHR4bXNnLT5yZXBseS51LmxpbmtfYWRkci5wb3J0c1tpXS5udW1f
c2RwX3N0cmVhbV9zaW5rcyk7Cj4gLQkJCX0KPiArCQkJZHJtX2RwX2R1bXBfbGlua19hZGRyZXNz
KCZ0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIpOwo+ICAKPiAgCQkJZHJtX2RwX2NoZWNrX21zdGJf
Z3VpZChtc3RiLCB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIuZ3VpZCk7Cj4gIAo+IC0tIAo+IDIu
MjEuMAo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9t
aXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
