Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A407F4AEC4
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jun 2019 01:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD626E272;
	Tue, 18 Jun 2019 23:34:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422946E272
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 23:34:06 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h19so3348949wme.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 16:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j/wyTrT/TIRiJwJQsMAzK3Nq4DjTUm6dB9isaUdUvoM=;
 b=d9+kAZHgP57bxojrocmYePApbGxWg88YncfT96QTW1kuWzCDyv2NhwlAIotsMzG9Sc
 xju9T37uXuZzdaZrguU4jxQDGlHNeSyznPP+X36ZyW3CHO3I1UtZSEy20vXGa31hKhuO
 f1URZRMmCCgUsDbArCLWkWThs2EJk9N79WcbjoIHwN9CJ0JNaj1/WH8S+7I9TCcXR8oV
 +8ej9ywbbCeDEJBydiBPHcRpjE0xeqFXQiNRHBElhzX+gaZJdijP+IVybNy7OiFQBsxh
 hbr5wk8fH9w+9WzmuKzBy9xDAKJyw5hShfLjyKEK6QPEzHzQe6VA94rvwMZeBByKJOdC
 7KWQ==
X-Gm-Message-State: APjAAAX/WudFNc0Tp7x7ri2OgzHeU9RP24ENxlGwws0JM6iaRoJZ+l9z
 Hwd0uoP5Bg+MpIBuw67P+e+r9HcYcWyD1G8X4J/UeiXfqUo=
X-Google-Smtp-Source: APXvYqxK2mair0NIfJn6E0rkMLaPlLjHU5CreXReDmPNUA0VQoWNrq8NqqEzc9TnDuLfOK/SjYsPMnCxmQ7ma6zt8ZI=
X-Received: by 2002:a1c:3c8a:: with SMTP id j132mr5382752wma.172.1560900844678; 
 Tue, 18 Jun 2019 16:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <1560858033-1499-1-git-send-email-Hawking.Zhang@amd.com>
 <1560858033-1499-3-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1560858033-1499-3-git-send-email-Hawking.Zhang@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 19 Jun 2019 01:33:30 +0200
Message-ID: <CAP+8YyGNZzpT5L=PqbtVoqUgxVbNFheUCtZbDT1A+o-RW0qFXA@mail.gmail.com>
Subject: Re: [PATCH libdrm 3/4] libdrm/amdgpu: add new vram type (GDDR6) for
 navi10
To: Hawking Zhang <Hawking.Zhang@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=j/wyTrT/TIRiJwJQsMAzK3Nq4DjTUm6dB9isaUdUvoM=;
 b=MS1wYxYf1KI2Skrms5cZiOmkAiNNCNw3vBX9lTwEjQ/OKGB0BmmfYLdguyROwaStw8
 mCLFmYVlQ4MDRM9qxbuchuj+2Zs4lAQMsjnKJazhqZSucF3FQwcrFVruPDgeYuC2wdlv
 Pdof5Do1vtWYD+9EsEb1zoyMiWgVdx0Y22+SwH2xVFOI9Odk4Bp0OeAyAsNc/VkQBHTj
 cv5bat3vpX78aGMermEVDUsB3HYJQ6uvzoHsdWOMi0+/6x1Dz8mlIDEJj7vlY2K5sPRF
 bDYyDqfGmnQvn28CcgClvlKLLB2Xnugcga3G4R+Dn/Oa6+hMb+sTu/I7ztXC7LO4Zsoq
 BJmA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTo0MSBQTSBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpo
YW5nQGFtZC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29t
Pgo+Cj4gQU1ER1BVX1ZSQU1fVFlQRV9HRERSNiBpcyBhIG5ldyB2cmFtIHR5cGUgZm9yIG5hdmkx
MAo+Cj4gQ2hhbmdlLUlkOiBJNjc4OTIzMGY4ZjdmNWJkY2IwYWVjODJjYzc2NGQxMGQ3MmM0Y2Jh
OAoKQ2FuIHlvdSByZW1vdmUgdGhlIENoYW5nZS1JZCBmcm9tIHRoZXNlIHBhdGNoZXM/CgpPdGhl
cndpc2UsCgpSZXZpZXdlZC1ieTogQmFzIE5pZXV3ZW5odWl6ZW4gPGJhc0BiYXNuaWV1d2VuaHVp
emVuLm5sPgoKZm9yIHBhdGNoZXMgMS0zLiAod2lsbCBub3QgcmV2aWV3IDQgZHVlIHRvIGxhY2sg
b2Yga25vd2xlZGdlKQoKPiBTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4K
PiAtLS0KPiAgaW5jbHVkZS9kcm0vYW1kZ3B1X2RybS5oIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2FtZGdwdV9kcm0u
aCBiL2luY2x1ZGUvZHJtL2FtZGdwdV9kcm0uaAo+IGluZGV4IGIwYzc1NTUuLjAxNWJkOWYgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vYW1kZ3B1X2RybS5oCj4gKysrIGIvaW5jbHVkZS9kcm0v
YW1kZ3B1X2RybS5oCj4gQEAgLTkxMyw2ICs5MTMsNyBAQCBzdHJ1Y3QgZHJtX2FtZGdwdV9pbmZv
X2Zpcm13YXJlIHsKPiAgI2RlZmluZSBBTURHUFVfVlJBTV9UWVBFX0hCTSAgIDYKPiAgI2RlZmlu
ZSBBTURHUFVfVlJBTV9UWVBFX0REUjMgIDcKPiAgI2RlZmluZSBBTURHUFVfVlJBTV9UWVBFX0RE
UjQgIDgKPiArI2RlZmluZSBBTURHUFVfVlJBTV9UWVBFX0dERFI2IDkKPgo+ICBzdHJ1Y3QgZHJt
X2FtZGdwdV9pbmZvX2RldmljZSB7Cj4gICAgICAgICAvKiogUENJIERldmljZSBJRCAqLwo+IC0t
Cj4gMi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
