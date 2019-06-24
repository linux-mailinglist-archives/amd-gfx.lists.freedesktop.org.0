Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46688519E5
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 19:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA84989D7B;
	Mon, 24 Jun 2019 17:44:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFE289D7B
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 17:44:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f15so4950446wrp.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 10:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qh6f4D2zwbFVTy3wxebR5lTPVKRU1oCyryxDhfpD8MM=;
 b=lLepvhzoyPTXAgqCDZjfl5aaf4bDrykSPJJm+nYxbcOjor4vRRpYZiHKdcR/xjr4Qd
 QPnNlTJJB9i/76Trqgm0lB8iKW8VuLOqz6eLS9ICDc5rzJhK1T9FlHC9F4EjQBaISDPS
 EV83FbeFM/wzUd8AUXZqbdmGBJm+i3MbHXv80ufCHG04JAekFqkoe+5bQqHgRxSHBWK4
 eQCYPfP7xyVRRMhmzAgDLs1rQKdJAWAFqFKkjbn1oB8WZ4dKu/eXgqDl+WlUoGT5/I1o
 Ma/rH5Qu6+oW8Ajqxw7my4XyUtLdmezsmSWhuRaEMXLrJ22vC3i7Hwq8x8Ez2KtFFXBn
 jNOw==
X-Gm-Message-State: APjAAAUXKJzXCIf24km7lVlEYMc9koI/txYXMeovY2hmtBvTUKSn+IcO
 1V927OXyPqttC+VyZ3aI+mvflgFlf0uregDCDr0=
X-Google-Smtp-Source: APXvYqyOcb9JeYmrO+pWQsb4X2ccAPvL/Iy0VsLJ0uL7D5cgBspaEbfSeWtsrDro5ZP2+7z1lEZubX4/Hbl2lAkxvDY=
X-Received: by 2002:a5d:6742:: with SMTP id l2mr48256070wrw.323.1561398256428; 
 Mon, 24 Jun 2019 10:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190624151544.13934-1-ernstp@gmail.com>
 <20190624151544.13934-6-ernstp@gmail.com>
In-Reply-To: <20190624151544.13934-6-ernstp@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jun 2019 13:44:04 -0400
Message-ID: <CADnq5_O1R_2a2HbeAa9R+2CLTkooGGWWygeTzJ8BVOB+gx9fLA@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/amd/amdgpu: sdma_v4_0_start: initialize r
To: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qh6f4D2zwbFVTy3wxebR5lTPVKRU1oCyryxDhfpD8MM=;
 b=PzwUT2lEuH/BfSPjjSMNc44OJjqADX+Zplji2HPgNxnYUdtep5DttJLpYEjz9mPX3S
 voDtAxpobM/uQ4RJ9EVhtWckqxh6zqzE/ll9Ka3oeg9l6gsQiyslg5dnYCul8ydIgU75
 lYu5EEAoQXFpC1KIDUtZWNtZLfnJVRfiQS5nO+Iv9P7DU0zgqCWIChQRJjmnO+HG6K9r
 yjjzfZtxNKE2BSKtJ3H0qGkJKtViLKiQNmmO57A9ZMLjkJPdAhvs697ESphx12FtMBDH
 00v4TO/zgFaOeTs9uuTm7MxWtsW/3SPIMYBUCajrZQXe5GphUU0n2Z4NWCA4MF1X5H2Q
 vbOg==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXBwbGllZCB0aGUgc2VyaWVzLiAgVGhhbmtzIQoKQWxleAoKT24gTW9uLCBKdW4gMjQsIDIwMTkg
YXQgMTE6MTYgQU0gRXJuc3QgU2rDtnN0cmFuZCA8ZXJuc3RwQGdtYWlsLmNvbT4gd3JvdGU6Cj4K
PiBSZXBvcnRlZCBieSBzbWF0Y2g6Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92
NF8wLmM6MTE2NyBzZG1hX3Y0XzBfc3RhcnQoKSBlcnJvcjogdW5pbml0aWFsaXplZCBzeW1ib2wg
J3InLgo+Cj4gU2lnbmVkLW9mZi1ieTogRXJuc3QgU2rDtnN0cmFuZCA8ZXJuc3RwQGdtYWlsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKPiBpbmRleCBjMGI2MDExYjRiZDEuLjll
NTcxY2EyODNjMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1h
X3Y0XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCj4g
QEAgLTEwOTIsNyArMTA5Miw3IEBAIHN0YXRpYyBpbnQgc2RtYV92NF8wX2xvYWRfbWljcm9jb2Rl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICBzdGF0aWMgaW50IHNkbWFfdjRfMF9zdGFy
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgewo+ICAgICAgICAgc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nOwo+IC0gICAgICAgaW50IGksIHI7Cj4gKyAgICAgICBpbnQgaSwgciA9IDA7
Cj4KPiAgICAgICAgIGlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsKPiAgICAgICAgICAgICAg
ICAgc2RtYV92NF8wX2N0eF9zd2l0Y2hfZW5hYmxlKGFkZXYsIGZhbHNlKTsKPiAtLQo+IDIuMjAu
MQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
