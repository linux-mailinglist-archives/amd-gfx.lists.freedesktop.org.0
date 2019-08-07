Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCC484317
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 06:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260A26E5E6;
	Wed,  7 Aug 2019 04:02:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0166E5E6
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 04:02:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s3so80248922wms.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 06 Aug 2019 21:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cvxwh5Q1CDvq6FjXTDwKs9pxhptkpkbLpHFBpcmZjFY=;
 b=FMIEYEy0uINH+kcrYcTuwa5j3drBeMJMeUYVmgtJijiPQnFnWCusNYEQd3S2fJWMEN
 0aEUl3qgKNiiwPlQ6ssrnx6at5frZcomsShr/f6GhxVieFUEt+XDlSjXahQSxE1pTd8i
 gxURmwdzIzAlzYRYv204bT2uZICtjATXm+t85nnSm6xM3uNbu+epRDudUZIzmp7k24w2
 CHaMWoV1cI66afh+U9GEtHvnClHbGwUfvzmcbEIcfAsslko5ThN+7R79rBdIJKZVaJyP
 mh3YvsPZvQUrzf/hQtvhFPBS/g+nhN5nHc14onjg61c2ycufjrmezFIX6gB21LT0G7Yl
 BMbg==
X-Gm-Message-State: APjAAAUUentF58ybFObp262nGz5iXylqGHAs1P+NDHJ3BXjZCgk0XIgl
 uuMAFxYWCeUBtwflIG8xcIzM5BWZ3jaOmKsjTKc=
X-Google-Smtp-Source: APXvYqzqi1md6aMDXZ0aEKmOL6kqcE4x97weuxHXac0i/Nb9bm41r9lGuXyjHxP2jv8v7CweNvkk+3aOrjWKUOQbeuA=
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr7387863wmc.34.1565150567277; 
 Tue, 06 Aug 2019 21:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190807025640.682-1-tao.zhou1@amd.com>
 <20190807105759.58a28ef0@xhacker.debian>
In-Reply-To: <20190807105759.58a28ef0@xhacker.debian>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 7 Aug 2019 00:02:35 -0400
Message-ID: <CADnq5_O4SJexzU2V5+B8tBcTPDU6nR1LakaOMpNng5veOo4guw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=cvxwh5Q1CDvq6FjXTDwKs9pxhptkpkbLpHFBpcmZjFY=;
 b=olLNrj+min9+DpiwL88xfNWSlKYSkBlGciRRSCSLUzj4Q+PQD9g2uATz5gvqMaDrLI
 KcpJaN9ymOMnh74yVqt3OEZIKEsv3KH2RYsMA3TAVVgFy+nSFtfWpl6n2E9yOfU6bwFt
 vi0Zq7+K1Z9nTup+sHKIiAXlvRs6C9f4Hp/bci1Hh5YnDCVhHZQwYDqf/3DxWLHfzfRn
 SAA4iw3VRNeHuH7Ii8oCsTrnZS72mqyJQQLejM0amKEdC8JWKa/HK/F4nnyBFJc2UK7P
 /NGa0+yvP3aqznf9PZu6LTuxTw5Il+6Hn/ZplEEmw5mcoVMq6SJcDVCgRjQdwThC7jWS
 5R8Q==
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
Cc: "kernel-build-reports@lists.linaro.org"
 <kernel-build-reports@lists.linaro.org>,
 "broonie@kernel.org" <broonie@kernel.org>, Tao Zhou <tao.zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "dennis.li@amd.com" <dennis.li@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hawking.zhang@amd.com" <hawking.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxMTozMSBQTSBKaXNoZW5nIFpoYW5nCjxKaXNoZW5nLlpo
YW5nQHN5bmFwdGljcy5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCA3IEF1ZyAyMDE5IDEwOjU2OjQw
ICswODAwIFRhbyBaaG91IHdyb3RlOgo+Cj4KPiA+Cj4gPgo+ID4gcmVhZHEvd3JpdGVxIGFyZSBu
b3Qgc3VwcG9ydGVkIG9uIGFsbCBhcmNoaXRlY3R1cmVzCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
VGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgOCArKy0tLS0tLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+ID4gaW5kZXggNTU4ZmU2ZDA5MWVkLi43
ZWI5ZTBiOTIzNWEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYwo+ID4gQEAgLTI3MiwxNCArMjcyLDEwIEBAIHZvaWQgYW1kZ3B1X21tX3dyZWco
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHJlZywgdWludDMyX3QgdiwKPiA+
ICAgKi8KPiA+ICB1aW50NjRfdCBhbWRncHVfbW1fcnJlZzY0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LCB1aW50MzJfdCByZWcpCj4gPiAgewo+ID4gLSAgICAgICB1aW50NjRfdCByZXQ7Cj4g
PiAtCj4gPiAgICAgICAgIGlmICgocmVnICogNCkgPCBhZGV2LT5ybW1pb19zaXplKQo+ID4gLSAg
ICAgICAgICAgICAgIHJldCA9IHJlYWRxKCgodm9pZCBfX2lvbWVtICopYWRldi0+cm1taW8pICsg
KHJlZyAqIDQpKTsKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gYXRvbWljNjRfcmVhZCgoYXRv
bWljNjRfdCAqKShhZGV2LT5ybW1pbyArIChyZWcgKiA0KSkpOwo+Cj4gYXRvbWljNjRfcmVhZCBk
b2Vzbid0IGVxdWFsIHRvIHJlYWRxIG9uIHNvbWUgYXJjaGl0ZWN0dXJlcy4uCgpXaGF0IHdlIHJl
YWxseSB3YW50ZWQgb3JpZ2luYWxseSB3YXMgYXRvbWljNjQuICBXZSBiYXNpY2FsbHkgd2FudCBh
CnJlYWQgb3Igd3JpdGUgdGhhdCBpcyBndWFyYW50ZWVkIHRvIGJlIDY0IGJpdHMgYXQgYSB0aW1l
LgoKQWxleAoKPgo+ID4gICAgICAgICBlbHNlCj4gPiAgICAgICAgICAgICAgICAgQlVHKCk7Cj4g
PiAtCj4gPiAtICAgICAgIHJldHVybiByZXQ7Cj4gPiAgfQo+ID4KPiA+ICAvKioKPiA+IEBAIC0y
OTQsNyArMjkwLDcgQEAgdWludDY0X3QgYW1kZ3B1X21tX3JyZWc2NChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgdWludDMyX3QgcmVnKQo+ID4gIHZvaWQgYW1kZ3B1X21tX3dyZWc2NChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgcmVnLCB1aW50NjRfdCB2KQo+ID4gIHsK
PiA+ICAgICAgICAgaWYgKChyZWcgKiA0KSA8IGFkZXYtPnJtbWlvX3NpemUpCj4gPiAtICAgICAg
ICAgICAgICAgd3JpdGVxKHYsICgodm9pZCBfX2lvbWVtICopYWRldi0+cm1taW8pICsgKHJlZyAq
IDQpKTsKPiA+ICsgICAgICAgICAgICAgICBhdG9taWM2NF9zZXQoKGF0b21pYzY0X3QgKikoYWRl
di0+cm1taW8gKyAocmVnICogNCkpLCB2KTsKPiA+ICAgICAgICAgZWxzZQo+ID4gICAgICAgICAg
ICAgICAgIEJVRygpOwo+ID4gIH0KPiA+IC0tCj4gPiAyLjE3LjEKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4g
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
