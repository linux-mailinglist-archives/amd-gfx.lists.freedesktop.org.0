Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B10A29BD5
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 18:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27226E119;
	Fri, 24 May 2019 16:09:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA896E119
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 16:09:54 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d10so8341316qko.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 09:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pPF5M4T7jfmbO2sVZIkEKDwqwLFdt6EeO4Jbgz9qlDY=;
 b=BhVyOKoDPuABb0ECy11PCreYjVzhJW09Z8027jdc6/12z3CczaCBP/8mAdkc5mMw3t
 lrHJK4eXXkFyAgegdmqXaJDdEFkMbecEpOaJSWpl8piQtnSAQx4CN7fmG4VVb03a73YB
 yoCqkIvTDIJoutRS//sBdubPJTNcZtpNwjIfuR0nx/RWckjsKY2VXAlEvoZ72C15odBC
 ONDWWSHfIuzaHuVnzubH93Itl5siC5RoBzumxZqeUBvpjz8/SepNOJT9VC+zVLKDxXqS
 xnqykaumAvt0QMEkGNsvy30CShdcbV6OhYvP8HCm8HgHXovuPRcvX/8C65Tt6k0EYCIl
 dabg==
X-Gm-Message-State: APjAAAXVHCns8ZoPCVdveONh/PaTG0ntJgIlDRd0j0CZ0NKW1U+YuCtd
 8PmROFPKShewdtC2KtCoxduqyv5P6rHWOv/rbUdS+w==
X-Google-Smtp-Source: APXvYqwyPs/NisfCviyk+3rm00xHBAhpPgsgde1Fq32DbbDSzEQvbR0DD4WjalzMX4+O17NvmxwSVb1oRIhJTu8Xxt0=
X-Received: by 2002:a37:b7c6:: with SMTP id h189mr1868586qkf.347.1558714193671; 
 Fri, 24 May 2019 09:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190524153410.19402-1-alexander.deucher@amd.com>
In-Reply-To: <20190524153410.19402-1-alexander.deucher@amd.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Fri, 24 May 2019 17:09:41 +0100
Message-ID: <CAHbf0-FPr8EZoZeDJKpGp3=wF38JeG7fY-Ayq96jSqq3hMNM+g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Don't load DMCU for Raven 1 (v2)
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pPF5M4T7jfmbO2sVZIkEKDwqwLFdt6EeO4Jbgz9qlDY=;
 b=rH6cGslaVWHT0aa/YZuPXDCwP99w50DKTprXZMxeMX1TZblUZ9vF/q7jsRzDeA/teu
 b62fT+NZUqP22nBG1cvT8mWl1BygRwaK+GhpHewvg/6UL8m7I4O7oOtdWvas+Gr6QbD3
 uAPaqrC8tZI11IYWZB/aMgHKwT47IFP+/HMJng/oVUuyFuM8HrISNTZjWA5wIfbBnySK
 EkRezVarH/ftHCjXpK+vTaJxSC3FRzASY/l4+zq9axZs8zuINwrqH6+k3baVlrKisxym
 0qF0kbbZ0cuzlimeooFKeUb7Wvnqr0bm1Dz48N8glqQJBw+GmOETr8ykWh2oDlS8LqpA
 Ma3w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org,
 Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkKCkN1cmlvdXMgdG8ga25vdyB3aGF0IHRoaXMgbWVhbnMgZm9yIGZvbGsgdGhhdCBoYXZlIG5l
