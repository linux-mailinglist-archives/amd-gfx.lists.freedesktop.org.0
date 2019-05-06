Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AADB15516
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 22:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D91898C8;
	Mon,  6 May 2019 20:53:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38C689B66
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 19:50:23 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d4so2417169qkc.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 12:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ESsJ96JGC0CvnjgihpL/0kogE+VQksbbiyHqcPsgGyM=;
 b=nXyBKNfeM+kKu2Di/LDtEZXPjk89BPFfJgtB86Kjx5g214hSyV5twCOgGbFa2iSERk
 QA3s0jHaJsGM8QJS2mj6jZkynNmeNhNIxaywBMRZIYrA+d4lUJjxQpJUjAHGi25mLWhy
 AaHyce5pJ2MpZC2PI61t0kvLMQxVY5kleMfGqwAnuDpWhMnBlf5wIEoqFQc8/eRR2Azy
 XIpiV74tBW7cqU911yQdxBqpWDcfMpd6JEdwchH+LPLBFYP50t+BuynAl8kTBx8cA0w1
 dntNoaWSdSBWLOzIKczadXxPRHJ1mw2LHvoS45NWXYyZJ6Ss+U+2xyechQxf7FMqy46P
 grtw==
X-Gm-Message-State: APjAAAUuRgl8zXu2k2kJVBTwbdz9cR1HFri3sg7FYJaic70Z3TVzRYdH
 ZLQ+uonS1muo4V3/HHb8dSSfZw==
X-Google-Smtp-Source: APXvYqweK3T+QR6CpnWc0KpWvE878/YztoCohPUsZDawCWkz4P9i6ckWrJvxSZLqhWTPckszjgD1bg==
X-Received: by 2002:a05:620a:16b4:: with SMTP id
 s20mr10803976qkj.34.1557172222493; 
 Mon, 06 May 2019 12:50:22 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-49-251.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.49.251])
 by smtp.gmail.com with ESMTPSA id o44sm9303175qto.36.2019.05.06.12.50.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 12:50:21 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hNjcy-0007kq-Cs; Mon, 06 May 2019 16:50:20 -0300
Date: Mon, 6 May 2019 16:50:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v15 13/17] IB, arm64: untag user pointers in
 ib_uverbs_(re)reg_mr()
Message-ID: <20190506195020.GD6201@ziepe.ca>
References: <cover.1557160186.git.andreyknvl@google.com>
 <66d044ab9445dcf36a96205a109458ac23f38b73.1557160186.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66d044ab9445dcf36a96205a109458ac23f38b73.1557160186.git.andreyknvl@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 06 May 2019 20:53:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ESsJ96JGC0CvnjgihpL/0kogE+VQksbbiyHqcPsgGyM=;
 b=mAg8m7rSPAxM5D+1qNjO71dhsXUrQSGF8zaXxmrvN1W1e7B7fEhL/nFNC4QmlTH5S/
 9FjLthJrMSnJTSlBNmAzOuj+WEEEHBw1j3jchmVO404WkT8GTT4n4WekZCWvQcvu4KOF
 mx0V5cfxdymPVb2Ruxoza7w5KItB51NAJ5xivBL7H4fj5rRig8CXPXI75f55CKvkZyYC
 Gs093sJb6bHKcKo1jSkGyp2Pk8c68+e+QijlfKiUVNZuBsCjguF+Uc/8jtTaC+sffP6g
 22gO2vicgInFZL3gRZwFvB6M65AQIPZr/G+9s6iQjRuVRTS6fQK5LrCRIMT4SjvjNieX
 MViA==
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
 linux-kselftest@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDY6MzA6NTlQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gaWJfdXZlcmJzXyhyZSlyZWdfbXIoKSB1c2Ug
cHJvdmlkZWQgdXNlciBwb2ludGVycyBmb3Igdm1hIGxvb2t1cHMgKHRocm91Z2gKPiBlLmcuIG1s
eDRfZ2V0X3VtZW1fbXIoKSksIHdoaWNoIGNhbiBvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBw
b2ludGVycy4KPiAKPiBVbnRhZyB1c2VyIHBvaW50ZXJzIGluIHRoZXNlIGZ1bmN0aW9ucy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYyB8IDQgKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpJIHRoaW5rIHRoaXMgaXMgT0suLiBX
ZSBzaG91bGQgcmVhbGx5IGdldCBpdCB0ZXN0ZWQgdGhvdWdoLi4gTGVvbj8KCkphc29uCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
