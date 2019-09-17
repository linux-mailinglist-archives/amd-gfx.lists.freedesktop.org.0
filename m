Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8991B514B
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 17:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737066ECE0;
	Tue, 17 Sep 2019 15:20:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898E16ECE0
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 15:20:28 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v17so3660342wml.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 08:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hZTdSBPt99P8d63yIX1BENfeFGmjaZlfxs20K9SAX8c=;
 b=otMhNqi/RihE6RxiP5WsAfUd7jq8HmytiXLQj9s3IZzvUJczD2nk0k06qrPYTH4AoA
 oXHrjFZaalJNAHEXcNSUKz/5vRqPUkxUFChgdCB6SrmrKLWx+4QrE0ZjB6+5SGmXa3K/
 3w3pakhXRfkd1Gp1WM+Y6ElFdHUD70wCS7+GEzVvUeRh4Kcruh6zx5M+9vl/pSZ45vlE
 YDyhjSUpc2ZV51rW/kUg1WWnKGwmfGpX4ygdu3gZzNpIy1bbdRgaqhggIz5YZnFkID2I
 SITvi0khIbMMYOmcpuwoSnsgCaliRwTQYOZQHRHW3c/6JXn5Ihq+QXHCxpTvJjumYDQv
 99oQ==
X-Gm-Message-State: APjAAAVcNjtgPTITF6STsebW41yOAIe+3LH4be0CrNAnUHEvmx4IDPr1
 duPzqbbl39NdP8kWBtG8BqU+ak1jFqW5f/apbeU=
X-Google-Smtp-Source: APXvYqybR6+LBUQH3VuNsePJwAFv4JqQIRGedKleTAbwLH4d6U+GkbqjcZcQxSrwFrOgizoGgtoS0SL2bbFVq2jj8a8=
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr4335544wmo.67.1568733626968; 
 Tue, 17 Sep 2019 08:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190917071222.6132-1-jianzh@amd.com>
In-Reply-To: <20190917071222.6132-1-jianzh@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Sep 2019 11:20:14 -0400
Message-ID: <CADnq5_P3KZ57jYuooV10n+uHQHnwcpe7=fiKBbUCmtQ6nMbj_w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/SRIOV: add navi12 pci id for SRIOV
To: jianzh@amd.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hZTdSBPt99P8d63yIX1BENfeFGmjaZlfxs20K9SAX8c=;
 b=V2ggNV5Yq1+7/kVGyVDGO4qNoxRQOR5oRjTooaq6TTGEVNOZquNlxDmKHeDrecJvxb
 Mrejw0wzj+snnkVZ3WHiJs82CNWUsLpqcRxGENQNPlZ/M4CQHDNSVxuuNatRjzorCyCF
 wNYQRC/IUDnAJYCGcsdp/rmywdviP20wyQK6XMNtUZJCNx6OArS2Wq7TglnVryTA3T8M
 yYYTBwOLKqgGE+xiqeV5jAr/ETysZDKOstEfeDXqeKkiBKzlX4WrIVgcxIPI4V9JLmVG
 xlbtIhbbXttuHHDoVyvGK+zDWBVfUl4y3OUNgMAFOxftPsIqyR4h/W8ui25/T9+KqFva
 zp9A==
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>, "Zhao, Jiange" <Jiange.Zhao@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Nieto,
 David M" <David.Nieto@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMzoxMiBBTSA8amlhbnpoQGFtZC5jb20+IHdyb3RlOgo+
Cj4gRnJvbTogSmlhbmdlIFpoYW8gPEppYW5nZS5aaGFvQGFtZC5jb20+Cj4KPiBBZGQgTmF2aTEy
IFBDSSBpZCBzdXBwb3J0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSmlhbmdlIFpoYW8gPEppYW5nZS5a
aGFvQGFtZC5jb20+CgpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IGluZGV4IDQyMDg4OGU5NDFkZi4uYjUyYzcyNTVl
NWU0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IEBAIC0x
MDM0LDYgKzEwMzQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRs
aXN0W10gPSB7Cj4KPiAgICAgICAgIC8qIE5hdmkxMiAqLwo+ICAgICAgICAgezB4MTAwMiwgMHg3
MzYwLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkxMn0sCj4gKyAgICAg
ICB7MHgxMDAyLCAweDczNjIsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfTkFW
STEyfSwKPgo+ICAgICAgICAgezAsIDAsIDB9Cj4gIH07Cj4gLS0KPiAyLjIwLjEKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWls
aW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