d2VyIFJhdmVuMSBib2FyZHMKdGhhdCBkaWRuJ3QgaGF2ZSBpc3N1ZXMgbG9hZGluZyB0aGUgZmly
bXdhcmUKCkNoZWVycwoKTWlrZQoKT24gRnJpLCAyNCBNYXkgMjAxOSBhdCAxNjozNCwgQWxleCBE
ZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogSGFycnkgV2Vu
dGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4KPiBbV0hZXQo+IFNvbWUgZWFybHkgUmF2
ZW4gYm9hcmRzIGhhZCBhIGJhZCBTQklPUyB0aGF0IGRvZXNuJ3QgcGxheSBuaWNlbHkgd2l0aAo+
IHRoZSBETUNVIEZXLiBXZSB0aG91Z2h0IHRoZSBpc3N1ZXMgd2VyZSBmaXhlZCBieSBpZ25vcmlu
ZyBlcnJvcnMgb24gRE1DVQo+IGxvYWQgYnV0IHRoYXQgZG9lc24ndCBzZWVtIHRvIGJlIHRoZSBj
YXNlLiBXZSd2ZSBzdGlsbCBzZWVuIHJlcG9ydHMgb2YKPiB1c2VycyB1bmFibGUgdG8gYm9vdCB0
aGVpciBzeXN0ZW1zIGF0IGFsbC4KPgo+IFtIT1ddCj4gRGlzYWJsZSBETUNVIGxvYWQgb24gUmF2
ZW4gMS4gT25seSBsb2FkIGl0IGZvciBSYXZlbiAyIGFuZCBQaWNhc3NvLgo+Cj4gdjI6IEZpeCBp
ZmRlZiAoQWxleCkKPgo+IFNpZ25lZC1vZmYtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50
bGFuZEBhbWQuY29tPgo+IFJldmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xh
cy5rYXpsYXVza2FzQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAx
MiArKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKPiBpbmRleCA5OTVmOWRmNjYxNDIuLmJjYjFhOTNjMGI0YyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
Ywo+IEBAIC0yOSw2ICsyOSw3IEBACj4gICNpbmNsdWRlICJkbV9zZXJ2aWNlc190eXBlcy5oIgo+
ICAjaW5jbHVkZSAiZGMuaCIKPiAgI2luY2x1ZGUgImRjL2luYy9jb3JlX3R5cGVzLmgiCj4gKyNp
bmNsdWRlICJkYWxfYXNpY19pZC5oIgo+Cj4gICNpbmNsdWRlICJ2aWQuaCIKPiAgI2luY2x1ZGUg
ImFtZGdwdS5oIgo+IEBAIC02NDAsNyArNjQxLDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2Zp
bmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4KPiAgc3RhdGljIGludCBsb2FkX2RtY3Vf
Zncoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gIHsKPiAtICAgICAgIGNvbnN0IGNoYXIg
KmZ3X25hbWVfZG1jdTsKPiArICAgICAgIGNvbnN0IGNoYXIgKmZ3X25hbWVfZG1jdSA9IE5VTEw7
Cj4gICAgICAgICBpbnQgcjsKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBkbWN1X2Zpcm13YXJlX2hl
YWRlcl92MV8wICpoZHI7Cj4KPiBAQCAtNjYzLDcgKzY2NCwxNCBAQCBzdGF0aWMgaW50IGxvYWRf
ZG1jdV9mdyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICAgICAgIGNhc2UgQ0hJUF9W
RUdBMjA6Cj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgY2FzZSBDSElQX1JB
VkVOOgo+IC0gICAgICAgICAgICAgICBmd19uYW1lX2RtY3UgPSBGSVJNV0FSRV9SQVZFTl9ETUNV
Owo+ICsjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04xXzAxKQo+ICsgICAgICAgICAg
ICAgICBpZiAoQVNJQ1JFVl9JU19QSUNBU1NPKGFkZXYtPmV4dGVybmFsX3Jldl9pZCkpCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgZndfbmFtZV9kbWN1ID0gRklSTVdBUkVfUkFWRU5fRE1DVTsK
PiArICAgICAgICAgICAgICAgZWxzZSBpZiAoQVNJQ1JFVl9JU19SQVZFTjIoYWRldi0+ZXh0ZXJu
YWxfcmV2X2lkKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBmd19uYW1lX2RtY3UgPSBGSVJN
V0FSRV9SQVZFTl9ETUNVOwo+ICsgICAgICAgICAgICAgICBlbHNlCj4gKyNlbmRpZgo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAg
ICAgICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAgICAgIERSTV9FUlJPUigiVW5zdXBwb3J0ZWQg
QVNJQyB0eXBlOiAweCVYXG4iLCBhZGV2LT5hc2ljX3R5cGUpOwo+IC0tCj4gMi4yMC4xCj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZngg
bWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
