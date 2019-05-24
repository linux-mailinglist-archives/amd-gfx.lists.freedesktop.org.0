Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7615829C05
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 18:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1713F6E120;
	Fri, 24 May 2019 16:20:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579896E120
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 16:20:17 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r7so10586307wrr.13
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 09:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=slvLGGxwcA81n+66TTX5xYFuTZXUqGR9443CdaEPwK4=;
 b=hg7SbgcD48yUgZBIcUGsmzoVZqUA+2QTs1TsTAOwcNCQgF2kxvJ6MBzzjdyyGuPNZL
 jNTDV4uKtIQcdsZTgngJr0Umexw8hUTgJKckZ9e9jPhM0eXJSJ6V54YBfFIvePH2l4St
 zH3wJApYzGo/06fpCa8cs+9z/KQGQZc0lnq2hKgDFcXoiV0mM/En2Tzw3Yv/FcQjK3zI
 2SV0hoHEjC/2eyxxAT0pnR6LgVNY+a17lk1/w/4ePk3lmukii2Sg0vAgBNRJ+t41wPIP
 twtbsRt5CmkU3h5I5/0DIi9wLp09AiBIIRj1hNTjOBvjUm8eCSUFvKeSJlk1EiqCl0Tl
 EKLQ==
X-Gm-Message-State: APjAAAXKkRBOQRiyb5dRX/6s8I9RgFcgNWVC9D/MRYedze6pbV7Q0Xmq
 0skGq1JltjajjDp+kBg6cQl+wvUw69EtuGcs1QPmPA==
X-Google-Smtp-Source: APXvYqwFH64g6tZSGi0ay6VppV4n/FyzBcnoSfBuzJE8F2UqMd2ap+XRXjnoO0Aw2arRQVkzeBkJ9KVpYg4nQMFbxxQ=
X-Received: by 2002:a5d:4d46:: with SMTP id a6mr4608660wru.142.1558714815298; 
 Fri, 24 May 2019 09:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190524153410.19402-1-alexander.deucher@amd.com>
 <CAHbf0-FPr8EZoZeDJKpGp3=wF38JeG7fY-Ayq96jSqq3hMNM+g@mail.gmail.com>
