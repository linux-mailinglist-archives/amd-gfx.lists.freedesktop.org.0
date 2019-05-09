Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E14184DF
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 07:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA1D89AD2;
	Thu,  9 May 2019 05:36:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3447089AD2
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 05:36:43 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h4so1058304wre.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 May 2019 22:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXL03DaePi625Tkwc6yUXlKPepVB2lKrPi8RIEjUAdM=;
 b=sb62PlgDraqc0RN9Qdt6gR1PQEReDQnluKFysYDk3ji/Knuo9YzD6S76/YxNM0rsc/
 fpBl55DfQ/hTcTEiCDZmP70sv8jUHZcBGEHMZ1uBeIVtGmSzBAKKoX3V9J8K5dp3i120
 B34+F4mwxHuo0QYJIa424uDc4efwxXhCKuYuXTFYCc5xsETjOG7USGDIwSiPBTbzY4yI
 W2cwC8WOIf/mVj1rpXIzM60sRuURXpBThZ6o+Czf2b6NbaUjl55rlQCEy9w6Rtdo7waj
 B8/+uR9khcqfWjKGkM7WNLYaFmzSOjwMu7YDvSx0Ig5Gj9enW0RXZpVMT2RbZkYe0jYp
 EEnw==
X-Gm-Message-State: APjAAAW9uQKb6FDZmjhxpC0X/ucMROdB+1ape+4JqIovJnuuBiSPXORv
 1IukVdyhiUyDwii9LD651eo7rpG9S0uv8tMZuZ+gAw==
X-Google-Smtp-Source: APXvYqxth2r/MSjVGfhKOHnVFS5Ehxc53t6yPoxGdODVEOLgIiKWLBp83CSqT7mLdq0jRK/+5PuucLKNp+i6JK6OFdQ=
X-Received: by 2002:adf:b641:: with SMTP id i1mr1278284wre.288.1557380201883; 
 Wed, 08 May 2019 22:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190508064333.16154-1-evan.quan@amd.com>
 <20190508064333.16154-2-evan.quan@amd.com>
In-Reply-To: <20190508064333.16154-2-evan.quan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 May 2019 01:36:30 -0400
Message-ID: <CADnq5_Pr36QYgshmcpjfTNyutiAYD9kRs2wVCT02hQvHe0ABfw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: update Vega10 ACG Avfs Gb
 parameters
To: Evan Quan <evan.quan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=IXL03DaePi625Tkwc6yUXlKPepVB2lKrPi8RIEjUAdM=;
 b=i5uvUt3NGog4l9Mv5wSJf4UcQ14ntGSHB70zrBYqM3cladCXXGbpd25XiimUX6n9J9
 /gxwLMPgOfYY8+vct2vBq20nyniQL+9Eg0ik8OalXjDj5HWnXlktSpIkon2ITI7NSolv
 QywMrqnMfcpXMH46mKoX/XHQwqQmPeY9f6025+DiQAspBm4i2RdfUhH/4hSmvQxn2oZD
 UyWLLM/OsJwgQfpo+7dJLhhZB93Y9cDauL8OR7kg+zm51gA2YBAJ2cuGc5ySrNZp/NUX
 DdopLDnckXmCGXjwV/noOosOj+udasRqgEfqGC853pFU0YHOcDY7UmdKin0NUsJloHOd
 hqVw==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgOCwgMjAxOSBhdCAyOjQzIEFNIEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5j
b20+IHdyb3RlOgo+Cj4gVXBkYXRlIFZlZ2ExMCBBQ0cgQXZmcyBHQiBwYXJhbWV0ZXJzLgo+Cj4g
Q2hhbmdlLUlkOiBJYzNkNWIxNzBiOTNhN2E5Mjk0OTI2MjMyM2NhNzEwZGJmOWFjNDliNAo+IFNp
Z25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+CgpTZXJpZXMgaXM6CkFj
a2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyB8IDQg
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2Ex
MF9od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3
bWdyLmMKPiBpbmRleCBiMjk4YWJhMTIwNmIuLjk1ODViYTUxZDg1MyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jCj4gQEAg
LTIyNjcsOCArMjI2Nyw4IEBAIHN0YXRpYyBpbnQgdmVnYTEwX3BvcHVsYXRlX2F2ZnNfcGFyYW1l
dGVycyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBw
X3RhYmxlLT5BY2dBdmZzR2IubTEgICAgICAgICAgICAgICAgICAgPSBhdmZzX3BhcmFtcy51bEFj
Z0diRnVzZVRhYmxlTTE7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcHBfdGFibGUtPkFjZ0F2
ZnNHYi5tMiAgICAgICAgICAgICAgICAgICA9IGF2ZnNfcGFyYW1zLnVsQWNnR2JGdXNlVGFibGVN
MjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBwcF90YWJsZS0+QWNnQXZmc0diLmIgICAgICAg
ICAgICAgICAgICAgID0gYXZmc19wYXJhbXMudWxBY2dHYkZ1c2VUYWJsZUI7Cj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgcHBfdGFibGUtPkFjZ0F2ZnNHYi5tMV9zaGlmdCAgICAgICAgICAgICA9
IDA7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcHBfdGFibGUtPkFjZ0F2ZnNHYi5tMl9zaGlm
dCAgICAgICAgICAgICA9IDA7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcHBfdGFibGUtPkFj
Z0F2ZnNHYi5tMV9zaGlmdCAgICAgICAgICAgICA9IDI0Owo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHBwX3RhYmxlLT5BY2dBdmZzR2IubTJfc2hpZnQgICAgICAgICAgICAgPSAxMjsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBwcF90YWJsZS0+QWNnQXZmc0diLmJfc2hpZnQgICAgICAgICAg
ICAgID0gMDsKPgo+ICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+IC0tCj4gMi4yMS4wCj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZngg
bWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
