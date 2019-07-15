Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C36698FA
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 18:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488C089973;
	Mon, 15 Jul 2019 16:25:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395E489973
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 16:25:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z1so17748252wru.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 09:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=efj5x/5ME6nhArZlt6HY0n7kgZ4VCIG0HlzxUaT4kCg=;
 b=qpM+fMy2pq2EL/dLysrwlW26ZyUtkX9GnIqgU0Xta+30JMkhwpxpLqnHTT9Mou/++f
 NvmLkMLLobzV51gwjjyWy1Ixg18svoQzRSuhrbtq2rv+CZS89fic2p+JoR4xzqHgDFRQ
 W4S2Dc8HfwP8OEWXDvSq4f50YBV0YPc34dISjxKrtK35bmNqNApiJ2b8rI4pv0cbNCBb
 rdB9RHDzOD9/Q9mYFDV10vziYphssNCPHVEJRkahNFlO3CXWikQHdraoF7TECMwqria7
 Zw7E1PeBsvr/QO67qTTCJYc8CgA22wjbwgX58cjSF1r/94rQBBxyyPtF08246RG5ZFsx
 N69g==
X-Gm-Message-State: APjAAAVZp72z7M6/Y0K+My2nRC5nvAPYtBNmVEZryijDXkS/LdwA/VjU
 YuqqkKd2YJpCxtw1A3AKAqoTWPScUvshfkOk6FEbYg==
X-Google-Smtp-Source: APXvYqwoUrAaDGlyo5coi9tizd5U/Xacxw8jdKflg+dE8DKiKdjulergtLK4SE8+wFrHy9gs26JuEoCIB2UDXyuYglM=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr29335783wrw.323.1563207914827; 
 Mon, 15 Jul 2019 09:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190715085301.5311-1-xywang.sjtu@sjtu.edu.cn>
In-Reply-To: <20190715085301.5311-1-xywang.sjtu@sjtu.edu.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Jul 2019 12:25:03 -0400
Message-ID: <CADnq5_O13JWXuOFJLW9ih9R8iz0PEb0=dv-L-_YD63fMYqn+Pg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: replace simple_strtol() by kstrtou32()
To: xywang.sjtu@sjtu.edu.cn
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=efj5x/5ME6nhArZlt6HY0n7kgZ4VCIG0HlzxUaT4kCg=;
 b=FKOiJqE8Tl8jztjvXnDj5vYhsiRvXws1g/zBaGrhjBivFJh6nE0FGu0egxQLvIBJCi
 0s267883+9dFRgbMVsnyW3LkQl2cdHaLzneun2ShHSsNrMAg1Qg+IXyl1dQiluM5PMeY
 k+w2iwRcQicP9Hj3BMx4bf6hhsMejM0lvITju1JrezPLrAV0kQEHMRjT8pOtswHqqFjz
 65C7alMDfclrDe0bh/AQ2YvJgGjYXeOxVL/5Ujr4gkBAmWcOujTVX/9JaYi+J48GbA7X
 Pdri82Hpst8N2FOe3LP9qefC/LTjOQ3kdceoFDDHjtzSj+uSCRa/Gayr581lhTxbIbDC
 AqAw==
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTA6NTcgQU0gPHh5d2FuZy5zanR1QHNqdHUuZWR1LmNu
PiB3cm90ZToKPgo+IEZyb206IFdhbmcgWGlheWFuZyA8eHl3YW5nLnNqdHVAc2p0dS5lZHUuY24+
Cj4KPiBUaGUgc2ltcGxlX3N0cnRvbCgpIGZ1bmN0aW9uIGlzIGRlcHJlY2F0ZWQuIGtzdHJ0b1ts
LHUzMl0oKSBpcwo+IHRoZSBjb3JyZWN0IHJlcGxhY2VtZW50IGFzIGl0IGNhbiBwcm9wZXJseSBo
YW5kbGUgb3ZlcmZsb3dzLgo+Cj4gVGhpcyBwYXRjaCByZXBsYWNlcyB0aGUgZGVwcmVjYXRlZCBz
aW1wbGVfc3RydG9sKCkgdXNlIGludHJvZHVjZWQgcmVjZW50bHkuCj4gQXMgY2xrIGlzIG9mIHR5
cGUgdWludDMyX3QsIHdlIGFyZSBzYWZlIHRvIHVzZSBrc3RydG91MzIoKS4KPgo+IEl0IGlzIGFs
c28gc2FmZSB0byByZXR1cm4gemVybyBvbiBzdHJpbmcgcGFyc2luZyBlcnJvciwKPiBzaW1pbGFy
IHRvIHRoZSBjYXNlIG9mIHJldHVybmluZyB6ZXJvIGlmIGJ1ZiBpcyBlbXB0eSBpbiBwYXJzZV9j
bGsoKS4KPgo+IEZpeGVzOiBiYjVhMmJkZjM2YTggKCJkcm0vYW1kZ3B1OiBzdXBwb3J0IGRwbSBs
ZXZlbCBtb2RpZmljYXRpb24gdW5kZXIgdmlydHVhbGl6YXRpb24gdjMiKQo+IFNpZ25lZC1vZmYt
Ynk6IFdhbmcgWGlheWFuZyA8eHl3YW5nLnNqdHVAc2p0dS5lZHUuY24+CgpBcHBsaWVkLiAgVGhh
bmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zp
cnQuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmlydC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYwo+IGluZGV4
IDdkNDg0ZmFkMzkwOS4uMmFkZGE0N2RlZjY0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdmlydC5jCj4gQEAgLTM4Niw3ICszODYsOCBAQCBzdGF0aWMgdWludDMyX3Qg
cGFyc2VfY2xrKGNoYXIgKmJ1ZiwgYm9vbCBtaW4pCj4gICAgICAgICAgICAgICAgICBpZiAoIXB0
cikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAgICAgICAgICBw
dHIrPTI7Cj4gLSAgICAgICAgICAgICAgICBjbGsgPSBzaW1wbGVfc3RydG91bChwdHIsIE5VTEws
IDEwKTsKPiArICAgICAgICAgICAgICAgaWYgKGtzdHJ0b3UzMihwdHIsIDEwLCAmY2xrKSkKPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgICB9IHdoaWxlICghbWlu
KTsKPgo+ICAgICAgICAgIHJldHVybiBjbGsgKiAxMDA7Cj4gLS0KPiAyLjExLjAKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWls
aW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
