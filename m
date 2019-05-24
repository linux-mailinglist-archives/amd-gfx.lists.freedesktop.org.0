Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD73E29C83
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 18:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B586E118;
	Fri, 24 May 2019 16:49:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2291D6E118
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 16:49:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e15so10706366wrs.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 09:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sad9UpfHJ5sdXzTlwQdywQcHgqAyjq3tv2YnvpOkuAU=;
 b=Vzm2KvA6e6dbZybKql/9kxOu0nZ4hGXyrHkBBOSI2H/6aNMSw8vTDeO/eBZQD9Hrrg
 r3huEPZEiC0234BJljKo1phr8k+Bd2Ft09BLZOBdbq7ZCqTxsNnpef1QhCXoFzUY5udo
 2NAu1QOnDi4hj/UTopcv0HXiYA8ZGpEf0ODUHfWA49Ho34N0P8Ki9DVvtA2TVocUFxkq
 Eioob+DD8lCYhTBcROvSfybHKTulLm5EnSZ0YLVOkt3VYUd3urOBiwKVweOaEECrmbRu
 a11xgvvPp3yf27yfVDwDCdC+IEdz/PqNxNXSrKQxVDOi3J0nael8wQPk7M2P9zm3KK8s
 gCgw==
X-Gm-Message-State: APjAAAVU8W/VY4OQg3HnxC1Zyn7i8UwSROMzgTXnZJkW44DjIeN+Iq6G
 +6fvnMeBtfwhPWdeRtIePUwIrVv1QgkxdCTlmN0=
X-Google-Smtp-Source: APXvYqwZ1Jupf4nzh4giK/K7tUXKf4/KkODs0l91yOUoyoodzJg/m4oK4AGkqJuUW+t/tPN/1tXUuebiAlP1rX9peu8=
X-Received: by 2002:adf:b6a5:: with SMTP id j37mr60560521wre.4.1558716579769; 
 Fri, 24 May 2019 09:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190524153410.19402-1-alexander.deucher@amd.com>
 <CAHbf0-FPr8EZoZeDJKpGp3=wF38JeG7fY-Ayq96jSqq3hMNM+g@mail.gmail.com>
 <CADnq5_OGKUHGCSyFFQhmk5w1j+x5LQahh6KPbDfR2xnREdR3EA@mail.gmail.com>
 <CAHbf0-EYvnaVmqB068CA9hi3Wt7U2a387n6SCUdw8sUjouayZQ@mail.gmail.com>
In-Reply-To: <CAHbf0-EYvnaVmqB068CA9hi3Wt7U2a387n6SCUdw8sUjouayZQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 May 2019 12:49:27 -0400
Message-ID: <CADnq5_N48x5Zas_HWTN1JdEgUUmFadsSiu5_1uZmRgaDw+qraw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Don't load DMCU for Raven 1 (v2)
To: Mike Lothian <mike@fireburn.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Sad9UpfHJ5sdXzTlwQdywQcHgqAyjq3tv2YnvpOkuAU=;
 b=Zuagl5Op4aTTiGFH4ijpjh5xhLnvU10ZjZST3gg+CW5fzknUbGDlfMQ0SynMNvGBtd
 RneXrFfLxqGY3LalCqUN4loZBm2JI3I22IFg20e4Wlj7c0cDQOpubtlacf41I3Ro4pqL
 ehLeIfHCFqv/ZAWKoSCjikLe0gmqgIztpCgXh85cgn+O7X+Qxq2aAdpfDb9tjs8qHw9h
 63Ji+wfZIrG3zq2we4eF+kS5Pv/bHiY+MwcXqBv/jjKmrS/A2cSrJGp6Zt9huePKpA+n
 GPqgtqMM1iqXKIHwnadqtAl3hTrOwk6al4i8ti6A8NnU7xp9KEQXCafqWO7TcKphLj1o
 O5IA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "for 3.8" <stable@vger.kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMTI6MzIgUE0gTWlrZSBMb3RoaWFuIDxtaWtlQGZpcmVi
