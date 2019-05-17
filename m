Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1041921C27
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 19:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69E589938;
	Fri, 17 May 2019 17:02:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F37789938
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 17:02:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f204so7626539wme.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 10:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HwYI0s0PFFoHofmGV5DuYpb1IxS5ijh6xwbxDMJVHD4=;
 b=OpoMBJBmETTfU950aDHLvk8qhlKOCQo7brpROktIo28hqYlv2s9eNFydegmgSMXDjm
 adgjap9i0dlT93bDEJn+6RQZbeNsg3WYqhWmEfpneYq3gEwhzRxUJZVQd/BUAissldF7
 VfvoOVADx9RDmGPfNQFBHaZV1rnfYqpfvwHN9DJs2Y4t4u2vcXg150abScsCq5p4L3F7
 QUXk5ze0BlDORQKvXM91RxDfUjd6Njg3vJTDXsRofbmScdD5/zwjOYbPVuczOz/11sjV
 XtTRrSODJZm8yTotvyCZDZ0uybrSGt9KFq90jiREo/prxmsvYqzwQ3Yf54wOi8n3LiWd
 hshQ==
X-Gm-Message-State: APjAAAUOpWTc/fv2QVLajYZWSIwTHSFGVzpG0FjoDzd7cTOYvWv/2n08
 VTmp2JUx+BvvpSATDGUEwvUrvRQaiEfIKeH5x1o=
X-Google-Smtp-Source: APXvYqx9F0GDNxS9o6Sk1QAK5jRwC7rrS7fo8l9rzYRX2fOcI0LO5piS9lgNRzVTuHYNp2hs6NInj9UdoQutCS61Kpg=
X-Received: by 2002:a1c:f50a:: with SMTP id t10mr2981867wmh.86.1558112549968; 
 Fri, 17 May 2019 10:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190517142647.26034-1-alexander.deucher@amd.com>
 <a986c8b7-4255-e70b-4e39-102cc57cda92@amd.com>
In-Reply-To: <a986c8b7-4255-e70b-4e39-102cc57cda92@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 May 2019 13:02:18 -0400
Message-ID: <CADnq5_PKFA62OMa4H9gKy4R9rk38mY0EKhZGxf51N36DkTEavQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/soc15: skip reset on init
To: "Lin, Amber" <Amber.Lin@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HwYI0s0PFFoHofmGV5DuYpb1IxS5ijh6xwbxDMJVHD4=;
 b=X3w+q66RjZZNqO0W53SC7kVb4SYlJogjZJRGJ3gFRmFBLf7uE0JBCgR0rwUHOYAsAq
 bwE2rNhxogaVCYlmqq2Pa/JaZQNKR2jax9nFc40TxbeJ3rYQZaenP3bIwGMylEHwfmTM
 bq7ywpJa3ChChAQYuZhIqwMTl0cW/6FymQecnsdwhg5l+9Y1L8mJOCJ4UWnPWN5oJQ+c
 yT+fHI7QsYVKLLFxD8G830XVQpYu556nQphIjWB8FpwJvPPuDb6aFJr+HPQxTeqOewCd
 4Qgi6/mjo3eP9r/X82wWfcvbjvoBu0l8/Jjbtg72iJsZknqOnwJqejMfVL1LB6xrfXYT
 ybSg==
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

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTA6NDcgQU0gTGluLCBBbWJlciA8QW1iZXIuTGluQGFt
ZC5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDIwMTktMDUtMTcgMTA6MjYgYS5tLiwgQWxleCBEZXVj
aGVyIHdyb3RlOgo+ID4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQo+ID4KPiA+IE5vdCBuZWNl
c3Nhcnkgb24gc29jMTUgYW5kIGJyZWFrcyBkcml2ZXIgcmVsb2FkIG9uIHNlcnZlciBjYXJkcy4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Cj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gLS0tCj4gPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCA1ICsrKysrCj4gPiAgIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMK
PiA+IGluZGV4IDMyZGM1YTEyODI0OS4uNzhiZDRmYzA3YmFiIDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvc29jMTUuYwo+ID4gQEAgLTc2MSw2ICs3NjEsMTEgQEAgc3RhdGljIGJvb2wg
c29jMTVfbmVlZF9yZXNldF9vbl9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ID4g
ICB7Cj4gPiAgICAgICAgICB1MzIgc29sX3JlZzsKPiA+Cj4gPiArICAgICAgIC8qIEp1c3QgcmV0
dXJuIGZhbHNlIGZvciBzb2MxNSBHUFVzLiAgUmVzZXQgZG9lcyBub3Qgc2VlbSB0bwo+ID4gKyAg
ICAgICAgKiBiZSBuZWNlc3NhcnkuCj4gPiArICAgICAgICAqLwo+ID4gKyAgICAgICByZXR1cm4g
ZmFsc2U7Cj4gPiArCj4gPiAgICAgICAgICBpZiAoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKQo+
ID4gICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gU2hvdWxkIHJlbW92ZSB0aGUgcmVz
dCBvZiBjb2RlIGluIHRoaXMgZnVuY3Rpb24gYW5kIHNvbF9yZWcgYXMgd2VsbD8KPiBTaW1wbHkg
cmV0dXJuIGZhbHNlPwoKSSB3YXMgdGhpbmtpbmcgd2UnZCBsZWF2ZSBpdCBpbiBwbGFjZSBmb3Ig
bm93IGluIGNhc2Ugd2UgbmVlZCB0bwpyZS1lbmFibGUgaXQgZm9yIHNvbWV0aGluZyBlbHNlIGlu
IHRoZSBmdXR1cmUsIGJ1dCBJIGd1ZXNzIHdlIGNhbiBqdXN0CnJldmVydCB0aGUgY2hhbmdlIGlm
IG5lZWQgYmUuICBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBlaXRoZXIKd2F5LgoKQWxl
eAoKPiA+Cj4gPiAtLQo+ID4gMi4yMC4xCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gPiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
