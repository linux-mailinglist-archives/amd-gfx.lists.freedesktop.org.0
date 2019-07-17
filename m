Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F416BF21
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 17:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF466E248;
	Wed, 17 Jul 2019 15:29:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F5C88EBA
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 11:44:19 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id o13so11026299pgp.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 04:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s96tbUHAJa/3W+S33QuecksVNxzPE4B+rwrtGBTPIRg=;
 b=HIgKjaIsPfyYO67WzP/gAhW0uthQ4M0OE6Ghn7mZ7YPAJIH5jm5INRIPBMUsi5+Eod
 hvx9f4lftLDfZjmjLuqNcY+FOQ7Wnp6y/lv4irzVUpYfPBLAN2E5+x0O61UyzueUGqAm
 GtuATxV0vIzaFLwQOZCXkeeOjNPjqsohDWZJrjr36UKdpMmACj9VaMIj9+Mh7qKUC0qw
 RBhAvpldzz3JHnO+bz723T1tWcMHZmQLmncAKR83ZvGheADYqbYrTQo4QrhrMCFSAGBV
 zHu+CMd37FoCTMLDUlBU4gMw67KWEPDu57NN3ZX7e/uv0/bMl+8hRIw2TV+LR9VtH71X
 2AOw==
X-Gm-Message-State: APjAAAWMD32k5ZL2kqcDaVqXzFPCOscAHTJ/4PHpuEnpfFVdVG0vaThY
 N0ze+/XpKK9IQ4fZKQ01ueUn0uYdtccXpCZZncTsbw==
X-Google-Smtp-Source: APXvYqxCr99MNxoD8F3ipCKfGH5Ic+wArEB2kJiBZjN+Ft8BlSUogLYhlY5cWCf0y3NDyGKfQgFMQFiKtGoY4M7YZGQ=
X-Received: by 2002:a63:c442:: with SMTP id m2mr41068862pgg.286.1563363858315; 
 Wed, 17 Jul 2019 04:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
 <ea0ff94ef2b8af12ea6c222c5ebd970e0849b6dd.1561386715.git.andreyknvl@google.com>
 <20190624174015.GL29120@arrakis.emea.arm.com>
 <CAAeHK+y8vE=G_odK6KH=H064nSQcVgkQkNwb2zQD9swXxKSyUQ@mail.gmail.com>
 <20190715180510.GC4970@ziepe.ca>
 <CAAeHK+xPQqJP7p_JFxc4jrx9k7N0TpBWEuB8Px7XHvrfDU1_gw@mail.gmail.com>
 <20190716120624.GA29727@ziepe.ca>
