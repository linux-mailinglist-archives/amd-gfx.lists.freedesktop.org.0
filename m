Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE99AD771E
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 15:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAD66E258;
	Tue, 15 Oct 2019 13:11:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3C86E624
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 07:19:21 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id m61so29138399qte.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 00:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qv7Az5tD/2XKPoU73wFDWyAMqFq/42sDZyfm822TJb4=;
 b=oM5LDvLKlx4/9OiQLla4TZUTDQZVAAyeE8Oz1xwLg3+usSN7jrzKf+8S06V91xbD79
 FDYZ1xIYMs5c4gzaB2MzndG97lhsNYlUgglQ9jbEwET0tY6JRRvy5t2MX/RPMW/vaefg
 v1OJDLoLC/MOhz1OPw3qwfKs+zbM4omg+pwpY4ObSZ7QJbaSaiq6F9WULlCnkwdyk7+h
 CcMWjVhYwmnR67UY3iMMQ9OFPhErqc+Hr69FoVa7WsjS8D2hno3A7uOXnmaP9tTSQBDH
 6aJGCxA6K5XRn7sBw3fMalyQwu72+7Oil4vhM14uotliqr5auuWuhJuMgmyxmrCsT7IG
 +hGw==
X-Gm-Message-State: APjAAAXcDtTsrvx7nGi/10xYlndjOwqjfOJjGltIfA1flQNEWFv7GtNP
 1eWa8+zON8v5V7FXjJ9FoO0WEMP1Qv8NOg0I4pk=
X-Google-Smtp-Source: APXvYqwEf7+nYwWc61OYEaNaRzAZ8uh3kP2DVnSCpuosyoqHQiMTeGmwjT2VpKWTH2nEMXm6Ffgs1TODM9UjJHE55vs=
X-Received: by 2002:a05:6214:1150:: with SMTP id
 b16mr35117488qvt.197.1571123960489; 
 Tue, 15 Oct 2019 00:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdnDVe-dahZGnRtzMrx-AH_C+2Lf20qjFQHNtn9xh=Okzw@mail.gmail.com>
 <9e4d6378-5032-8521-13a9-d9d9519d07de@amd.com>
In-Reply-To: <9e4d6378-5032-8521-13a9-d9d9519d07de@amd.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 15 Oct 2019 09:19:04 +0200
Message-ID: <CAK8P3a3_Q15hKT=gyupb0FrPX1xV3tEBpVaYy1LF0kMUj2u8hw@mail.gmail.com>
Subject: Re: AMDGPU and 16B stack alignment
To: "S, Shirish" <sshankar@amd.com>
X-Mailman-Approved-At: Tue, 15 Oct 2019 13:11:05 +0000
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 Matthias Kaehlcke <mka@google.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "S, Shirish" <Shirish.S@amd.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 "yshuiv7@gmail.com" <yshuiv7@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgOTowOCBBTSBTLCBTaGlyaXNoIDxzc2hhbmthckBhbWQu
Y29tPiB3cm90ZToKPiBPbiAxMC8xNS8yMDE5IDM6NTIgQU0sIE5pY2sgRGVzYXVsbmllcnMgd3Jv
dGU6Cgo+IE15IGdjYyBidWlsZCBmYWlscyB3aXRoIGJlbG93IGVycm9yczoKPgo+IGRjbl9jYWxj
cy5jOjE6MDogZXJyb3I6IC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTMgaXMgbm90IGJldHdl
ZW4gNCBhbmQgMTIKPgo+IGRjbl9jYWxjX21hdGguYzoxOjA6IGVycm9yOiAtbXByZWZlcnJlZC1z
dGFjay1ib3VuZGFyeT0zIGlzIG5vdCBiZXR3ZWVuIDQgYW5kIDEyCj4KPiBXaGlsZSBHUEYgb2Jz
ZXJ2ZWQgb24gY2xhbmcgYnVpbGRzIHNlZW0gdG8gYmUgZml4ZWQuCgpPaywgc28gaXQgc2VlbXMg
dGhhdCBnY2MgaW5zaXN0cyBvbiBoYXZpbmcgYXQgbGVhc3QgMl40IGJ5dGVzIHN0YWNrCmFsaWdu
bWVudCB3aGVuClNTRSBpcyBlbmFibGVkIG9uIHg4Ni02NCwgYnV0IGRvZXMgbm90IGFjdHVhbGx5
IHJlbHkgb24gdGhhdCBmb3IKY29ycmVjdCBvcGVyYXRpb24KdW5sZXNzIGl0J3MgdXNpbmcgc3Nl
Mi4gU28gLW1zc2UgYWx3YXlzIGhhcyB0byBiZSBwYWlyZWQgd2l0aAogLW1wcmVmZXJyZWQtc3Rh
Y2stYm91bmRhcnk9My4KCkZvciBjbGFuZywgaXQgc291bmRzIGxpa2UgdGhlIG9wcG9zaXRlIGlz
IHRydWU6IHdoZW4gcGFzc2luZyAxNiBieXRlCnN0YWNrIGFsaWdubWVudAphbmQgaGF2aW5nIHNz
ZS9zc2UyIGVuYWJsZWQsIGl0IHJlcXVpcmVzIHRoZSBpbmNvbWluZyBzdGFjayB0byBiZSAxNgpi
eXRlIGFsaWduZWQsCmJ1dCBwYXNzaW5nIDggYnl0ZSBhbGlnbm1lbnQgbWFrZXMgaXQgZG8gdGhl
IHJpZ2h0IHRoaW5nLgoKU28sIHNob3VsZCB3ZSBqdXN0IGFsd2F5cyBwYXNzICQoY2FsbCBjYy1v
cHRpb24sIC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTQpCnRvIGdldCB0aGUgZGVzaXJlZCBv
dXRjb21lIG9uIGJvdGg/CgogICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
