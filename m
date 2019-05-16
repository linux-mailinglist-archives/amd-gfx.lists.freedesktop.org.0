Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F13F20F90
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 22:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AE8897D4;
	Thu, 16 May 2019 20:23:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492B0897D7
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 20:23:21 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id a132so3081323qkb.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 13:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=uxykAAzQRsmMaS6DXPCCDwV3sMvf0BaFhOqskBdVja8=;
 b=HoCFpASefB759pghQEg8TLk0JhYy4kWlYXEdfLGsln8CwjYfP98TwJKjRFRMQM4eST
 aO8yBQsuuHdJjSzR7K/0Lclcj8Bd7/CO40ogPo03IgqUVM4FkdEgoWQnCqn35ScnNC4Z
 pvaQQBWMV5iMMRRN7vG/QcXetBGx3VlBTbXguWJvogVYw2M3uZXDpSNVGshUKk4PZgdr
 HJcgWdhj87nwKs6pnct0HN7T/Fn9debs5FPzUtlbyNLA+ojJFfkotIv98d3oZDKgLbbr
 YBQaxG1MZM6wMhd3ihS2drThbFa7UfIXwALpap/sEVYfHgEN1GzRav4C2VD0AZ037Ehq
 aUog==
X-Gm-Message-State: APjAAAWaXSNeu6L+pN6E6ZAS6dqv04yV1m/x3TDBBNTALgaikL8dcug9
 B4QvMVluP1J2gISFl7OQPSs5X7wiMBtyAQ==
X-Google-Smtp-Source: APXvYqxMksDRHnFZAAQpXN4QQrZLv1US1+olP6pVlQdynYnNTAq2VvAFJrnqS5zX19frBd0Lu2ZX1w==
X-Received: by 2002:a37:a28c:: with SMTP id l134mr38026973qke.43.1558038200549; 
 Thu, 16 May 2019 13:23:20 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id v13sm3125502qkj.3.2019.05.16.13.23.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 16 May 2019 13:23:19 -0700 (PDT)
Message-ID: <f6ad38b6c714c24cfce32f2c51969ee651bd7699.camel@redhat.com>
Subject: Re: [PATCH 3/7] drm/dp-mst: Use connector kdev as aux device parent
From: Lyude Paul <lyude@redhat.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 16 May 2019 16:23:18 -0400
In-Reply-To: <1558019883-12397-4-git-send-email-sunpeng.li@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
 <1558019883-12397-4-git-send-email-sunpeng.li@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
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
Cc: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA1LTE2IGF0IDExOjE3IC0wNDAwLCBzdW5wZW5nLmxpQGFtZC5jb20gd3Jv
dGU6Cj4gRnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4gCj4gUGxhY2luZyB0aGUg
TVNUIGF1eCBkZXZpY2UgYXMgYSBjaGlsZCBvZiB0aGUgY29ubmVjdG9yIGdpdmVzIHVkZXYgdGhl
Cj4gYWJpbGl0eSB0byBhY2Nlc3MgdGhlIGNvbm5lY3RvciBkZXZpY2UncyBhdHRyaWJ1dGVzLiBU
aGlzIHdpbGwgY29tZSBpbgo+IGhhbmR5IHdoZW4gd3JpdGluZyB1ZGV2IHJ1bGVzIHRvIGNyZWF0
ZSBtb3JlIGRlc2NyaXB0aXZlIHN5bWxpbmtzIHRvIHRoZQo+IE1TVCBhdXggZGV2aWNlcy4KPiAK
PiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBD
YzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMZW8gTGkg
PHN1bnBlbmcubGlAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGluZGV4IDU0ZGE2OGUuLmNk
MmYzYzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBAQCAtMTI2
OSw2ICsxMjY5LDkgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2FkZF9wb3J0KHN0cnVjdCBkcm1fZHBf
bXN0X2JyYW5jaAo+ICptc3RiLAo+ICAJCX0KPiAgCQkoKm1zdGItPm1nci0+Y2JzLT5yZWdpc3Rl
cl9jb25uZWN0b3IpKHBvcnQtPmNvbm5lY3Rvcik7Cj4gIAo+ICsJCWlmIChwb3J0LT5jb25uZWN0
b3ItPnJlZ2lzdHJhdGlvbl9zdGF0ZSA9PQo+IERSTV9DT05ORUNUT1JfUkVHSVNURVJFRCkKPiAr
CQkJcG9ydC0+YXV4LmRldiA9IHBvcnQtPmNvbm5lY3Rvci0+a2RldjsKPiArCgpMaW5lIHdyYXBw
aW5nIHBsZWFzZSEgUHJvYmFibHkgd29ydGggcnVubmluZyBjaGVja3BhdGNoIG9uIGFsbCBvZiB0
aGVzZQpwYXRjaGVzIGFzIHdlbGwuCgpXaXRoIHRoYXQgbml0cGljayBhZGRyZXNzZWQ6CgpSZXZp
ZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCj4gIAkJZHJtX2RwX2F1eF9y
ZWdpc3Rlcl9kZXZub2RlKCZwb3J0LT5hdXgpOwo+ICAJfQo+ICAKLS0gCkNoZWVycywKCUx5dWRl
IFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
