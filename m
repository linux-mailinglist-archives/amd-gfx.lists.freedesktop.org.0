Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1C23B6DE
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD15891B8;
	Mon, 10 Jun 2019 14:08:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC198922F
 for <amd-gfx@lists.freedesktop.org>; Sat,  8 Jun 2019 04:05:04 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id e6so2139691pgd.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 07 Jun 2019 21:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7MRDr4KJ8a0CcLFRNA6a6rBwJKdO40+h9uyHwhos1XY=;
 b=UNR1/PEWQ3H4BkGrl4OsIiwpIuPp04gH2asDA2tn+Z/Xk8Uiri3OA471kK+9r2gsmT
 mSAqF7KEWANKs7nu+0cZOuWXbo4sUQRHHkcCVRnwPc1Po5N7Xs95qzoqxJqlYrwY0ss3
 Z0FKjCdSdS9q3uXlfb43NT7Ulg+kdCU9mX/K9FRcflzbSnK0YVoaG2ZhNDcd1wSXaEL4
 2Zu4O75N6Hzb8nJnSDRg0/RR62h/z6U11GGkCUy5+cjLj5YrcTPU4rQYj4nMiPDfV9N7
 OTgHc45Bx63QUOPPRnDms+CSE6sZW5tio5WwAs85oAtAXxxau9iYFTr1awW0FHQEPb6q
 m+2g==
X-Gm-Message-State: APjAAAXM3DtlwZdO7CirB7HjiXnQOrmw5IjPJsdbKk27WFqjW/bwDxyM
 KR1CmsHRK/NFXGbf2R//SeQyuA==
X-Google-Smtp-Source: APXvYqwInYsY/wUHZ9P1C1XrBfyqppKEaGOwIlzHhH7Qkl6+K82Iixjx8HiJ+/il/stbMYBMbkFxfA==
X-Received: by 2002:a63:4045:: with SMTP id n66mr5882121pga.386.1559966704443; 
 Fri, 07 Jun 2019 21:05:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z14sm3301959pgs.79.2019.06.07.21.05.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 21:05:03 -0700 (PDT)
Date: Fri, 7 Jun 2019 21:05:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 14/16] tee, arm64: untag user pointers in
 tee_shm_register
Message-ID: <201906072104.B6A89D8CB@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <dc3f3092abbc0d48e51b2e2a2ca8f4c4f69fa0f4.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc3f3092abbc0d48e51b2e2a2ca8f4c4f69fa0f4.1559580831.git.andreyknvl@google.com>
X-Mailman-Approved-At: Mon, 10 Jun 2019 14:08:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7MRDr4KJ8a0CcLFRNA6a6rBwJKdO40+h9uyHwhos1XY=;
 b=FihBxmn2dVJ6Rw2WItUxtjZpswcNWCrx4UusJNMmjDUeSXGlPeke41oTHXObrS9v9s
 auz9bPPxx2drUDHwQFTWyjmSfE251zoGthyYFhJV5WSoJ0SYpqwBy7GNBhwklPOXO6Qg
 gWZEmprLR6lDNUGcv9V07ySSkX/PEr3KR97+4=
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MTZQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gdGVlX3NobV9yZWdpc3RlcigpLT5vcHRlZV9z
aG1fdW5yZWdpc3RlcigpLT5jaGVja19tZW1fdHlwZSgpIHVzZXMgcHJvdmlkZWQKPiB1c2VyIHBv
aW50ZXJzIGZvciB2bWEgbG9va3VwcyAodmlhIF9fY2hlY2tfbWVtX3R5cGUoKSksIHdoaWNoIGNh
biBvbmx5IGJ5Cj4gZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgo+IAo+IFVudGFnIHVzZXIg
cG9pbnRlcnMgaW4gdGhpcyBmdW5jdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29u
b3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+CgoidGVlOiBzaG06IHVudGFnIHVzZXIgcG9p
bnRlcnMgaW4gdGVlX3NobV9yZWdpc3RlciIKClJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNj
b29rQGNocm9taXVtLm9yZz4KCi1LZWVzCgo+IC0tLQo+ICBkcml2ZXJzL3RlZS90ZWVfc2htLmMg
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdGVlL3RlZV9zaG0uYyBiL2RyaXZlcnMvdGVlL3RlZV9zaG0uYwo+IGluZGV4IDQ5
ZmQ3MzEyZTJhYS4uOTY5NDVmNGNlZmI4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdGVlL3RlZV9z
aG0uYwo+ICsrKyBiL2RyaXZlcnMvdGVlL3RlZV9zaG0uYwo+IEBAIC0yNjMsNiArMjYzLDcgQEAg
c3RydWN0IHRlZV9zaG0gKnRlZV9zaG1fcmVnaXN0ZXIoc3RydWN0IHRlZV9jb250ZXh0ICpjdHgs
IHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgCXNobS0+dGVlZGV2ID0gdGVlZGV2Owo+ICAJc2htLT5j
dHggPSBjdHg7Cj4gIAlzaG0tPmlkID0gLTE7Cj4gKwlhZGRyID0gdW50YWdnZWRfYWRkcihhZGRy
KTsKPiAgCXN0YXJ0ID0gcm91bmRkb3duKGFkZHIsIFBBR0VfU0laRSk7Cj4gIAlzaG0tPm9mZnNl
dCA9IGFkZHIgLSBzdGFydDsKPiAgCXNobS0+c2l6ZSA9IGxlbmd0aDsKPiAtLSAKPiAyLjIyLjAu
cmMxLjMxMS5nNWQ3NTczYTE1MS1nb29nCj4gCgotLSAKS2VlcyBDb29rCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
