Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF542720
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACC889394;
	Wed, 12 Jun 2019 13:12:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D67089487
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:03:23 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id v9so7027536pgr.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 04:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+WRAXF2ARmkxSGAjp/c6etYCd0hTSbOs0DZi8MzR6Q=;
 b=Pr2nD9FWfgOEJpfmm+38LAJkvVKust/StWFITGZESTmFGxE0GzUYbZYN5Sgwyy3fr0
 CbL/4GVnu14P2LOyDXipEkpdhXceMAGmJdZUo4En5nutHON9KxBHHyKdonKKSLqocdl2
 0QMakwOW3stcMt8qf+BuC5LRuwzqcHH5D0ItlbcBYpS3lN4xppIKeAbwTiyqc5Khui/o
 4vCjybVEooJ2XQj47J4JIqns88xvdkcA+eEn7B+/gvGCSmdGhuUZ/pcYZCVpBv8rYsmF
 hAqmkHp0Z5iDtilz0yEq+0UQc+oHyj6d60u35u8B4zUggYqvb2NlNynd0mExzpsCCX6n
 V84g==
X-Gm-Message-State: APjAAAVgpVWzQ9oG8rik59MI03zGtS5dXD4GjK+ypIID7CD4Es6DmFPJ
 Rpt6lafqWshNLLNUnbiJYP46IkKvBm7jKtgHDSaXXg==
X-Google-Smtp-Source: APXvYqzWmxUbLyuGmwxZVdNOTNeaNzhhuMrhwfH+eyIre2cUwA02gvKzU0bgN3Cy01oTn1PiBJVwgb5PwMcG3EUFGXg=
X-Received: by 2002:a65:64d9:: with SMTP id t25mr24706277pgv.130.1560337402181; 
 Wed, 12 Jun 2019 04:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <4327b260fb17c4776a1e3c844f388e4948cfb747.1559580831.git.andreyknvl@google.com>
 <20190610175326.GC25803@arrakis.emea.arm.com>
 <20190611145720.GA63588@arrakis.emea.arm.com>
 <CAAeHK+z5nSOOaGfehETzznNcMq5E5U+Eb1rZE16UVsT8FWT0Vg@mail.gmail.com>
 <20190611173903.4icrfmoyfvms35cy@mbp>