In-Reply-To: <CAHbf0-FPr8EZoZeDJKpGp3=wF38JeG7fY-Ayq96jSqq3hMNM+g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 May 2019 12:20:03 -0400
Message-ID: <CADnq5_OGKUHGCSyFFQhmk5w1j+x5LQahh6KPbDfR2xnREdR3EA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Don't load DMCU for Raven 1 (v2)
To: Mike Lothian <mike@fireburn.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=slvLGGxwcA81n+66TTX5xYFuTZXUqGR9443CdaEPwK4=;
 b=OYICc3CYj7vrTLFXf+o5oXN3Bf/ybIgXilu9A55qOLv3w42VsNrNI2HeY4E6LVxLja
 4lDBASlUIzyYmb1X0qeoOPrsKt2Byqu3WXTrSq24/jXSKSaCD4wzHfpDbYJwKcDX6xYk
 Z/TMtelz2/90UOB/lcGl5mofxOc3nTx0OD+8qyHVj4c1aijYSsq+lMg8BXNx4ika+TYK
 ORXy+RQ1EXpCVDGce4KkQ1TLqsHxorare3QRIaPQzqpzy7qbgOoJOizzORd0bDxM3v+7
 gMwFxQPjGPnbaFVLlYrii33M93hUCGi6Owdy81SVvI30DS3MmjTYZDu3CvF6VMKfulIK
 yuWw==
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

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMTI6MDkgUE0gTWlrZSBMb3RoaWFuIDxtaWtlQGZpcmVi
dXJuLmNvLnVrPiB3cm90ZToKPgo+IEhpCj4KPiBDdXJpb3VzIHRvIGtub3cgd2hhdCB0aGlzIG1l
YW5zIGZvciBmb2xrIHRoYXQgaGF2ZSBuZXdlciBSYXZlbjEgYm9hcmRzCj4gdGhhdCBkaWRuJ3Qg
aGF2ZSBpc3N1ZXMgbG9hZGluZyB0aGUgZmlybXdhcmUKCllvdSB3b24ndCBnZXQgQUJNIEkgdGhp
bmsuICBBQk0gaXMgdGhlIGF1dG9tYXRpYyBiYWNrbGlnaHQgbWFuYWdlbWVudC4KCkFsZXgKCj4K
PiBDaGVlcnMKPgo+IE1pa2UKPgo+IE9uIEZyaSwgMjQgTWF5IDIwMTkgYXQgMTY6MzQsIEFsZXgg
RGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBIYXJy
eSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiA+Cj4gPiBbV0hZXQo+ID4gU29t
ZSBlYXJseSBSYXZlbiBib2FyZHMgaGFkIGEgYmFkIFNCSU9TIHRoYXQgZG9lc24ndCBwbGF5IG5p
Y2VseSB3aXRoCj4gPiB0aGUgRE1DVSBGVy4gV2UgdGhvdWdodCB0aGUgaXNzdWVzIHdlcmUgZml4
ZWQgYnkgaWdub3JpbmcgZXJyb3JzIG9uIERNQ1UKPiA+IGxvYWQgYnV0IHRoYXQgZG9lc24ndCBz
ZWVtIHRvIGJlIHRoZSBjYXNlLiBXZSd2ZSBzdGlsbCBzZWVuIHJlcG9ydHMgb2YKPiA+IHVzZXJz
IHVuYWJsZSB0byBib290IHRoZWlyIHN5c3RlbXMgYXQgYWxsLgo+ID4KPiA+IFtIT1ddCj4gPiBE
aXNhYmxlIERNQ1UgbG9hZCBvbiBSYXZlbiAxLiBPbmx5IGxvYWQgaXQgZm9yIFJhdmVuIDIgYW5k
IFBpY2Fzc28uCj4gPgo+ID4gdjI6IEZpeCBpZmRlZiAoQWxleCkKPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiA+IFJldmlld2Vk
LWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Cj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDEyICsrKysrKysrKystLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYwo+ID4gaW5kZXggOTk1ZjlkZjY2MTQyLi5iY2IxYTkzYzBiNGMgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4g
PiBAQCAtMjksNiArMjksNyBAQAo+ID4gICNpbmNsdWRlICJkbV9zZXJ2aWNlc190eXBlcy5oIgo+
ID4gICNpbmNsdWRlICJkYy5oIgo+ID4gICNpbmNsdWRlICJkYy9pbmMvY29yZV90eXBlcy5oIgo+
ID4gKyNpbmNsdWRlICJkYWxfYXNpY19pZC5oIgo+ID4KPiA+ICAjaW5jbHVkZSAidmlkLmgiCj4g
PiAgI2luY2x1ZGUgImFtZGdwdS5oIgo+ID4gQEAgLTY0MCw3ICs2NDEsNyBAQCBzdGF0aWMgdm9p
ZCBhbWRncHVfZG1fZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiA+Cj4gPiAgc3Rh
dGljIGludCBsb2FkX2RtY3VfZncoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gPiAgewo+
ID4gLSAgICAgICBjb25zdCBjaGFyICpmd19uYW1lX2RtY3U7Cj4gPiArICAgICAgIGNvbnN0IGNo
YXIgKmZ3X25hbWVfZG1jdSA9IE5VTEw7Cj4gPiAgICAgICAgIGludCByOwo+ID4gICAgICAgICBj
b25zdCBzdHJ1Y3QgZG1jdV9maXJtd2FyZV9oZWFkZXJfdjFfMCAqaGRyOwo+ID4KPiA+IEBAIC02
NjMsNyArNjY0LDE0IEBAIHN0YXRpYyBpbnQgbG9hZF9kbWN1X2Z3KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQo+ID4gICAgICAgICBjYXNlIENISVBfVkVHQTIwOgo+ID4gICAgICAgICAgICAg
ICAgIHJldHVybiAwOwo+ID4gICAgICAgICBjYXNlIENISVBfUkFWRU46Cj4gPiAtICAgICAgICAg
ICAgICAgZndfbmFtZV9kbWN1ID0gRklSTVdBUkVfUkFWRU5fRE1DVTsKPiA+ICsjaWYgZGVmaW5l
ZChDT05GSUdfRFJNX0FNRF9EQ19EQ04xXzAxKQo+ID4gKyAgICAgICAgICAgICAgIGlmIChBU0lD
UkVWX0lTX1BJQ0FTU08oYWRldi0+ZXh0ZXJuYWxfcmV2X2lkKSkKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGZ3X25hbWVfZG1jdSA9IEZJUk1XQVJFX1JBVkVOX0RNQ1U7Cj4gPiArICAgICAg
ICAgICAgICAgZWxzZSBpZiAoQVNJQ1JFVl9JU19SQVZFTjIoYWRldi0+ZXh0ZXJuYWxfcmV2X2lk
KSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGZ3X25hbWVfZG1jdSA9IEZJUk1XQVJFX1JB
VkVOX0RNQ1U7Cj4gPiArICAgICAgICAgICAgICAgZWxzZQo+ID4gKyNlbmRpZgo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
PiAgICAgICAgIGRlZmF1bHQ6Cj4gPiAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJVbnN1cHBv
cnRlZCBBU0lDIHR5cGU6IDB4JVhcbiIsIGFkZXYtPmFzaWNfdHlwZSk7Cj4gPiAtLQo+ID4gMi4y
MC4xCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiA+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
