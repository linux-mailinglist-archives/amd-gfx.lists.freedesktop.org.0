Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A26AA68
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 16:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5346E12E;
	Tue, 16 Jul 2019 14:13:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA6F89C97
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 12:06:26 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id n11so19227230qtl.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 05:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QhpcQElL3lG0JSgeqXLUe/9qK61Ylnz+wgQS3Fp7AjE=;
 b=Rkpu33Ghet2Sk5jDm56O6PzSJ/C324brImLyeam9YcFJuRJgHkQrZp+BwJBTTEn8FF
 SBDDtaziS/mAmYug4pxQN6RqBQLMnzDFUHiBeW82/k/yyzntfms/c+DAPo5qF7A47N69
 eLXq0mrUExLhSbf2PZbYrVu49BvCT6WmcMLJBpQT48ofMpGyAm29JP2HVenIvWjtq4qR
 PAZ2mCXGVpTfJREGHewf5FKBxWqGpWthsHn3/eu+Xzf9OQq/xcddcQOuS/cPFZw29qm6
 fNO2jei/+3TT05gA7PuFIzQj4zqfHzhCbzoUi2Mln3CiAvIqgWKqU4f7Rj9+aMkA04AE
 J1UA==
X-Gm-Message-State: APjAAAU1iwxyF07gj+RknMix9DWxJizh41Q44WLwmz2ywHY1L9d2vY5e
 92z+bq5EOKfrYRfqP/93ISO8aA==
X-Google-Smtp-Source: APXvYqwaXFZZiwZu977J+QGokWcpz5v06kUp2glLI/ZNMEHnjOvZ6hmUglcng9VwXT1727jmbSrxcg==
X-Received: by 2002:a0c:e703:: with SMTP id d3mr22592037qvn.194.1563278785764; 
 Tue, 16 Jul 2019 05:06:25 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id a6sm8577367qkn.59.2019.07.16.05.06.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jul 2019 05:06:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hnMDw-0007mK-JQ; Tue, 16 Jul 2019 09:06:24 -0300
Date: Tue, 16 Jul 2019 09:06:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v18 11/15] IB/mlx4: untag user pointers in mlx4_get_umem_mr
Message-ID: <20190716120624.GA29727@ziepe.ca>
References: <cover.1561386715.git.andreyknvl@google.com>
 <ea0ff94ef2b8af12ea6c222c5ebd970e0849b6dd.1561386715.git.andreyknvl@google.com>
 <20190624174015.GL29120@arrakis.emea.arm.com>
 <CAAeHK+y8vE=G_odK6KH=H064nSQcVgkQkNwb2zQD9swXxKSyUQ@mail.gmail.com>
 <20190715180510.GC4970@ziepe.ca>
 <CAAeHK+xPQqJP7p_JFxc4jrx9k7N0TpBWEuB8Px7XHvrfDU1_gw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+xPQqJP7p_JFxc4jrx9k7N0TpBWEuB8Px7XHvrfDU1_gw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 16 Jul 2019 14:13:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QhpcQElL3lG0JSgeqXLUe/9qK61Ylnz+wgQS3Fp7AjE=;
 b=D1pZEppikXtQIEAGheASyppn4vPK1DguzWZpiaVk939PKpSlX+xsQppOI0OBkx+nKq
 1JMeoAeO2RtNcmtGWYdKLbdcc2TbWA6drTUMGhZaq0sz3Geu8LfsJw1hCEqbsa4Bc/j+
 JrOL+39tH0pc4sSRyK3u0NuDnGgXAecwBuMSo8RvbrqgC5vpbNsoC1TREtbzabbzYUMS
 k9WxSC0qQS+DehVxRxUbV/PWa/pVTJQcjtukye20Ck/yNfMpOiGdSRCyc7pAxi48HA7M
 W3ECRyTg6vWSNWsyBv8+jZrvPzt1c26ISNAUAqR3Nk0GH9Y/cYJuNImJ996hTYW3Y9ab
 lyPQ==
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

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTI6NDI6MDdQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBNb24sIEp1bCAxNSwgMjAxOSBhdCA4OjA1IFBNIEphc29uIEd1bnRob3Jw
ZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEp1bCAxNSwgMjAxOSBhdCAw
NjowMToyOVBNICswMjAwLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiBPbiBNb24sIEp1
biAyNCwgMjAxOSBhdCA3OjQwIFBNIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFy
bS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDQ6
MzI6NTZQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gPiA+IFRoaXMgcGF0
Y2ggaXMgYSBwYXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5kcyBrZXJuZWwgQUJJIHRvIGFsbG93
IHRvIHBhc3MKPiA+ID4gPiA+IHRhZ2dlZCB1c2VyIHBvaW50ZXJzICh3aXRoIHRoZSB0b3AgYnl0
ZSBzZXQgdG8gc29tZXRoaW5nIGVsc2Ugb3RoZXIgdGhhbgo+ID4gPiA+ID4gMHgwMCkgYXMgc3lz
Y2FsbCBhcmd1bWVudHMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gbWx4NF9nZXRfdW1lbV9tcigpIHVz
ZXMgcHJvdmlkZWQgdXNlciBwb2ludGVycyBmb3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNhbgo+ID4g
PiA+ID4gb25seSBieSBkb25lIHdpdGggdW50YWdnZWQgcG9pbnRlcnMuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gVW50YWcgdXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xl
LmNvbT4KPiA+ID4gPiA+ICBkcml2ZXJzL2luZmluaWJhbmQvaHcvbWx4NC9tci5jIHwgNyArKysr
LS0tCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiA+ID4gPgo+ID4gPiA+IEFja2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBwYXRjaCBhbHNvIG5lZWRzIGFu
IGFjayBmcm9tIHRoZSBpbmZpbmliYW5kIG1haW50YWluZXJzIChKYXNvbikuCj4gPiA+Cj4gPiA+
IEhpIEphc29uLAo+ID4gPgo+ID4gPiBDb3VsZCB5b3UgdGFrZSBhIGxvb2sgYW5kIGdpdmUgeW91
ciBhY2tlZC1ieT8KPiA+Cj4gPiBPaCwgSSB0aGluayBJIGRpZCB0aGlzIGEgbG9uZyB0aW1lIGFn
by4gU3RpbGwgbG9va3MgT0suCj4gCj4gSG0sIG1heWJlIHRoYXQgd2FzIHdlIHdobyBsb3N0IGl0
LiBUaGFua3MhCj4gCj4gPiBZb3Ugd2lsbCBzZW5kIGl0Pwo+IAo+IEkgd2lsbCByZXNlbmQgdGhl
IHBhdGNoc2V0IG9uY2UgdGhlIG1lcmdlIHdpbmRvdyBpcyBjbG9zZWQsIGlmIHRoYXQncwo+IHdo
YXQgeW91IG1lYW4uCgpOby4uIEkgbWVhbiB3aG8gc2VuZCBpdCB0byBMaW51cydzIHRyZWU/IGll
IGRvIHlvdSB3YW50IG1lIHRvIHRha2UKdGhpcyBwYXRjaCBpbnRvIHJkbWE/CgpKYXNvbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
