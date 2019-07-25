Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785AE755AF
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 19:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E926E7DD;
	Thu, 25 Jul 2019 17:26:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273F66E703
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 11:17:45 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id o13so22870013pgp.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 04:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ceQemw0wuGQ3uiCqTlyBUwO60vemC2ljY3rBL1bAUvc=;
 b=bhjapKCKulAOLnsFHuetYIDbVxCJYHACKx6G1dJrQKcwpcT5VdV1FVipLOftUmD1HY
 0jE3YIPmUroHWDQwyRO2JYBvuW7XsdD3RFmxrQ2f5d2qyPtmPvQ9+PVptludqWF1kY7a
 5QcRO1irxoe+vRQXUFvc5iODcDDfv/vp+u+vNUnhzk8QSKExl8cas5ftL0x1PSGgih6x
 juuMdAfChvOqJFjOsJmrwrSIfCi9F07dn/XCeBrfrZzvtKZRhlXd4torpITV1dHBsvZ0
 DrwMjuQrS6jBBFYnQH1FtKV9yk4Am847VnyNcFt/iMSJuwdheqilkHSccgz2SqbIvFfS
 UTmQ==
X-Gm-Message-State: APjAAAUjfHTPJ6orqcvXhjJ1ozKqgw+hLKgY1b3Hy241JJPcjhSASEP5
 LQWDYjLq8id1C3zG06x5AfwG61u+TeLNYWXNqtEvnw==
X-Google-Smtp-Source: APXvYqzUlCi07nILNklNsNS4HJ/lH+Efr4GjVTNZTHkDEiuYwLiGivIelhkfNGv3x1TCnih2kaTB3NQT1G7052KvmkQ=
X-Received: by 2002:a17:90a:a116:: with SMTP id
 s22mr91662102pjp.47.1564053464334; 
 Thu, 25 Jul 2019 04:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
 <7969018013a67ddbbf784ac7afeea5a57b1e2bcb.1563904656.git.andreyknvl@google.com>
 <20190724192504.GA5716@ziepe.ca>
In-Reply-To: <20190724192504.GA5716@ziepe.ca>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Thu, 25 Jul 2019 13:17:32 +0200
Message-ID: <CAAeHK+x5JFgkLLzhrkQBfa78pkyQXLhgOfXOGuHK=AfwFLHntg@mail.gmail.com>
Subject: Re: [PATCH v19 11/15] IB/mlx4: untag user pointers in mlx4_get_umem_mr
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Approved-At: Thu, 25 Jul 2019 17:26:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ceQemw0wuGQ3uiCqTlyBUwO60vemC2ljY3rBL1bAUvc=;
 b=PFlEvXsHYv4lFKGCCfXZ2BH9B+e/+FJBGpnFm58EL07XzmLkrfPE7grKe+lK7OJ+3q
 abjryupEyT3OpTe6vXeYbGcL1BUr5elNwdNVi9kwG5uLVwrmRNAlILwAOBEDWE3BDhoL
 wa/mA/jPR9b/azqkL/67D+Mm2vUNeUnKTr67F6b6zVcvZzUWDrGmaUvbPo48izoM48MU
 N0VWZj0yxfEFkbETpli1M4tpWnMK/JyQnFJyyMLRYouRu9gpM1Vf3XJFNTnOwCnTu9Ld
 itsx5ZgymWeM6DKM8q2cX7rBLN4FseRE3aGipc8TJcBEDMtdp1GaAUz+JB2Q86Y09iS0
 iOkA==
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
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Dmitry Vyukov <dvyukov@google.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
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

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgOToyNSBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1bCAyMywgMjAxOSBhdCAwNzo1ODo0OFBNICswMjAw
LCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBz
ZXJpZXMgdGhhdCBleHRlbmRzIGtlcm5lbCBBQkkgdG8gYWxsb3cgdG8gcGFzcwo+ID4gdGFnZ2Vk
IHVzZXIgcG9pbnRlcnMgKHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBv
dGhlciB0aGFuCj4gPiAweDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50cy4KPiA+Cj4gPiBtbHg0X2dl
dF91bWVtX21yKCkgdXNlcyBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2bWEgbG9va3Vwcywg
d2hpY2ggY2FuCj4gPiBvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4KPiA+Cj4g
PiBVbnRhZyB1c2VyIHBvaW50ZXJzIGluIHRoaXMgZnVuY3Rpb24uCj4gPgo+ID4gUmV2aWV3ZWQt
Ynk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiA+IEFja2VkLWJ5OiBDYXRh
bGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEtl
ZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV5
IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9p
bmZpbmliYW5kL2h3L21seDQvbXIuYyB8IDcgKysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBBcHBsaWVkIHRvIHJkbWEtZm9yIG5l
eHQsIHBsZWFzZSBkb24ndCBzZW50IGl0IHZpYSBvdGhlciB0cmVlcyA6KQoKU3VyZSwgdGhhbmtz
IQoKPgo+IFRoYW5rcywKPiBKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