In-Reply-To: <20190716120624.GA29727@ziepe.ca>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 17 Jul 2019 13:44:07 +0200
Message-ID: <CAAeHK+xPPQ9QjAksbfWG-Zmnawt-cdw9eO_6GVxjEYcaDGvaRA@mail.gmail.com>
Subject: Re: [PATCH v18 11/15] IB/mlx4: untag user pointers in mlx4_get_umem_mr
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Approved-At: Wed, 17 Jul 2019 15:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=s96tbUHAJa/3W+S33QuecksVNxzPE4B+rwrtGBTPIRg=;
 b=YNTzEvLokDKfBiND0F2uTRtNbbscQoeYlRAIZ4D4gm+fPunaVpSxT9yFu1P0pJ6lio
 xWTqHSLTx3ZiQsVVIdfvcsAEZX+UwZ3GwnRk6z/9j+jj49uvH9o3OWPLDccY+IbVHGze
 VX/w7SlL3Vzx+t0xrwbctuweCHGIlBKbcd05Q0zBlUJIzL3VkiYxJwnzmtUL5R2SnxIl
 RhMYnRo7T8e4Wl/4YHx7n44SfOzOXvvpPCN5gZKipQVyiczav3qSb50tsdB3ZZ0CfrCh
 dofC27Pihb8FLt/R6YXAogt8ZfxAC6UrwAQzPlEU0+w5SGEaRflsRUqY/qTdnOsoVA2h
 liiA==
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

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMjowNiBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1bCAxNiwgMjAxOSBhdCAxMjo0MjowN1BNICswMjAw
LCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gT24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgODow
NSBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9u
IE1vbiwgSnVsIDE1LCAyMDE5IGF0IDA2OjAxOjI5UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Yg
d3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgNzo0MCBQTSBDYXRhbGluIE1h
cmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBPbiBNb24sIEp1biAyNCwgMjAxOSBhdCAwNDozMjo1NlBNICswMjAwLCBBbmRyZXkgS29ub3Zh
bG92IHdyb3RlOgo+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0
aGF0IGV4dGVuZHMga2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNzCj4gPiA+ID4gPiA+IHRhZ2dl
ZCB1c2VyIHBvaW50ZXJzICh3aXRoIHRoZSB0b3AgYnl0ZSBzZXQgdG8gc29tZXRoaW5nIGVsc2Ug
b3RoZXIgdGhhbgo+ID4gPiA+ID4gPiAweDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50cy4KPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gbWx4NF9nZXRfdW1lbV9tcigpIHVzZXMgcHJvdmlkZWQgdXNlciBw
b2ludGVycyBmb3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNhbgo+ID4gPiA+ID4gPiBvbmx5IGJ5IGRv
bmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVW50YWcg
dXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4g
PiA+ID4gPiA+ICBkcml2ZXJzL2luZmluaWJhbmQvaHcvbWx4NC9tci5jIHwgNyArKysrLS0tCj4g
PiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+ID4gPiA+ID4KPiA+ID4gPiA+IEFja2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgcGF0Y2ggYWxzbyBuZWVk
cyBhbiBhY2sgZnJvbSB0aGUgaW5maW5pYmFuZCBtYWludGFpbmVycyAoSmFzb24pLgo+ID4gPiA+
Cj4gPiA+ID4gSGkgSmFzb24sCj4gPiA+ID4KPiA+ID4gPiBDb3VsZCB5b3UgdGFrZSBhIGxvb2sg
YW5kIGdpdmUgeW91ciBhY2tlZC1ieT8KPiA+ID4KPiA+ID4gT2gsIEkgdGhpbmsgSSBkaWQgdGhp
cyBhIGxvbmcgdGltZSBhZ28uIFN0aWxsIGxvb2tzIE9LLgo+ID4KPiA+IEhtLCBtYXliZSB0aGF0
IHdhcyB3ZSB3aG8gbG9zdCBpdC4gVGhhbmtzIQo+ID4KPiA+ID4gWW91IHdpbGwgc2VuZCBpdD8K
PiA+Cj4gPiBJIHdpbGwgcmVzZW5kIHRoZSBwYXRjaHNldCBvbmNlIHRoZSBtZXJnZSB3aW5kb3cg
aXMgY2xvc2VkLCBpZiB0aGF0J3MKPiA+IHdoYXQgeW91IG1lYW4uCj4KPiBOby4uIEkgbWVhbiB3
aG8gc2VuZCBpdCB0byBMaW51cydzIHRyZWU/IGllIGRvIHlvdSB3YW50IG1lIHRvIHRha2UKPiB0
aGlzIHBhdGNoIGludG8gcmRtYT8KCkkgdGhpbmsgdGhlIHBsYW4gd2FzIHRvIG1lcmdlIHRoZSB3
aG9sZSBzZXJpZXMgdGhyb3VnaCB0aGUgbW0gdHJlZS4KQnV0IEkgZG9uJ3QgbWluZCBpZiB5b3Ug
d2FudCB0byB0YWtlIHRoaXMgcGF0Y2ggaW50byB5b3VyIHRyZWUuIEl0J3MKanVzdCB0aGF0IHRo
aXMgcGF0Y2ggZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2Ugd2l0aG91dCB0aGUgcmVzdCBvZiB0aGUK
c2VyaWVzLgoKPgo+IEphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