dXJuLmNvLnVrPiB3cm90ZToKPgo+IEkgcmVhbGlzZSB5b3UgZG9uJ3Qgd2FudCB0byBlbmFibGUg
dGhpcyBhcyBpdCdzIGJyZWFraW5nIHNvbWUgcGVvcGxlJ3MKPiBzeXN0ZW1zLCBidXQgY291bGQg
d2UgYWRkIGEgbmV3IGJvb3QgcGFyYW1ldGVyIHRvIGZvcmNlIGl0IGZvciB3b3JraW5nCj4gc3lz
dGVtcz8gT3IgY2hlY2sgYWdhaW5zdCBhIGJsYWNrIGxpc3QgbWF5YmU/CgpXZSBjb3VsZCBwcm9i
YWJseSBhZGQgYSB3aGl0ZWxpc3QuICBJJ20gbm90IHN1cmUgd2hhdCB0aGUgYmVzdCB3YXkgdG8K
aWQgdGhlIHdvcmtpbmcgc3lzdGVtcyBhcmUgdGhvdWdoLgoKQWxleAoKPgo+IE9uIEZyaSwgMjQg
TWF5IDIwMTkgYXQgMTc6MjAsIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3
cm90ZToKPiA+Cj4gPiBPbiBGcmksIE1heSAyNCwgMjAxOSBhdCAxMjowOSBQTSBNaWtlIExvdGhp
YW4gPG1pa2VAZmlyZWJ1cm4uY28udWs+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaQo+ID4gPgo+ID4g
PiBDdXJpb3VzIHRvIGtub3cgd2hhdCB0aGlzIG1lYW5zIGZvciBmb2xrIHRoYXQgaGF2ZSBuZXdl
ciBSYXZlbjEgYm9hcmRzCj4gPiA+IHRoYXQgZGlkbid0IGhhdmUgaXNzdWVzIGxvYWRpbmcgdGhl
IGZpcm13YXJlCj4gPgo+ID4gWW91IHdvbid0IGdldCBBQk0gSSB0aGluay4gIEFCTSBpcyB0aGUg
YXV0b21hdGljIGJhY2tsaWdodCBtYW5hZ2VtZW50Lgo+ID4KPiA+IEFsZXgKPiA+Cj4gPiA+Cj4g
PiA+IENoZWVycwo+ID4gPgo+ID4gPiBNaWtlCj4gPiA+Cj4gPiA+IE9uIEZyaSwgMjQgTWF5IDIw
MTkgYXQgMTY6MzQsIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToK
PiA+ID4gPgo+ID4gPiA+IEZyb206IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPgo+ID4gPiA+Cj4gPiA+ID4gW1dIWV0KPiA+ID4gPiBTb21lIGVhcmx5IFJhdmVuIGJvYXJk
cyBoYWQgYSBiYWQgU0JJT1MgdGhhdCBkb2Vzbid0IHBsYXkgbmljZWx5IHdpdGgKPiA+ID4gPiB0
aGUgRE1DVSBGVy4gV2UgdGhvdWdodCB0aGUgaXNzdWVzIHdlcmUgZml4ZWQgYnkgaWdub3Jpbmcg
ZXJyb3JzIG9uIERNQ1UKPiA+ID4gPiBsb2FkIGJ1dCB0aGF0IGRvZXNuJ3Qgc2VlbSB0byBiZSB0
aGUgY2FzZS4gV2UndmUgc3RpbGwgc2VlbiByZXBvcnRzIG9mCj4gPiA+ID4gdXNlcnMgdW5hYmxl
IHRvIGJvb3QgdGhlaXIgc3lzdGVtcyBhdCBhbGwuCj4gPiA+ID4KPiA+ID4gPiBbSE9XXQo+ID4g
PiA+IERpc2FibGUgRE1DVSBsb2FkIG9uIFJhdmVuIDEuIE9ubHkgbG9hZCBpdCBmb3IgUmF2ZW4g
MiBhbmQgUGljYXNzby4KPiA+ID4gPgo+ID4gPiA+IHYyOiBGaXggaWZkZWYgKEFsZXgpCj4gPiA+
ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRA
YW1kLmNvbT4KPiA+ID4gPiBSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9s
YXMua2F6bGF1c2thc0BhbWQuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+ID4gPiBDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZwo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTIgKysrKysrKysrKy0tCj4gPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
Cj4gPiA+ID4gaW5kZXggOTk1ZjlkZjY2MTQyLi5iY2IxYTkzYzBiNGMgMTAwNjQ0Cj4gPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+
ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMKPiA+ID4gPiBAQCAtMjksNiArMjksNyBAQAo+ID4gPiA+ICAjaW5jbHVkZSAiZG1fc2Vy
dmljZXNfdHlwZXMuaCIKPiA+ID4gPiAgI2luY2x1ZGUgImRjLmgiCj4gPiA+ID4gICNpbmNsdWRl
ICJkYy9pbmMvY29yZV90eXBlcy5oIgo+ID4gPiA+ICsjaW5jbHVkZSAiZGFsX2FzaWNfaWQuaCIK
PiA+ID4gPgo+ID4gPiA+ICAjaW5jbHVkZSAidmlkLmgiCj4gPiA+ID4gICNpbmNsdWRlICJhbWRn
cHUuaCIKPiA+ID4gPiBAQCAtNjQwLDcgKzY0MSw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9m
aW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ID4gPiA+Cj4gPiA+ID4gIHN0YXRpYyBp
bnQgbG9hZF9kbWN1X2Z3KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ID4gPiA+ICB7Cj4g
PiA+ID4gLSAgICAgICBjb25zdCBjaGFyICpmd19uYW1lX2RtY3U7Cj4gPiA+ID4gKyAgICAgICBj
b25zdCBjaGFyICpmd19uYW1lX2RtY3UgPSBOVUxMOwo+ID4gPiA+ICAgICAgICAgaW50IHI7Cj4g
PiA+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgZG1jdV9maXJtd2FyZV9oZWFkZXJfdjFfMCAqaGRy
Owo+ID4gPiA+Cj4gPiA+ID4gQEAgLTY2Myw3ICs2NjQsMTQgQEAgc3RhdGljIGludCBsb2FkX2Rt
Y3VfZncoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gPiA+ID4gICAgICAgICBjYXNlIENI
SVBfVkVHQTIwOgo+ID4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ID4gPiAgICAg
ICAgIGNhc2UgQ0hJUF9SQVZFTjoKPiA+ID4gPiAtICAgICAgICAgICAgICAgZndfbmFtZV9kbWN1
ID0gRklSTVdBUkVfUkFWRU5fRE1DVTsKPiA+ID4gPiArI2lmIGRlZmluZWQoQ09ORklHX0RSTV9B
TURfRENfRENOMV8wMSkKPiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKEFTSUNSRVZfSVNfUElD
QVNTTyhhZGV2LT5leHRlcm5hbF9yZXZfaWQpKQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGZ3X25hbWVfZG1jdSA9IEZJUk1XQVJFX1JBVkVOX0RNQ1U7Cj4gPiA+ID4gKyAgICAgICAg
ICAgICAgIGVsc2UgaWYgKEFTSUNSRVZfSVNfUkFWRU4yKGFkZXYtPmV4dGVybmFsX3Jldl9pZCkp
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZndfbmFtZV9kbWN1ID0gRklSTVdBUkVf
UkFWRU5fRE1DVTsKPiA+ID4gPiArICAgICAgICAgICAgICAgZWxzZQo+ID4gPiA+ICsjZW5kaWYK
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ID4gPiAgICAgICAg
ICAgICAgICAgYnJlYWs7Cj4gPiA+ID4gICAgICAgICBkZWZhdWx0Ogo+ID4gPiA+ICAgICAgICAg
ICAgICAgICBEUk1fRVJST1IoIlVuc3VwcG9ydGVkIEFTSUMgdHlwZTogMHglWFxuIiwgYWRldi0+
YXNpY190eXBlKTsKPiA+ID4gPiAtLQo+ID4gPiA+IDIuMjAuMQo+ID4gPiA+Cj4gPiA+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiBhbWQt
Z2Z4IG1haWxpbmcgbGlzdAo+ID4gPiA+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
PiA+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
