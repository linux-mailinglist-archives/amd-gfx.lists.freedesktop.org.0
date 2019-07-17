Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1C66BF1F
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 17:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79386E228;
	Wed, 17 Jul 2019 15:29:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16206E122
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 11:58:30 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id n11so22983695qtl.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 04:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CtIW38CyixiEAESJE2x/hR6vvP9ZY7lyz3jE6erJEA4=;
 b=E7ymmtrp3y8dKrAi6F1S0OTfu/Ef5fbCEhgpqQaZRvumzLPMQUrzGlaY4X+45XqBnx
 Y3MjBj6TRVW/2Eip8Th0GJnWIaiam8I14d/1x67yLAd0CEWqXdYD205uQYWDsSBM5eLw
 itLsy/J0mEOG/D9dplwAMjhxzMYEshp2mWTI8PzCEsQk5Vl864ThsJvmjF0Jc50Ga3uO
 3fjD2m/UjQc3EeeTfdiKypLteI/iSalYa04cvcVP8zNlFtbUi6ubFkSZKlsq9sgusr+e
 xnZXkRX4crRwriSnlrNd5Gz+or39NtgaOVs+ukXqTpuTNC7PZ6SM40Rj+/mcWdcqxA5u
 2/NQ==
X-Gm-Message-State: APjAAAVadOAWvwJhsaGj8p8PdiFkQh/y/Sr9Fb5Pim/eQpPILtuL2Z61
 pyeEzxkBUdgUC3KV03XlC9G8cw==
X-Google-Smtp-Source: APXvYqx+j7x9Tmvjx0AtdL0JLRa2IEARVY42fsMnhsZXPsgl7xwQHvLdp4tWEgHcwSJhOki+ORlGpQ==
X-Received: by 2002:ac8:394b:: with SMTP id t11mr26922427qtb.286.1563364709720; 
 Wed, 17 Jul 2019 04:58:29 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id n18sm10459998qtr.28.2019.07.17.04.58.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Jul 2019 04:58:29 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hniZo-0003Vz-Og; Wed, 17 Jul 2019 08:58:28 -0300
