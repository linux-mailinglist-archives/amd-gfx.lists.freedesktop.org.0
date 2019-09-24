Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C510DBC7DC
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 14:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159D96EA18;
	Tue, 24 Sep 2019 12:29:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BC76EA18
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 12:29:24 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p7so2073442wmp.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 05:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZCBYiY+yvEnDsJCaj4PNPS0KHWxGqEeZpKToEc0w8Zo=;
 b=BS8AgIZXjK/KC5pYe4QlpzAUJw4DsOWCcL82Hvj1rEfqtRjgG/XVp7NzjecipFs7Tk
 PmzWze1oS0yh4F6n7mvckQtb1N26a6pIVtYfrBHFze/WePrF5HAYqZCAZKF8Tod3rl2F
 a10v747gfdPzj+MmlO9HTeGv+TIFNJBt+v/fPZxsdQ3bEOgiN+CiMw7ebbOlNkoQ3REm
 u5PtLC7a8Kx6mU8zeoOlRodXvhZlmGdZHA0DnivEYWINBuQCb44HCCzY6G0toNVD4b3X
 jWScVOlAYp4rw2scn+U8GUF1owjYO+c14Xtq4AaIXfQBE04vPez8z+6TYeDQLs4HfAzf
 h1tg==
X-Gm-Message-State: APjAAAX3IQv6tfyABiM7bBg+zqKW9zul3prxJVj0JRVGbBIsGTRCbcHl
 eNy9axoi6MX7ufVhZAM//izhMn7m6YHpDR2TueE=
X-Google-Smtp-Source: APXvYqyZDA/+k4t80DkMCetojNvOf4wGcKTcoDyjoN/fsOEjNaAmb7W5d1B+ztINPanCJsWyLhjO0FBa6KGduk+iJbo=
X-Received: by 2002:a05:600c:54a:: with SMTP id
 k10mr2653226wmc.127.1569328163190; 
 Tue, 24 Sep 2019 05:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190924115624.10949-1-christian.koenig@amd.com>
In-Reply-To: <20190924115624.10949-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Sep 2019 08:29:10 -0400
Message-ID: <CADnq5_OtCfk-0wdaKJBjx3De2kYCVGTEtRHHAeWshJDL8khnaw@mail.gmail.com>
Subject: Re: [PATCH] drm7amdgpu: once more fix amdgpu_bo_create_kernel_at
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZCBYiY+yvEnDsJCaj4PNPS0KHWxGqEeZpKToEc0w8Zo=;
 b=bNgdVI3p2ApnTzEfZUjw1f2Z4nfY+y5AP8bhay+S561lAISFV2y6/hRZh7KIHIWS5V
 LwX3LbsVj2OWp3Qy36kOiEubVwUHrqDLkBotTMav2qhDhzDJyVBkVh/7tPWXDRSFBv3a
 UD3aRShuN95lrYnpS6ynh9axPFgc6jE3B059YohTeEvM7h5uK4Aj21R+dO0O4G3BY4WL
 ddTNYD5gf5e7VQ+gtix3Wl4rZd+Akw1R163IcNBx9jRpbP15RHatOn9TrCzQhBVQ7Yet
 VQ+3s7kwJiYlUJ5lEuN9idLDH+VFNXmwQQbXkoRb9V/xEi2quPq0LzzigFqw59VOAuYH
 Dssw==
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
Cc: Emily Deng <Emily.Deng@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgNzo1NiBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIENQVSBhY2Nlc3MgaXMg
bmVlZGVkIHdlIHNob3VsZCB0ZWxsIHRoYXQgdG8KPiBhbWRncHVfYm9fY3JlYXRlX3Jlc2VydmVk
KCkgb3Igb3RoZXJ3aXNlIHRoZSBhY2Nlc3MgaXMgZGVuaWVkIGxhdGVyIG9uLgo+Cj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKUmV2
aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyB8IDkgKysrKysr
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4gaW5kZXggMTJk
MmFkY2RmMTRlLi5mMTBiNjE3NWUyMGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X29iamVjdC5jCj4gQEAgLTM2OSw3ICszNjksNyBAQCBpbnQgYW1kZ3B1X2JvX2Ny
ZWF0ZV9rZXJuZWxfYXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAgICAgICBzaXpl
ID0gQUxJR04oc2l6ZSwgUEFHRV9TSVpFKTsKPgo+ICAgICAgICAgciA9IGFtZGdwdV9ib19jcmVh
dGVfcmVzZXJ2ZWQoYWRldiwgc2l6ZSwgUEFHRV9TSVpFLCBkb21haW4sIGJvX3B0ciwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIE5VTEwpOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwgY3B1X2FkZHIpOwo+ICAgICAgICAg
aWYgKHIpCj4gICAgICAgICAgICAgICAgIHJldHVybiByOwo+Cj4gQEAgLTM3NywxMiArMzc3LDE1
IEBAIGludCBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbF9hdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKPiAgICAgICAgICAqIFJlbW92ZSB0aGUgb3JpZ2luYWwgbWVtIG5vZGUgYW5kIGNyZWF0
ZSBhIG5ldyBvbmUgYXQgdGhlIHJlcXVlc3QKPiAgICAgICAgICAqIHBvc2l0aW9uLgo+ICAgICAg
ICAgICovCj4gKyAgICAgICBpZiAoY3B1X2FkZHIpCj4gKyAgICAgICAgICAgICAgIGFtZGdwdV9i
b19rdW5tYXAoKmJvX3B0cik7Cj4gKwo+ICsgICAgICAgdHRtX2JvX21lbV9wdXQoJigqYm9fcHRy
KS0+dGJvLCAmKCpib19wdHIpLT50Ym8ubWVtKTsKPiArCj4gICAgICAgICBmb3IgKGkgPSAwOyBp
IDwgKCpib19wdHIpLT5wbGFjZW1lbnQubnVtX3BsYWNlbWVudDsgKytpKSB7Cj4gICAgICAgICAg
ICAgICAgICgqYm9fcHRyKS0+cGxhY2VtZW50c1tpXS5mcGZuID0gb2Zmc2V0ID4+IFBBR0VfU0hJ
RlQ7Cj4gICAgICAgICAgICAgICAgICgqYm9fcHRyKS0+cGxhY2VtZW50c1tpXS5scGZuID0gKG9m
ZnNldCArIHNpemUpID4+IFBBR0VfU0hJRlQ7Cj4gICAgICAgICB9Cj4gLQo+IC0gICAgICAgdHRt
X2JvX21lbV9wdXQoJigqYm9fcHRyKS0+dGJvLCAmKCpib19wdHIpLT50Ym8ubWVtKTsKPiAgICAg
ICAgIHIgPSB0dG1fYm9fbWVtX3NwYWNlKCYoKmJvX3B0ciktPnRibywgJigqYm9fcHRyKS0+cGxh
Y2VtZW50LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJigqYm9fcHRyKS0+dGJvLm1l
bSwgJmN0eCk7Cj4gICAgICAgICBpZiAocikKPiAtLQo+IDIuMTQuMQo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