In-Reply-To: <20190611173903.4icrfmoyfvms35cy@mbp>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 12 Jun 2019 13:03:10 +0200
Message-ID: <CAAeHK+ysoiCSiCNrrvXqffK53WwBMHbc3bk69uU0vY0+R4_JvQ@mail.gmail.com>
Subject: Re: [PATCH v16 02/16] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Wed, 12 Jun 2019 13:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=U+WRAXF2ARmkxSGAjp/c6etYCd0hTSbOs0DZi8MzR6Q=;
 b=Au7VJqK1ojAhcfG23jRBnNIRm8KjejR34yLBYxx+tHyOH3UOEnqAeA+8NqPGB0xERC
 iEkWFkgDGC2bVn5/OIaA4Iaj0a8vwuQDB61IL+0H9Fwkx9OFXo7fvyXQ9pDMhbYVG+Nt
 NAfcfgs6HTAivxcJGzmU1GQcMJKjdgGsV4PVoEwVpmDo71FYYp7iRopdo3JqiipS6Pbm
 g0FK+P1R3xn5BU9DYN7tw7p2D7DXBRHK9wtsmdaKDKErjouHvoT1Xsa2liBK45bWDlUw
 nn9WdHLDyGhILUMAD8+oKvlF/Link+W8NA8UTm3/U+VTclr5XHE7a99we7HZ74tOwnVu
 i1TQ==
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
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzozOSBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDA3OjA5
OjQ2UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAxMSwg
MjAxOSBhdCA0OjU3IFBNIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+
IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBNb24sIEp1biAxMCwgMjAxOSBhdCAwNjo1MzoyN1BNICsw
MTAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBKdW4gMDMsIDIwMTkg
YXQgMDY6NTU6MDRQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvYXJtNjQv
aW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gPiA+ID4gPiBpbmRleCBlNWQ1ZjMxYzZkMzYuLjkxNjRl
Y2I1ZmVjYSAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFj
Y2Vzcy5oCj4gPiA+ID4gPiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+
ID4gPiA+ID4gQEAgLTk0LDcgKzk0LDcgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIF9f
cmFuZ2Vfb2soY29uc3Qgdm9pZCBfX3VzZXIgKmFkZHIsIHVuc2lnbmVkIGxvbmcgc2kKPiA+ID4g
PiA+ICAgICByZXR1cm4gcmV0Owo+ID4gPiA+ID4gIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtI2Rl
ZmluZSBhY2Nlc3Nfb2soYWRkciwgc2l6ZSkgICAgICBfX3JhbmdlX29rKGFkZHIsIHNpemUpCj4g
PiA+ID4gPiArI2RlZmluZSBhY2Nlc3Nfb2soYWRkciwgc2l6ZSkgICAgICBfX3JhbmdlX29rKHVu
dGFnZ2VkX2FkZHIoYWRkciksIHNpemUpCj4gPiA+ID4KPiA+ID4gPiBJJ20gZ29pbmcgdG8gcHJv
cG9zZSBhbiBvcHQtaW4gbWV0aG9kIGhlcmUgKFJGQyBmb3Igbm93KS4gV2UgY2FuJ3QgaGF2ZQo+
ID4gPiA+IGEgY2hlY2sgaW4gdW50YWdnZWRfYWRkcigpIHNpbmNlIHRoaXMgaXMgYWxyZWFkeSB1
c2VkIHRocm91Z2hvdXQgdGhlCj4gPiA+ID4ga2VybmVsIGZvciBib3RoIHVzZXIgYW5kIGtlcm5l
bCBhZGRyZXNzZXMgKGtod2FzYW4pIGJ1dCB3ZSBjYW4gYWRkIG9uZQo+ID4gPiA+IGluIF9fcmFu
Z2Vfb2soKS4gVGhlIHNhbWUgcHJjdGwoKSBvcHRpb24gd2lsbCBiZSB1c2VkIGZvciBjb250cm9s
bGluZwo+ID4gPiA+IHRoZSBwcmVjaXNlL2ltcHJlY2lzZSBtb2RlIG9mIE1URSBsYXRlciBvbi4g
V2UgY2FuIHVzZSBhIFRJRl8gZmxhZyBoZXJlCj4gPiA+ID4gYXNzdW1pbmcgdGhhdCB0aGlzIHdp
bGwgYmUgY2FsbGVkIGVhcmx5IG9uIGFuZCBhbnkgY2xvbmVkIHRocmVhZCB3aWxsCj4gPiA+ID4g
aW5oZXJpdCB0aGlzLgo+ID4gPgo+ID4gPiBVcGRhdGVkIHBhdGNoLCBpbmxpbmluZyBpdCBiZWxv
dy4gT25jZSB3ZSBhZ3JlZWQgb24gdGhlIGFwcHJvYWNoLCBJCj4gPiA+IHRoaW5rIEFuZHJleSBj
YW4gaW5zZXJ0IGluIGluIHRoaXMgc2VyaWVzLCBwcm9iYWJseSBhZnRlciBwYXRjaCAyLiBUaGUK
PiA+ID4gZGlmZmVyZW5jZXMgZnJvbSB0aGUgb25lIEkgcG9zdGVkIHllc3RlcmRheToKPiA+ID4K
PiA+ID4gLSByZW5hbWVkIFBSXyogbWFjcm9zIHRvZ2V0aGVyIHdpdGggZ2V0L3NldCB2YXJpYW50
cyBhbmQgdGhlIHBvc3NpYmlsaXR5Cj4gPiA+ICAgdG8gZGlzYWJsZSB0aGUgcmVsYXhlZCBBQkkK
PiA+ID4KPiA+ID4gLSBzeXNjdGwgb3B0aW9uIC0gL3Byb2Mvc3lzL2FiaS90YWdnZWRfYWRkciB0
byBkaXNhYmxlIHRoZSBBQkkgZ2xvYmFsbHkKPiA+ID4gICAoanVzdCB0aGUgcHJjdGwoKSBvcHQt
aW4sIHRhc2tzIGFscmVhZHkgdXNpbmcgaXQgd29uJ3QgYmUgYWZmZWN0ZWQpCj4gPiA+Cj4gPiA+
IEFuZCwgb2YgY291cnNlLCBpdCBuZWVkcyBtb3JlIHRlc3RpbmcuCj4gPgo+ID4gU3VyZSwgSSds
bCBhZGQgaXQgdG8gdGhlIHNlcmllcy4KPiA+Cj4gPiBTaG91bGQgSSBkcm9wIGFjY2Vzc19vaygp
IGNoYW5nZSBmcm9tIG15IHBhdGNoLCBzaW5jZSB5b3VycyBqdXN0IHJldmVydHMgaXQ/Cj4KPiBO
b3QgbmVjZXNzYXJ5LCB5b3VyIHBhdGNoIGp1c3QgcmVsYXhlcyB0aGUgQUJJIGZvciBhbGwgYXBw
cywgbWluZQo+IHRpZ2h0ZW5zIGl0LiBZb3UgY291bGQgaW5zdGVhZCBtb3ZlIHRoZSB1bnRhZ2dp
bmcgdG8gX19yYW5nZV9vaygpIGFuZAo+IHJlYmFzZSBteSBwYXRjaCBhY2NvcmRpbmdseS4KCk9L
LCB3aWxsIGRvLiBJJ2xsIGFsc28gYWRkIGEgY29tbWVudCBuZXh0IHRvIFRJRl9UQUdHRURfQURE
UiBhcyBWaW5jZW56byBhc2tlZC4KCj4KPiAtLQo+IENhdGFsaW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