Date: Wed, 17 Jul 2019 08:58:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v18 11/15] IB/mlx4: untag user pointers in mlx4_get_umem_mr
Message-ID: <20190717115828.GE12119@ziepe.ca>
References: <cover.1561386715.git.andreyknvl@google.com>
 <ea0ff94ef2b8af12ea6c222c5ebd970e0849b6dd.1561386715.git.andreyknvl@google.com>
 <20190624174015.GL29120@arrakis.emea.arm.com>
 <CAAeHK+y8vE=G_odK6KH=H064nSQcVgkQkNwb2zQD9swXxKSyUQ@mail.gmail.com>
 <20190715180510.GC4970@ziepe.ca>
 <CAAeHK+xPQqJP7p_JFxc4jrx9k7N0TpBWEuB8Px7XHvrfDU1_gw@mail.gmail.com>
 <20190716120624.GA29727@ziepe.ca>
 <CAAeHK+xPPQ9QjAksbfWG-Zmnawt-cdw9eO_6GVxjEYcaDGvaRA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+xPPQ9QjAksbfWG-Zmnawt-cdw9eO_6GVxjEYcaDGvaRA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 17 Jul 2019 15:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CtIW38CyixiEAESJE2x/hR6vvP9ZY7lyz3jE6erJEA4=;
 b=WsXmWAFNLS9Y5gyPmjyVBufuKshUnoz9oYQO3m2Kyy2wMtQLDRqxhz084Ma4sggKxA
 VrwuLzOtiAy8rszSQKzE18fvnWZV7M1q7YnEAmJigLzdicTLpZGoNiZ3Gar/CFdANUGQ
 +gt0fDflhj1oNluiZIVGuibWAh1JTcQepAsHP/YRP7PCiQsEbkufbX49wfrYCtAj9p/q
 ZpOMd9vVDGljJ+MPyoKgDKJFbWpQx34cZ14/YkYB9E0gHWhEQolXuspRkMtBiWOO9Km7
 Ew1EzqQInlJf4dxI+ivorIznpDm2P9V/p9lWf5oiX205bEqIkGxkVFU6X6xClAOP44Zp
 QzPQ==
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

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDE6NDQ6MDdQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBUdWUsIEp1bCAxNiwgMjAxOSBhdCAyOjA2IFBNIEphc29uIEd1bnRob3Jw
ZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIEp1bCAxNiwgMjAxOSBhdCAx
Mjo0MjowN1BNICswMjAwLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiBPbiBNb24sIEp1
bCAxNSwgMjAxOSBhdCA4OjA1IFBNIEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPiB3cm90
ZToKPiA+ID4gPgo+ID4gPiA+IE9uIE1vbiwgSnVsIDE1LCAyMDE5IGF0IDA2OjAxOjI5UE0gKzAy
MDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiA+ID4gPiBPbiBNb24sIEp1biAyNCwgMjAx
OSBhdCA3OjQwIFBNIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IHdy
b3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBNb24sIEp1biAyNCwgMjAxOSBhdCAwNDoz
Mjo1NlBNICswMjAwLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiA+ID4gPiA+IFRoaXMg
cGF0Y2ggaXMgYSBwYXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5kcyBrZXJuZWwgQUJJIHRvIGFs
bG93IHRvIHBhc3MKPiA+ID4gPiA+ID4gPiB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUg
dG9wIGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyIHRoYW4KPiA+ID4gPiA+ID4gPiAw
eDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50cy4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IG1s
eDRfZ2V0X3VtZW1fbXIoKSB1c2VzIHByb3ZpZGVkIHVzZXIgcG9pbnRlcnMgZm9yIHZtYSBsb29r
dXBzLCB3aGljaCBjYW4KPiA+ID4gPiA+ID4gPiBvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBw
b2ludGVycy4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFVudGFnIHVzZXIgcG9pbnRlcnMg
aW4gdGhpcyBmdW5jdGlvbi4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KPiA+ID4gPiA+ID4g
PiAgZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYyB8IDcgKysrKy0tLQo+ID4gPiA+ID4g
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBBY2tlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1h
cmluYXNAYXJtLmNvbT4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhpcyBwYXRjaCBhbHNvIG5l
ZWRzIGFuIGFjayBmcm9tIHRoZSBpbmZpbmliYW5kIG1haW50YWluZXJzIChKYXNvbikuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gSGkgSmFzb24sCj4gPiA+ID4gPgo+ID4gPiA+ID4gQ291bGQgeW91IHRh
a2UgYSBsb29rIGFuZCBnaXZlIHlvdXIgYWNrZWQtYnk/Cj4gPiA+ID4KPiA+ID4gPiBPaCwgSSB0
aGluayBJIGRpZCB0aGlzIGEgbG9uZyB0aW1lIGFnby4gU3RpbGwgbG9va3MgT0suCj4gPiA+Cj4g
PiA+IEhtLCBtYXliZSB0aGF0IHdhcyB3ZSB3aG8gbG9zdCBpdC4gVGhhbmtzIQo+ID4gPgo+ID4g
PiA+IFlvdSB3aWxsIHNlbmQgaXQ/Cj4gPiA+Cj4gPiA+IEkgd2lsbCByZXNlbmQgdGhlIHBhdGNo
c2V0IG9uY2UgdGhlIG1lcmdlIHdpbmRvdyBpcyBjbG9zZWQsIGlmIHRoYXQncwo+ID4gPiB3aGF0
IHlvdSBtZWFuLgo+ID4KPiA+IE5vLi4gSSBtZWFuIHdobyBzZW5kIGl0IHRvIExpbnVzJ3MgdHJl
ZT8gaWUgZG8geW91IHdhbnQgbWUgdG8gdGFrZQo+ID4gdGhpcyBwYXRjaCBpbnRvIHJkbWE/Cj4g
Cj4gSSB0aGluayB0aGUgcGxhbiB3YXMgdG8gbWVyZ2UgdGhlIHdob2xlIHNlcmllcyB0aHJvdWdo
IHRoZSBtbSB0cmVlLgo+IEJ1dCBJIGRvbid0IG1pbmQgaWYgeW91IHdhbnQgdG8gdGFrZSB0aGlz
IHBhdGNoIGludG8geW91ciB0cmVlLiBJdCdzCj4ganVzdCB0aGF0IHRoaXMgcGF0Y2ggZG9lc24n
dCBtYWtlIG11Y2ggc2Vuc2Ugd2l0aG91dCB0aGUgcmVzdCBvZiB0aGUKPiBzZXJpZXMuCgpHZW5l
cmFsbHkgSSBwcmVmZXIgaWYgc3Vic3lzdGVtIGNoYW5nZXMgc3RheSBpbiBzdWJzeXN0ZW0gdHJl
ZXMuIElmCnRoZSBwYXRjaCBpcyBnb29kIHN0YW5kYWxvbmUsIGFuZCB0aGUgdW50YWcgQVBJIGhh
cyBhbHJlYWR5IGJlZW4KbWVyZ2VkLCB0aGlzIGlzIGEgYmV0dGVyIHN0cmF0ZWd5LgoKSmFzb24K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
