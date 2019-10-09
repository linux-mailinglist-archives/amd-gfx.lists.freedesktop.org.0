Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D95D1B28
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D7D897AC;
	Wed,  9 Oct 2019 21:45:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295256E342
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:43:14 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id v2so8828219iob.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 09 Oct 2019 14:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=U3rIFP0JdEbhaAid2HQ7qeDdmlGcxxKKB6oMU2vQVmo=;
 b=FhmNbLe4V7syUn7EBV8CwYkfIVMIs1RuynxNxjz4zfebnBQ9Q6VDcjezoge74d7O4o
 u2RdGKaV/ixJg60VcR05zryTS9cnIY5lVDUbfLaQG0EUAtFPfPJ5b7x+rmi2qU3nvlwg
 DJf55Ybqa3c+9rS5BiMrdNqh+8Wf9a2WOibjGcqqFr3/hekfsU78Kc9Yg2OoxRxad7Ua
 DNG44Qe5UrOciHX0VjQxFKLnUVLSWr57KhJaQX3QEJe0NQ5Ka0gOK1zAnrw/vfL/It2C
 jYkAZzVpUCUy1K6HvGiw1D75LOcG/tfcve1TL9kjYONDIaBNrMl5hMA2I7nZc6Xn04iJ
 pUTQ==
X-Gm-Message-State: APjAAAXC6zM3RGsl5l2J1UsY/SG/wt6F8WzfqFFa9fWpcmtOo1+XVBBZ
 NFrnxZ2xiN3NrGUsLAyNnbZAmVmMtg0XqjVJGtv1YqQ4rdE=
X-Google-Smtp-Source: APXvYqzN0s9Xv/s+kjAx0hiIg2qcRdzpDGI+0sNaA05kWJCsjItWiY+hlSfOcT6lPeJ7YnHEaM9wbgyVFjZtOyhA8bk=
X-Received: by 2002:a5e:9405:: with SMTP id q5mr4018367ioj.5.1570657393235;
 Wed, 09 Oct 2019 14:43:13 -0700 (PDT)
MIME-Version: 1.0
From: Yuxuan Shui <yshuiv7@gmail.com>
Date: Wed, 9 Oct 2019 22:43:01 +0100
Message-ID: <CAGqt0zxP4Q8P_O98Jse57JYb0SP-7TDP=qfTL=gZoXAwWUiSyA@mail.gmail.com>
Subject: Stack alignment of DC functions
To: amd-gfx@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 09 Oct 2019 21:45:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=U3rIFP0JdEbhaAid2HQ7qeDdmlGcxxKKB6oMU2vQVmo=;
 b=JVuBLl6cNoY0B2LwBWIlIVnS9ia8b73y8tby8jfodeOHacbU+d1jJmlVTWYtmcCAGZ
 p2fJfbkQEzDiC5ekL+XNJW7O9IA81llwxaupR2gTTWxkemb2tJuGEAgteLTW+ZWoJ6tj
 lVB+HIB4CXATOyVZLtp4MxqXoXAywrQAcpEVZ/KYTsCXmdFWXBRKnv/pcHCTuePswVFq
 PZvAcA4IdtmDYmIgkkW5vcHj2mpwmht3/lAb/5uRwbCVYXq8ZPdU3bnOoSeP+AN3VaXB
 kJolcKEQjpitkKc0z8795aRUogYmL6Ep4kPY+3vOGMsVRCMa6lEO2ghEC6F//tW/ZEDh
 yKRw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksCgpXaGVuIHRyeWluZyB0byBidWlsZCBhIExpbnV4IGtlcm5lbCB3aXRoIGNsYW5nLCBJIGVu
Y291bnRlcmVkIGEgR1BGCnByb2JsZW0gaW4gdGhlIGFtZGdwdSBtb2R1bGUuIERldGFpbHMgb2Yg
dGhlIGlzc3VlIGNhbiBiZSBmb3VuZCBoZXJlOgpodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWls
dExpbnV4L2xpbnV4L2lzc3Vlcy83MzUKCkluIHNob3J0LCB0aGUgc3RhY2sgaXMgYWxpZ25lZCB0
byA4IGJ5dGVzIHdoaWxlIGNsYW5nIGFzc3VtZWQgdGhlCnN0YWNrIGlzIGFsaWduZWQgdG8gMTYg
Ynl0ZXMgKGJlY2F1c2UgLW1zdGFjay1hbGlnbm1lbnQ9MTYgaXMgcGFzc2VkKSwKYW5kIGdlbmVy
YXRlZCBhbiB1bmFsaWduZWQgTU9WQVBELgoKTXkgcXVlc3Rpb24gaXMsIGhvdyBpcyB0aGlzIHN1
cHBvc2VkIHRvIHdvcms/IFRvIG15IHVuZGVyc3RhbmRpbmcsIGdjYwpvcHRpb24gLW1wcmVmZXJy
ZWQtc3RhY2stYm91bmRhcnkgZG9lcyBub3QgYWxpZ24gdGhlIHN0YWNrLCBpdCBzaW1wbHkKbWFr
ZSBnY2MgYXNzdW1lIHRoZSBzdGFjayBhbGlnbm1lbnQuIFBhc3NpbmcKLW1wcmVmZXJyZWQtc3Rh
Y2stYm91bmRhcnk9NCB0byBEQyBjb2RlIHNlZW1zIHRvIGJlIHdyb25nIHNpbmNlIHRoZQphY3R1
YWwgc3RhY2sgYWxpZ25tZW50IGlzIG9ubHkgOCBieXRlcy4gWWV0IHRoaXMgR1BGIGhhcyBub3Qg
YmVlbgpvYnNlcnZlZCB3aGVuIGNvbXBpbGluZyB0aGUga2VybmVsIHdpdGggZ2NjLgoKSSBkb24n
dCByZWFsbHkgdW5kZXJzdGFuZC4KCi0tIAoKUmVnYXJkcwpZdXh1YW4gU2h1aQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
