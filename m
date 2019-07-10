Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1316F64BC2
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 19:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916A66E11A;
	Wed, 10 Jul 2019 17:58:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A5E6E11A
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 17:58:30 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p17so3392424wrf.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 10:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PR57Ej7ZVGJjWaPzHKpnA/gNXWGM+QoaVJd4uxD0tJY=;
 b=FwApt+w7Js541W6ct760L9pIcJlpsBFlxJKI9y28Kg9qvU8yGozczG6PpP/8xfhpl6
 LM5JlXIJE0hkakguddBOOEV3EebW4Zk/YuE9IjCWlSACxyAFvov+qUpmFpx0ZgRehIgr
 vTV5pq5bJXEEc8GOpjAw5gyYs0Fl5qhcTR5Z6EA5h1+3Jhsm87mjaoDJUPf4zuM/b/ft
 4Sg1s8j/C9Qc6aVQpCOUTDzJBMgxWYEqs8bRe/8pAfB88uesdnQRvS953KHFWBMYBFsK
 rzxcoYbrtcttxiP9sA2YWqmJSRoyHuFi3VX2TrgCUz29t8LiYjbZE7CrIxUvqHK8EXmk
 gcIA==
X-Gm-Message-State: APjAAAVXhxbs+GeDednp0acjoIpv2X7z2Nsn+mpXXHkLf8Lj7uMRhKQ9
 R4VuxeXM2ptaKf0JFwc3D4vxvovPJuCwpH2VZqeLuA==
X-Google-Smtp-Source: APXvYqzjrpCGLvrv/pYlkifYthbKLakPQVVvNmjyltgkD4o0WxaH0nXooobxqK45oV+vQx1gJXewy/l4cZA2wAqQbrQ=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr31772304wrw.323.1562781509151; 
 Wed, 10 Jul 2019 10:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190710035848.26966-1-Felix.Kuehling@amd.com>
 <20190710035848.26966-5-Felix.Kuehling@amd.com>
In-Reply-To: <20190710035848.26966-5-Felix.Kuehling@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 10 Jul 2019 13:58:17 -0400
Message-ID: <CADnq5_OOTMTKqQKZRijgvUpZh5KDoeeHoyV9E01uuqrK=J3Kjw@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/amdgpu: Fix potential integer overflows
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=PR57Ej7ZVGJjWaPzHKpnA/gNXWGM+QoaVJd4uxD0tJY=;
 b=uJUflKzCfWjmEOsoPPQLnyYIWztNEqCjNILJQ9eCneA3oWZXUFBDuc8vdSooR+VmdN
 lAX1aaVdsfBjWCMjqChrcz4LwXcCbWSiJLxw/U+CeIYKyBOsqXz1GQlwHYdElNpyinma
 AdX44mL6pbb48M/BMDUGI+XDoMnV+yONpJoEkhlTjmSJy1BOefHqK+qu+Pt2em2i69xL
 eEGka5RVwYOv8ulxHSHpVcO6RhxE97vdM0IGx0Zd5dCuB3TzOyvag9U3dI4MKgYJLl70
 q9M5EED6SFusKGXxsfan6VESxcpQgpRGuq7Asgi1IXP5pnSJT2YdDaXle8GppexsXEV/
 LrRw==
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

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCAxMTo1OSBQTSBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+IHdyb3RlOgo+Cj4gV2l0aCBtbV9ub2RlcyBsYXJnZXIgdGhhbiA0R0Is
IGJ5dGVfY291bnQgaW4gYW1kZ3B1X2ZpbGxfYnVmZmVyIHdvdWxkCj4gb3ZlcmZsb3cuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KCkdv
b2QgY2F0Y2guClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMg
fCA5ICsrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IGluZGV4
IGFlMGViNjRlNzM0Yi4uYmJiZjA2OWVmYjc3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYwo+IEBAIC0yMDcxLDkgKzIwNzEsOSBAQCBpbnQgYW1kZ3B1X2ZpbGxf
YnVmZmVyKHN0cnVjdCBhbWRncHVfYm8gKmJvLAo+ICAgICAgICAgbW1fbm9kZSA9IGJvLT50Ym8u
bWVtLm1tX25vZGU7Cj4gICAgICAgICBudW1fbG9vcHMgPSAwOwo+ICAgICAgICAgd2hpbGUgKG51
bV9wYWdlcykgewo+IC0gICAgICAgICAgICAgICB1aW50MzJfdCBieXRlX2NvdW50ID0gbW1fbm9k
ZS0+c2l6ZSA8PCBQQUdFX1NISUZUOwo+ICsgICAgICAgICAgICAgICB1aW50NjRfdCBieXRlX2Nv
dW50ID0gbW1fbm9kZS0+c2l6ZSA8PCBQQUdFX1NISUZUOwo+Cj4gLSAgICAgICAgICAgICAgIG51
bV9sb29wcyArPSBESVZfUk9VTkRfVVAoYnl0ZV9jb3VudCwgbWF4X2J5dGVzKTsKPiArICAgICAg
ICAgICAgICAgbnVtX2xvb3BzICs9IERJVl9ST1VORF9VUF9VTEwoYnl0ZV9jb3VudCwgbWF4X2J5
dGVzKTsKPiAgICAgICAgICAgICAgICAgbnVtX3BhZ2VzIC09IG1tX25vZGUtPnNpemU7Cj4gICAg
ICAgICAgICAgICAgICsrbW1fbm9kZTsKPiAgICAgICAgIH0KPiBAQCAtMjA5OSwxMiArMjA5OSwx
MyBAQCBpbnQgYW1kZ3B1X2ZpbGxfYnVmZmVyKHN0cnVjdCBhbWRncHVfYm8gKmJvLAo+ICAgICAg
ICAgbW1fbm9kZSA9IGJvLT50Ym8ubWVtLm1tX25vZGU7Cj4KPiAgICAgICAgIHdoaWxlIChudW1f
cGFnZXMpIHsKPiAtICAgICAgICAgICAgICAgdWludDMyX3QgYnl0ZV9jb3VudCA9IG1tX25vZGUt
PnNpemUgPDwgUEFHRV9TSElGVDsKPiArICAgICAgICAgICAgICAgdWludDY0X3QgYnl0ZV9jb3Vu
dCA9IG1tX25vZGUtPnNpemUgPDwgUEFHRV9TSElGVDsKPiAgICAgICAgICAgICAgICAgdWludDY0
X3QgZHN0X2FkZHI7Cj4KPiAgICAgICAgICAgICAgICAgZHN0X2FkZHIgPSBhbWRncHVfbW1fbm9k
ZV9hZGRyKCZiby0+dGJvLCBtbV9ub2RlLCAmYm8tPnRiby5tZW0pOwo+ICAgICAgICAgICAgICAg
ICB3aGlsZSAoYnl0ZV9jb3VudCkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90
IGN1cl9zaXplX2luX2J5dGVzID0gbWluKGJ5dGVfY291bnQsIG1heF9ieXRlcyk7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgdWludDMyX3QgY3VyX3NpemVfaW5fYnl0ZXMgPSBtaW5fdCh1aW50
NjRfdCwgYnl0ZV9jb3VudCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG1heF9ieXRlcyk7Cj4KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBhbWRncHVfZW1pdF9maWxsX2J1ZmZlcihhZGV2LCAmam9iLT5pYnNbMF0sIHNyY19kYXRh
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRzdF9h
ZGRyLCBjdXJfc2l6ZV9pbl9ieXRlcyk7Cj4gLS0KPiAyLjE3LjEKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QK
PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
