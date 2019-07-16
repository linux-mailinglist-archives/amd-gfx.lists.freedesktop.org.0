Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3616AA66
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 16:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64566E12C;
	Tue, 16 Jul 2019 14:13:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D2F6E10C
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 10:42:19 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id f25so9233401pgv.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 03:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pcaSKUptakKKj3J2cwfnG8UjZ2PIKf/cDSDsIedAL2o=;
 b=kaoCTAV9dL160QrF3W1vG4T4Q2ukhOLKVHBuQffA+WHrhRdtm316OY5Qi5kQgQG5Zm
 Kpqx/jwxkgFF61XepHQk83jE3ygcV3+SSltLlDBMxX4ZPGKvojDdKNvRHFLRCLWtlENv
 lcUa+ut84ohp/tfwX23etq+cP+EQ5y3ZH4dg0LiwG9mSxSd/R+03nRgedCZlEvTgilPA
 IdWxd2y+DlBzxbhPVvGW2iCm4DHZMZjEH+rataaPHfDw07MtY+HvmoIe+loArQoYzF4R
 SexONw+p9IsA+zyL+qbgD0lh1RGpqSAKeIoI3xlfAJqIbkwJgOGJ24q2eFWo9xYpC4mz
 3ECg==
X-Gm-Message-State: APjAAAW9iN4+BUSjoRvcqLV3XfYPnShDTvgy4Gop1X7/LJCXCi22NPTx
 PmrCP1TxxqRfvNgh9Kc2j/4v5md9CAaFbA1wFN/E3w==
X-Google-Smtp-Source: APXvYqxbAU3TJ3lRd6aOUwZ5wuALN9pC6/wjaLV/0rVHNmhI9zipeP18fROsGNN7fnnNJ7wIdpoSB0T+fWzH5C49P+M=
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr32488026pgq.130.1563273738850; 
 Tue, 16 Jul 2019 03:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
 <ea0ff94ef2b8af12ea6c222c5ebd970e0849b6dd.1561386715.git.andreyknvl@google.com>
 <20190624174015.GL29120@arrakis.emea.arm.com>
 <CAAeHK+y8vE=G_odK6KH=H064nSQcVgkQkNwb2zQD9swXxKSyUQ@mail.gmail.com>
 <20190715180510.GC4970@ziepe.ca>
In-Reply-To: <20190715180510.GC4970@ziepe.ca>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Tue, 16 Jul 2019 12:42:07 +0200
Message-ID: <CAAeHK+xPQqJP7p_JFxc4jrx9k7N0TpBWEuB8Px7XHvrfDU1_gw@mail.gmail.com>
Subject: Re: [PATCH v18 11/15] IB/mlx4: untag user pointers in mlx4_get_umem_mr
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Approved-At: Tue, 16 Jul 2019 14:13:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pcaSKUptakKKj3J2cwfnG8UjZ2PIKf/cDSDsIedAL2o=;
 b=s+OFL3WXkvuRlzxrd5bE1Ngy+XgzRf65DCow2JPQVmoncUwZbVCqMBlaegEFH9OjoE
 hGCT+agVZt6o7c1dpbisMO2uuxLS4ocd2/ZDN7N4RlgjJBFJVqurL7o3Ajgq9RawIe5i
 iUUC4MErBeuJi9C5qq1rXWHueETWBI6Hzy/jstfQMgqGCotgu8bx7AIz25MV6uvB/uMd
 AEZz6pOzM1SLevN2MhBCQnN+Ls0p0A8Ke9oO9L3/oytDbjyhFG4BNaIQGs6zmciV6uIC
 B6Z1DPnQPaMXlwFS2CsRvlNBpOj4ZTVcwcFW3en9/NlOTRMUXcMVVd3220XqOCAD3ZI0
 4G+A==
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

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgODowNSBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1bCAxNSwgMjAxOSBhdCAwNjowMToyOVBNICswMjAw
LCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgNzo0
MCBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDQ6MzI6NTZQTSArMDIwMCwgQW5kcmV5
IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmll
cyB0aGF0IGV4dGVuZHMga2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNzCj4gPiA+ID4gdGFnZ2Vk
IHVzZXIgcG9pbnRlcnMgKHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBv
dGhlciB0aGFuCj4gPiA+ID4gMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gPiA+ID4KPiA+
ID4gPiBtbHg0X2dldF91bWVtX21yKCkgdXNlcyBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2
bWEgbG9va3Vwcywgd2hpY2ggY2FuCj4gPiA+ID4gb25seSBieSBkb25lIHdpdGggdW50YWdnZWQg
cG9pbnRlcnMuCj4gPiA+ID4KPiA+ID4gPiBVbnRhZyB1c2VyIHBvaW50ZXJzIGluIHRoaXMgZnVu
Y3Rpb24uCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxh
bmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gPiA+ID4gIGRyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg0
L21yLmMgfCA3ICsrKystLS0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gQWNrZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8
Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+Cj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggYWxzbyBuZWVk
cyBhbiBhY2sgZnJvbSB0aGUgaW5maW5pYmFuZCBtYWludGFpbmVycyAoSmFzb24pLgo+ID4KPiA+
IEhpIEphc29uLAo+ID4KPiA+IENvdWxkIHlvdSB0YWtlIGEgbG9vayBhbmQgZ2l2ZSB5b3VyIGFj
a2VkLWJ5Pwo+Cj4gT2gsIEkgdGhpbmsgSSBkaWQgdGhpcyBhIGxvbmcgdGltZSBhZ28uIFN0aWxs
IGxvb2tzIE9LLgoKSG0sIG1heWJlIHRoYXQgd2FzIHdlIHdobyBsb3N0IGl0LiBUaGFua3MhCgo+
IFlvdSB3aWxsIHNlbmQgaXQ/CgpJIHdpbGwgcmVzZW5kIHRoZSBwYXRjaHNldCBvbmNlIHRoZSBt
ZXJnZSB3aW5kb3cgaXMgY2xvc2VkLCBpZiB0aGF0J3MKd2hhdCB5b3UgbWVhbi4KCj4KPiBSZXZp
ZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+Cj4gSmFzb24KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
