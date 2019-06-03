Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC4C333AA
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 17:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FA089240;
	Mon,  3 Jun 2019 15:36:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374A189240
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 15:36:43 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id z23so1497091ote.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Jun 2019 08:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ysk87hK/RndHDoFsMlKY9s0HoBw2vJNWH9Bdud9a6w4=;
 b=XsokcBNMCpC+5GL7tOqUOgJGxQn+YWTsIYW2foCK4U5x8AGz8Tlr/0LsweOpW0oont
 Jf4/e/YCYV8eivlYZLQd3+/DH/blzDsqCEv48RK9GD94TXycr5EYAFIQw+8r5WZGb2nr
 45u8DH3vI0kHHgjqdyQEqp6KbRmEpo+xlQGnq42h+cwwngQSW71nOV580zxSVor88yOM
 gWQzn0jWpMKgI8ayjf98q1ioqo/SLuL+qG294DhL54WsIRlcqrTrDDp6t/A6jZ1lgV8S
 MC3grtM1SdPJTmfqnGH4epxK46HxAUekzHa1IbPJd/JaA5lkqjAgCjSIMsV4XO48NcQs
 UpCw==
X-Gm-Message-State: APjAAAXKyYsW+ct7mozpeYUywwzAUqtYoKIsftHwuS0YhzyI6XCWAtoV
 ajuzWMAbliMfjGQEQ2F5+g3qdmNFeCD10SNJgwC4Pw==
X-Google-Smtp-Source: APXvYqz4BRPWmmmpZSzl05SYzwwCun8nLt4YQkgo2iRficS4kkIeKWNc+yWJo0clnqo9vFk274yXNp4AVBdmVGKPy/g=
X-Received: by 2002:a05:6830:4b:: with SMTP id
 d11mr1573630otp.106.1559576170901; 
 Mon, 03 Jun 2019 08:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190529220944.14464-1-alexander.deucher@amd.com>
In-Reply-To: <20190529220944.14464-1-alexander.deucher@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 3 Jun 2019 17:35:59 +0200
Message-ID: <CAKMK7uFFB7ME=d1U-SpCUEtVbysAuW2H--=4EeKKJYofeggLoA@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.3
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ysk87hK/RndHDoFsMlKY9s0HoBw2vJNWH9Bdud9a6w4=;
 b=SZdUpjNaeYBWAG46pAfejGJJOC5lmvQ5FIGJNPiVbarBY+qmuPzMqk8KqnxWg6eqIE
 X5pymTAv05FeSAlqY+n1Y8DvIYxIZlW57gtLT7D0ORmB+jRp2utCFO8I4dGgVEsaz82v
 kvCuaTl0R4wXKNn673mSjEZXYZH25kdX10HJ0=
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
 "airlied@gmail.com" <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMTI6MDkgQU0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hl
ckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgRGF2ZSwgRGFuaWVsLAo+Cj4gTmV3IHN0dWZmIGZv
ciA1LjM6Cj4gLSBBZGQgbmV3IHRoZXJtYWwgc2Vuc29ycyBmb3IgdmVnYSBhc2ljcwo+IC0gVmFy
aW91cyBSQVMgZml4ZXMKPiAtIEFkZCBzeXNmcyBpbnRlcmZhY2UgZm9yIG1lbW9yeSBpbnRlcmZh
Y2UgdXRpbGl6YXRpb24KPiAtIFVzZSBITU0gcmF0aGVyIHRoYW4gbW11IG5vdGlmaWVyIGZvciB1
c2VyIHBhZ2VzCj4gLSBFeHBvc2UgeGdtaSB0b3BvbG9neSB2aWEga2ZkCj4gLSBTUi1JT1YgZml4
ZXMKPiAtIEZpeGVzIGZvciBtYW51YWwgZHJpdmVyIHJlbG9hZAo+IC0gQWRkIHVuaXF1ZSBpZGVu
dGlmaWVyIGZvciB2ZWdhIGFzaWNzCj4gLSBDbGVhbiB1cCB1c2VyIGZlbmNlIGhhbmRsaW5nIHdp
dGggVVZEL1ZDRS9WQ04gYmxvY2tzCj4gLSBDb252ZXJ0IERDIHRvIHVzZSBjb3JlIGJwYyBhdHRy
aWJ1dGUgcmF0aGVyIHRoYW4gYSBjdXN0b20gb25lCj4gLSBBZGQgR1dTIHN1cHBvcnQgZm9yIEtG
RAo+IC0gVmVnYSBwb3dlcnBsYXkgaW1wcm92ZW1lbnRzCj4gLSBBZGQgQ1JDIHN1cHBvcnQgZm9y
IERDRSAxMgo+IC0gU1ItSU9WIHN1cHBvcnQgZm9yIG5ldyBzZWN1cml0eSBwb2xpY3kKPiAtIFZh
cmlvdXMgY2xlYW51cHMKCj4gQ2h1bm1pbmcgWmhvdSAoMSk6Cj4gICAgICAgZHJtL2FtZGdwdTog
YWRkIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FIHRvIGFtZGdwdQoKVGhpcyB1bmNvbmRpdGlvbmFs
bHkgZW5hYmxlcyB0aW1lbGluZSBzeW5jb2JqIHN1cHBvcnQsIFdoaWNoIEkgdGhvdWdodAp3ZSd2
ZSBkZWNpZGVkIHRvIGhvbGQgYmFjayBiZWhpbmQgc29tZSBtb2R1bGVfcGFyYW1fbmFtZWRfdW5z
YWZlIG9yCmV4cGVyaW1lbnRhbCBLY29uZmlnLCBhdCBsZWFzdCB1bnRpbCBLSFIgcmF0aWZpZXMg
dGhlIGV4dGVuc2lvbnMgYW5kCmV2ZXJ5b25lIGNhbiBwdWJsaXNoIHRoZSBtZXNhIHBhdGNoZXMu
IFRoaXMgaXMga2luZGEgdWFwaSB3aXRob3V0CnVzZXJzcGFjZSBhcy1pcyAuLi4gYWxzbyBub3Qg
b24geW91ciBzdW1tYXJ5LCBvciBJJ20gYmxpbmQuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4
IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
