Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0431AF658
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 09:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AB66EA2F;
	Wed, 11 Sep 2019 07:03:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9776E82C
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 09:36:14 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 35D2461B22
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 09:36:14 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id 32so4301745wrk.15
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 02:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n8YH5XkWfkWGWuHfyUDOYVmK/+fDxvvoaV0+60in29s=;
 b=eNU16CZVSuK76dAr6Ih8gcjstP0civhq8x1nBMeFtlmUym2eJZsnkmfnrf4bxE9IBL
 DgMOoXeC1OpJwUqxw1pmpD18I07ZYHGtQCXCVcMEUHCkxWlPGFft5ZRxBU807sHnjmLu
 /kR2WlIJrBhF1LTeUR1YF38WSCH7fV0bAy5E8MVxh3in4IX6cVc/6uttJ01MVybuOdfM
 ZSpvM6/0Bn4vLWmSIFdhwmuHgMHaFgwUGBOBimlr721f0rHbddRBPFJvUl8q6zRyqHxd
 s4+pB4CyYsLA8itutE6026lA7S3M7IXBqLZ5HyurUDvzKMF/gwfLkftzxwPZjxSGSWcp
 ombA==
X-Gm-Message-State: APjAAAWWKP/XqwZbs4jMrPQRVABx+XLJ4bWoPtDNsu4PO12PCCi7+ohB
 S0chTG9I/I884kTruMqPP2bGjwAwiY+MdG8glFGKJ5gpm/H54EnAal+YMi2hzIHxjFLg6HT+OLv
 /SMTduNnlxYGVNaR0VxFk2gwrlA==
X-Received: by 2002:adf:d4c5:: with SMTP id w5mr24608341wrk.280.1568108172594; 
 Tue, 10 Sep 2019 02:36:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypxdPkfsyaOk23EjSKN6j0B/UYFSShdWr24f+bWIas3139XwYA6Bswy33vXcHyy18ZcjrGbw==
X-Received: by 2002:adf:d4c5:: with SMTP id w5mr24608318wrk.280.1568108172447; 
 Tue, 10 Sep 2019 02:36:12 -0700 (PDT)
Received: from localhost.localdomain ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id w19sm1997200wmi.12.2019.09.10.02.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2019 02:36:11 -0700 (PDT)
Subject: Re: [PATCH] drm/radeon: Bail earlier when radeon.cik_/si_support=0 is
 passed
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>
References: <20190907203238.232005-1-hdegoede@redhat.com>
 <22da19aa-0ab4-ab48-ab70-037ec41c2f87@daenzer.net>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3c0eb318-6c30-fc98-4005-80b5c00b8f5e@redhat.com>
Date: Tue, 10 Sep 2019 10:36:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <22da19aa-0ab4-ab48-ab70-037ec41c2f87@daenzer.net>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Sep 2019 07:03:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksCgpPbiA5LzEwLzE5IDk6NTAgQU0sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+IE9uIDIwMTkt
MDktMDcgMTA6MzIgcC5tLiwgSGFucyBkZSBHb2VkZSB3cm90ZToKPj4gQmFpbCBmcm9tIHRoZSBw
Y2lfZHJpdmVyIHByb2JlIGZ1bmN0aW9uIGluc3RlYWQgb2YgZnJvbSB0aGUgZHJtX2RyaXZlcgo+
PiBsb2FkIGZ1bmN0aW9uLgo+Pgo+PiBUaGlzIGF2b2lkIC9kZXYvZHJpL2NhcmQwIHRlbXBvcmFy
aWx5IGdldHRpbmcgcmVnaXN0ZXJlZCBhbmQgdGhlbgo+PiB1bnJlZ2lzdGVyZWQgYWdhaW4sIHNl
bmRpbmcgdW53YW50ZWQgYWRkIC8gcmVtb3ZlIHVkZXYgZXZlbnRzIHRvCj4+IHVzZXJzcGFjZS4K
Pj4KPj4gU3BlY2lmaWNhbGx5IHRoaXMgYXZvaWRzIHRyaWdnZXJpbmcgdGhlICh1c2Vyc3BhY2Up
IGJ1ZyBmaXhlZCBieSB0aGlzCj4+IHBseW1vdXRoIG1lcmdlLXJlcXVlc3Q6Cj4+IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9wbHltb3V0aC9wbHltb3V0aC9tZXJnZV9yZXF1ZXN0cy81
OQo+Pgo+PiBOb3RlIHRoYXQgZGVzcGl0ZSB0aGF0IGJlaW5nIGFuIHVzZXJzcGFjZSBidWcsIG5v
dCBzZW5kaW5nIHVubmVjZXNzYXJ5Cj4+IHVkZXYgZXZlbnRzIGlzIGEgZ29vZCBpZGVhIGluIGdl
bmVyYWwuCj4+Cj4+IEJ1Z0xpbms6IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1
Zy5jZ2k/aWQ9MTQ5MDQ5MAo+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2Vk
ZUByZWRoYXQuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBNaWNoZWwgRMOkbnplciA8bWRhZW56ZXJA
cmVkaGF0LmNvbT4KClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4gSSd2ZSBkcm0gcHVzaCByaWdo
dHMsIGJ1dCBJIGd1ZXNzIHRoYXQgcmFkZW9uL2FtZApHUFUgcGF0Y2hlcyBhcmUgY29sbGVjdGVk
IGJ5IHNvbWVvbmUgQEFNRCwgc28gSSBkbyBub3QgbmVlZCB0byAvIHNob3VsZCBub3QKcHVzaCB0
aGlzIG15c2VsZiwgcmlnaHQ/Cgo+IGFtZGdwdSBzaG91bGQgYmUgY2hhbmdlZCBjb3JyZXNwb25k
aW5nbHkgYXMgd2VsbC4KCkdvb2QgcG9pbnQuIEknbSBjdXJyZW50bHkgdHJhdmVsbGluZyAoQHBs
dW1iZXJzKSBJIGNhbiBkbyB0aGlzIHdoZW4gSSdtIGJhY2sgaG9tZSwKYnV0IGZlZWwgZnJlZSB0
byBiZWF0IG1lIHRvIGl0IChpZiB5b3UgZG8gcGxlYXNlIENjIG1lIHRvIGF2b2lkIGRvdWJsZSB3
b3JrKS4KClJlZ2FyZHMsCgpIYW5zCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
