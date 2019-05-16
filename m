Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5595C21024
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 23:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67FF8953E;
	Thu, 16 May 2019 21:40:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48888953E
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 21:40:37 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id i26so5726368qtr.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 14:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=N/Hzy1+8aC91v5v7lA3J6yzYe03WCMtTtbKTJU7g0po=;
 b=OO/dTaXxb7zA78mT8iXFkW4+1A3bUMxbmiLMqA26U1ARJ7sEVwToP7D6XDIorqjA1S
 ldaxyyZZoEP4WPrXovnfOuLF61xWRPF1TbsUi3EJloUOQcLbCjdJGWCSvDnEMYgVEfw+
 FLpwkPBLAq3a2AYTE0Zfb2fl+Ae03zkiWngzj9tOEMxKoAJZfqTr9YKxTtgv6yC41xnR
 +EijFmMLEwKAO8oe5ouFnNr6bGYN+hM8nzk2v+HDbvxw3yng9D5l9MuJiFYnKrCnq1xB
 rTdJ88DQR39myGh7eKENyIpWlFByMBIxqMAmha7EQGRmG201IR0zbL1fP6t7/eCCU7t2
 LzSw==
X-Gm-Message-State: APjAAAVFsVowxR1eo/h9sf3Xp8VD3ag4qgD32eUaeAbhTHuMLWzEkvXU
 cE+1cjiyEToeIbdmv7Bn6cq67w==
X-Google-Smtp-Source: APXvYqzV5N5S4nfD7LLemeVceVG/RV4hkmmR1qu3HxhVtNunqjpprovLzAO98AVlmsLmUUvbIX95Fg==
X-Received: by 2002:ac8:1985:: with SMTP id u5mr42482298qtj.389.1558042837048; 
 Thu, 16 May 2019 14:40:37 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id j29sm3173143qki.39.2019.05.16.14.40.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 16 May 2019 14:40:36 -0700 (PDT)
Message-ID: <f3c43c091ec47fca94b4a6e2ae85daecf9472ae8.camel@redhat.com>
Subject: Re: [PATCH 7/7] drm/nouveau: Use connector kdev as aux device parent
From: Lyude Paul <lyude@redhat.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 16 May 2019 17:40:35 -0400
In-Reply-To: <1558019883-12397-8-git-send-email-sunpeng.li@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
 <1558019883-12397-8-git-send-email-sunpeng.li@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUaHUsIDIwMTkt
MDUtMTYgYXQgMTE6MTggLTA0MDAsIHN1bnBlbmcubGlAYW1kLmNvbSB3cm90ZToKPiBGcm9tOiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiAKPiBTZXQgdGhlIGNvbm5lY3RvcidzIGtlcm5l
bCBkZXZpY2UgYXMgdGhlIHBhcmVudCBmb3IgdGhlIGF1eCBrZXJuZWwKPiBkZXZpY2UuIFRoaXMg
YWxsb3dzIHVkZXYgcnVsZXMgdG8gYWNjZXNzIGNvbm5lY3RvciBhdHRyaWJ1dGVzIHdoZW4KPiBj
cmVhdGluZyBzeW1saW5rcyB0byBhdXggZGV2aWNlcy4KPiAKPiBDYzogQmVuIFNrZWdncyA8YnNr
ZWdnc0ByZWRoYXQuY29tPgo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYwo+IGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYwo+IGluZGV4IDNmNDYzYzkuLjczODc4MmEg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3Iu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMKPiBA
QCAtMTM0NSw3ICsxMzQ1LDcgQEAgbm91dmVhdV9jb25uZWN0b3JfY3JlYXRlKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsCj4gIAkJYnJlYWs7Cj4gIAljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNw
bGF5UG9ydDoKPiAgCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX2VEUDoKPiAtCQludl9jb25uZWN0
b3ItPmF1eC5kZXYgPSBkZXYtPmRldjsKPiArCQludl9jb25uZWN0b3ItPmF1eC5kZXYgPSBjb25u
ZWN0b3ItPmtkZXY7Cj4gIAkJbnZfY29ubmVjdG9yLT5hdXgudHJhbnNmZXIgPSBub3V2ZWF1X2Nv
bm5lY3Rvcl9hdXhfeGZlcjsKPiAgCQlzbnByaW50ZihhdXhfbmFtZSwgc2l6ZW9mKGF1eF9uYW1l
KSwgInNvci0lMDR4LSUwNHgiLAo+ICAJCQkgZGNiZS0+aGFzaHQsIGRjYmUtPmhhc2htKTsKLS0g
CkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
