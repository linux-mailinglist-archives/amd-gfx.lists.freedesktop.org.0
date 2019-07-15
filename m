Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D8369AC9
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 20:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF36589AB2;
	Mon, 15 Jul 2019 18:28:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0746A892F2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 18:05:12 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id n11so16601580qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 11:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oQ4K7j9A7KZ0nbwdC0yOxg3aR/aRtjl8qzNQbwacYqI=;
 b=PC7CpNarljqZ5DEaSf0YdDlwO2zLG3kQquib+fQyaKdvQ8T9AFb+fDBtUALX0VJ5bs
 C3+sKKvW8Wf3DjhdKr08hdBh4CSyMGShbNVnFmi81bvpGxADfYC2V7cQCo6Vg5T67gBC
 mvHf8TDSHKmR79muz5R3wOMo+vOO9HIEhEsxyg/bpi6nfi1JMTH0Vm498PHMGvsscu6a
 N1kZNX//hbO5yZaK5YKeLNUJlFrP0wAPKf+w0MejJBcmUPeXJqn60UswWVQxrU2pMwFv
 W7jLl+iJIcsG6l5sUZv9s8VuwLJSTWrJkpw6t/tzSs16TL5lkjwdUZWMySG280jfupzJ
 S1jg==
X-Gm-Message-State: APjAAAUbHxcDPBDKUBBwD6z6PSN8jwiTN2Anye1ZWWYLGG4woPfQwlet
 cZM89roHe608OBvn3RvbkqLpsg==
X-Google-Smtp-Source: APXvYqzV3YFI+MpwRBSBS9L25rk8A7XfyA1gAg9YfhwBzidc1Vfy+exQVLzBpqEA6++D83b7IWLy1g==
X-Received: by 2002:a05:6214:3a5:: with SMTP id
 m5mr19973542qvy.7.1563213911969; 
 Mon, 15 Jul 2019 11:05:11 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id l80sm8277974qke.24.2019.07.15.11.05.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Jul 2019 11:05:11 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hn5La-0001zV-SL; Mon, 15 Jul 2019 15:05:10 -0300
Date: Mon, 15 Jul 2019 15:05:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v18 11/15] IB/mlx4: untag user pointers in mlx4_get_umem_mr
Message-ID: <20190715180510.GC4970@ziepe.ca>
References: <cover.1561386715.git.andreyknvl@google.com>
 <ea0ff94ef2b8af12ea6c222c5ebd970e0849b6dd.1561386715.git.andreyknvl@google.com>
 <20190624174015.GL29120@arrakis.emea.arm.com>
 <CAAeHK+y8vE=G_odK6KH=H064nSQcVgkQkNwb2zQD9swXxKSyUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+y8vE=G_odK6KH=H064nSQcVgkQkNwb2zQD9swXxKSyUQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 15 Jul 2019 18:28:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oQ4K7j9A7KZ0nbwdC0yOxg3aR/aRtjl8qzNQbwacYqI=;
 b=PwR1EtCrURwrbo7TpqHuOvhX3LIycbjKkBb4iZ6+YCuC60ErzFmtlkMrRo9GfbX0ep
 bOPWg9HzO0UREAz1sjKJFk3TljxpYwzvCkuA0H8lubNfJCvY2ASmYBnxIKBySJaciMh9
 IWCtA6vd68VwBDPGY07TF40sWdRGtt46+KtuhJCf3Dkv+hk0kDlTClc7v0FgkXnm9Td6
 i1yxqpRiKWqC8epriEnPtS7rhozNGFmNJhWNANw7o2ytOh0Tu6qDWMUojtH/q6UpZnph
 8NNcHVz4Emezex9wQTSbQUH4N9LwFgHNyRTzxKvxiscGagPT01BlLq6kMX4xBhj5skGH
 0P7g==
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

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDY6MDE6MjlQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBNb24sIEp1biAyNCwgMjAxOSBhdCA3OjQwIFBNIENhdGFsaW4gTWFyaW5h
cyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgSnVuIDI0
LCAyMDE5IGF0IDA0OjMyOjU2UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiA+
IFRoaXMgcGF0Y2ggaXMgYSBwYXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5kcyBrZXJuZWwgQUJJ
IHRvIGFsbG93IHRvIHBhc3MKPiA+ID4gdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGggdGhlIHRv
cCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlciB0aGFuCj4gPiA+IDB4MDApIGFzIHN5
c2NhbGwgYXJndW1lbnRzLgo+ID4gPgo+ID4gPiBtbHg0X2dldF91bWVtX21yKCkgdXNlcyBwcm92
aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2bWEgbG9va3Vwcywgd2hpY2ggY2FuCj4gPiA+IG9ubHkg
YnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgo+ID4gPgo+ID4gPiBVbnRhZyB1c2VyIHBv
aW50ZXJzIGluIHRoaXMgZnVuY3Rpb24uCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
eSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KPiA+ID4gIGRyaXZlcnMvaW5maW5p
YmFuZC9ody9tbHg0L21yLmMgfCA3ICsrKystLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gQWNrZWQtYnk6IENhdGFsaW4gTWFy
aW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+Cj4gPgo+ID4gVGhpcyBwYXRjaCBhbHNvIG5l
ZWRzIGFuIGFjayBmcm9tIHRoZSBpbmZpbmliYW5kIG1haW50YWluZXJzIChKYXNvbikuCj4gCj4g
SGkgSmFzb24sCj4gCj4gQ291bGQgeW91IHRha2UgYSBsb29rIGFuZCBnaXZlIHlvdXIgYWNrZWQt
Ynk/CgpPaCwgSSB0aGluayBJIGRpZCB0aGlzIGEgbG9uZyB0aW1lIGFnby4gU3RpbGwgbG9va3Mg
T0suIFlvdSB3aWxsIHNlbmQKaXQ/CgpSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dA
bWVsbGFub3guY29tPgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
