Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1687B8062
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 19:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5988F6F48E;
	Thu, 19 Sep 2019 17:48:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F98F6F48E;
 Thu, 19 Sep 2019 17:48:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y135so7709193wmc.1;
 Thu, 19 Sep 2019 10:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mCJxWV+T/vjZAkW9RLOGqcR/p13/ZsoE2pnzqrwefyM=;
 b=f5BsZ6yR9aG3L/u1VK5Q56IdTOT/lJTpF8Ble2aqyztREiBlRowGWVjaMtD6cXTxtf
 ZE3ts2xsl8s5PopaLqYgP9Lj23iQGO1QLqWVKo7C7T2/7xhKNUQhGWWAEcnLMuNqx03v
 0qN4YYtoBEmdz8Lq293o/2h9DqLxuguwY430aT+/Ev+oZ1+2WjisV+6rizopD6vs2Q5F
 hQBmezoAVaBpv4kixW35dKYSdYK5KvTw33UJBkiuAl1Lwguebv/ponoo7ggMotPkvGQm
 pFDoqNAeCtKDrWnkR84IJA3meJiS5w7iWfSTHrsGCk7d38zuTq2hjyYy0Pi4ZP2cdyv2
 pPyg==
X-Gm-Message-State: APjAAAVbi5PdFuSoYdnuiGur3Ts2blC5kT/iXoizj/5MPZeJ9yh+H4S7
 qElw3aXtQcWswH64LTxcE6jHp8TSneE34DJ6QFU=
X-Google-Smtp-Source: APXvYqwm3MwPUu29S+PyJhKgcfKK9CwyzKAmTvvnC6MkPxf32vS8pD2QcP8WucowrzjF1uKErJ9EG25uKekDpyqYLQQ=
X-Received: by 2002:a05:600c:54a:: with SMTP id
 k10mr1223343wmc.127.1568915298712; 
 Thu, 19 Sep 2019 10:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <1568902149-70787-1-git-send-email-yukuai3@huawei.com>
In-Reply-To: <1568902149-70787-1-git-send-email-yukuai3@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Sep 2019 13:48:06 -0400
Message-ID: <CADnq5_MFLy3zFXu39BaUb-7Y4rYqqFQt2B=_fVMOozh87Z2X1g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove excess function parameter description
To: yu kuai <yukuai3@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mCJxWV+T/vjZAkW9RLOGqcR/p13/ZsoE2pnzqrwefyM=;
 b=RwKDc87r24DJ6Y7GfJUFEk9L6ElwCNLK9Gl5JusgqDGR1VoMQUsYMKXQbtzSRGCDK8
 XAtyk6pQ9oq0RG+a+vd2qH9nJej/VjE+g1lEAPgPuPlB31Sj7PaWKBfhm/i2WK5CbAaM
 jt/GNaYrvt/1qUS/jkapk6EAueH4J+MZ89P9yH/kKJF53oLE0UnwTzY2jRso/mm7IlDQ
 qrzFDSloroX9I+LIqoL9ixaSXuVEXN1VEm7tDk3D+Qxj0uY8efB+sE+PwScK7JyumSRq
 FGRdNUWRBNK+8isR0jR7pKuVBOitWXheIL2UcwUA9YfswmuuM9OV/ik0p5n0wBleCTcw
 g23g==
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
Cc: Chunming Zhou <David1.Zhou@amd.com>, yi.zhang@huawei.com,
 Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, zhengbin13@huawei.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMTA6MDMgQU0geXUga3VhaSA8eXVrdWFpM0BodWF3ZWku
Y29tPiB3cm90ZToKPgo+IEZpeGVzIGdjYyB3YXJuaW5nOgo+Cj4gZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdmNuX3YyXzUuYzo0MzE6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbgo+IHBhcmFt
ZXRlciAnc3cnIGRlc2NyaXB0aW9uIGluICd2Y25fdjJfNV9kaXNhYmxlX2Nsb2NrX2dhdGluZycK
PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jOjU1MDogd2FybmluZzogRXhj
ZXNzIGZ1bmN0aW9uCj4gcGFyYW1ldGVyICdzdycgZGVzY3JpcHRpb24gaW4gJ3Zjbl92Ml81X2Vu
YWJsZV9jbG9ja19nYXRpbmcnCj4KPiBGaXhlczogY2JlYWQyYmRmY2YxICgiZHJtL2FtZGdwdTog
YWRkIFZDTjIuNSBWQ1BVIHN0YXJ0IGFuZCBzdG9wIikKPiBTaWduZWQtb2ZmLWJ5OiB5dSBrdWFp
IDx5dWt1YWkzQGh1YXdlaS5jb20+CgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyB8IDIgLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdmNuX3YyXzUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81
LmMKPiBpbmRleCAzOTVjMjI1Li45ZDc3OGEwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS92Y25fdjJfNS5jCj4gQEAgLTQyMyw3ICs0MjMsNiBAQCBzdGF0aWMgdm9pZCB2Y25fdjJfNV9t
Y19yZXN1bWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAqIHZjbl92Ml81X2Rpc2Fi
bGVfY2xvY2tfZ2F0aW5nIC0gZGlzYWJsZSBWQ04gY2xvY2sgZ2F0aW5nCj4gICAqCj4gICAqIEBh
ZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiAtICogQHN3OiBlbmFibGUgU1cgY2xvY2sgZ2F0
aW5nCj4gICAqCj4gICAqIERpc2FibGUgY2xvY2sgZ2F0aW5nIGZvciBWQ04gYmxvY2sKPiAgICov
Cj4gQEAgLTU0Miw3ICs1NDEsNiBAQCBzdGF0aWMgdm9pZCB2Y25fdjJfNV9kaXNhYmxlX2Nsb2Nr
X2dhdGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICogdmNuX3YyXzVfZW5hYmxl
X2Nsb2NrX2dhdGluZyAtIGVuYWJsZSBWQ04gY2xvY2sgZ2F0aW5nCj4gICAqCj4gICAqIEBhZGV2
OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiAtICogQHN3OiBlbmFibGUgU1cgY2xvY2sgZ2F0aW5n
Cj4gICAqCj4gICAqIEVuYWJsZSBjbG9jayBnYXRpbmcgZm9yIFZDTiBibG9jawo+ICAgKi8KPiAt
LQo+IDIuNy40Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
