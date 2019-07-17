Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB60F6BF1B
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 17:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4AF6E1DE;
	Wed, 17 Jul 2019 15:29:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AF06E116
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 11:43:02 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id a93so11824917pla.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 04:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Grx9Ph9cpPxnp5U6FBRGOs65Gt1iaoMhcGq5W71SZXw=;
 b=Tr1SjIuVgmWQLJVoLlj65HN3zCDgFobKxNzl1GNNS6p/+olF0Yl0+LPU3hkGWOFVsU
 +KMDVVR4Pz07K/LT7aFCpeTvLMAXU+JIt8siGLZAEyY2r/AofFH9PWHRMl+xsslCNpVo
 06wVX8bLj68cYJ0NN6rppJr62HL/pm9lsrUuEGPC7QyJbvbhRtf9+Bq1t+gXI+kkSsIc
 u6Xlbx+QR59YE2tSZBfo3iKs3UXV1EEaZJcZyLjgXPh3tdyvo5c06/Q4k4grLNQNbHkW
 KXe4bnfiEKc1QYdI5RKO/i7DBd7wWNA7mjCGfvFQ9F/e4udHMZliycOYo1Fmcx6NsDQg
 movA==
X-Gm-Message-State: APjAAAU5SMpkWN6vacNsqsiGbwuow5mrSCPnCEk8+I8fRHkH6F/UGEO7
 bcZdeQ5Ltv5ozRJYw881LncpzHeA/FqEeJt5MbiG/w==
X-Google-Smtp-Source: APXvYqwmLG+YoWbUJiFaN+0PkmRQxPro9175aUMwlEodu495a+iL+q6DhBuBElFNfaLl03HSknMS7Mny75X+YTtbitI=
X-Received: by 2002:a17:902:8689:: with SMTP id
 g9mr39719354plo.252.1563363782037; 
 Wed, 17 Jul 2019 04:43:02 -0700 (PDT)
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
Date: Wed, 17 Jul 2019 13:42:50 +0200
Message-ID: <CAAeHK+xGfCSNgJ1FA1Bi3-6iVZNa5-cPJF54SY9rETqSqnrOTw@mail.gmail.com>
Subject: Re: [PATCH v18 11/15] IB/mlx4: untag user pointers in mlx4_get_umem_mr
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Approved-At: Wed, 17 Jul 2019 15:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Grx9Ph9cpPxnp5U6FBRGOs65Gt1iaoMhcGq5W71SZXw=;
 b=dPqGbc0mQ4L1HVZkSH8ToVI8fJKg/9UNHDO/j/ERbXAicYMzOFznsbpKlaHUysv6li
 HI+ov6aZkI81aTTtxCqQqgB/bUVOpQn9oyTV62JlPhH7/hgOpXEwCdWu9ddqQHOpZpdv
 vvSbjVE/k6KiaC4iA854H6gt6BntwHIeZhW6TlwY6wZ/6+elD6DGPCHZxZrxLz2uCTHc
 8iFhpa9H1Y4EYvcxgufIOEc+0j2fY1DuwRMYeLwfiF/zvSCA0YG2Xctd4B7QhffRyXW7
 79B+/AUSAWe5ZZuaO+yAHuZlFSQxsBpNhxsDDOkk9SiW6k2AqHelqnkNry2oBYROn4ta
 qk0g==
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
aGlzIHBhdGNoIGludG8gcmRtYT8KPgo+IEphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
