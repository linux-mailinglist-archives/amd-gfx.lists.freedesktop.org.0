Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426956BF20
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 17:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D116E243;
	Wed, 17 Jul 2019 15:29:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAE76E188
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 13:36:49 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id c73so10847315pfb.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 06:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=upJur9hX33jRa5ZDAABYWCcVNIU4OKrA323sUj0kiJ0=;
 b=PBMkjwwBnas2Or6k9xc1c35SWmw5uEpjE+cSFwm0VwOSsY4D8WwnR5nCLeoLsmp+HY
 qKUFg+TcCCt0WBtvxML2hQGwNX9D2dIGHd/XTB9/AFpiDI+8Y/uaBCiX4ivrUBU0oPva
 JUgZIWURdWMu+Ci/3Rpm61Uctw2r+hhpdVjYs9nTtmR0+cPGSak14MINWEi4TeXd8COz
 8sHHjfWMQKZYz9g37uwAy3d80OABrz/7koZJhkMTC5irIjELEm1hYLvGbtZRW66dM14s
 GYHQvKf88n6HSDBPQq43Y8xby2xvi5h+fCU13r0Z90QA1WW/ZzeFI+sC12egz1NRtOU2
 h2Lg==
X-Gm-Message-State: APjAAAWKQ4WaxaHT4qJyawbuMoeiWno0+f/8vzsKQtOXj8nqavciNwEd
 nAlOh+GqoGZQ/vEztMjat9c8rebnjBsaGK+D1LS0Y9truFY=
X-Google-Smtp-Source: APXvYqz7m/UfmCxQEvGyEZmLKWfGDEQqrP2qzxF/oMVv3Ek5NDX+f4ncbRdtOgqzhkxO4Lp3vwbZe7MPyGJ1vZM4Wx0=
X-Received: by 2002:a17:90a:2488:: with SMTP id
 i8mr43162554pje.123.1563370608796; 
 Wed, 17 Jul 2019 06:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
 <ea0ff94ef2b8af12ea6c222c5ebd970e0849b6dd.1561386715.git.andreyknvl@google.com>
 <20190624174015.GL29120@arrakis.emea.arm.com>
 <CAAeHK+y8vE=G_odK6KH=H064nSQcVgkQkNwb2zQD9swXxKSyUQ@mail.gmail.com>
 <20190715180510.GC4970@ziepe.ca>
 <CAAeHK+xPQqJP7p_JFxc4jrx9k7N0TpBWEuB8Px7XHvrfDU1_gw@mail.gmail.com>
 <20190716120624.GA29727@ziepe.ca>
 <CAAeHK+xPPQ9QjAksbfWG-Zmnawt-cdw9eO_6GVxjEYcaDGvaRA@mail.gmail.com>
 <20190717115828.GE12119@ziepe.ca>
In-Reply-To: <20190717115828.GE12119@ziepe.ca>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 17 Jul 2019 15:36:37 +0200
Message-ID: <CAAeHK+yyQpc6cxyVeUUWUwiQYy8iAgVXmOVO=EQYSNzy9G8Q0A@mail.gmail.com>
Subject: Re: [PATCH v18 11/15] IB/mlx4: untag user pointers in mlx4_get_umem_mr
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Approved-At: Wed, 17 Jul 2019 15:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=upJur9hX33jRa5ZDAABYWCcVNIU4OKrA323sUj0kiJ0=;
 b=jU/Zat9i+mrs8cSnCYXrBiEONUz0WXxyKyOECIIPiTvG8WEhtGZGjK61290IX8o36U
 OrHTHQ7Woyg/qn3+sukX8RWKFmT/Ab3vSFlM0FM2BRuiucJNWXV94DF4e2NhGQgdA44A
 dT08TPfZUZgkz0of54cXYItyNEHlQbHBkArsYbqcDoUXDHAB+kz50O9ewS939NtAQV8u
 N3pg+MG4dZM9J1oQTBELA9KEuGXZuE94dTh2nx4VJ6oW11nUXuKKdq/o5lVXbnas7dEB
 7eGFT9GZTTNoP+bU6YviC4h7qnZidfElkMDjIpsDOMoPQb/nzifgWXLs7MlD24BgMlQq
 Xslw==
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

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMTo1OCBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAxNywgMjAxOSBhdCAwMTo0NDowN1BNICswMjAw
LCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gT24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMjow
NiBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9u
IFR1ZSwgSnVsIDE2LCAyMDE5IGF0IDEyOjQyOjA3UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Yg
d3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgODowNSBQTSBKYXNvbiBHdW50
aG9ycGUgPGpnZ0B6aWVwZS5jYT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gTW9uLCBK
dWwgMTUsIDIwMTkgYXQgMDY6MDE6MjlQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToK
PiA+ID4gPiA+ID4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgNzo0MCBQTSBDYXRhbGluIE1hcmlu
YXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+IE9uIE1vbiwgSnVuIDI0LCAyMDE5IGF0IDA0OjMyOjU2UE0gKzAyMDAsIEFuZHJleSBL
b25vdmFsb3Ygd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBh
IHNlcmllcyB0aGF0IGV4dGVuZHMga2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNzCj4gPiA+ID4g
PiA+ID4gPiB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRvIHNv
bWV0aGluZyBlbHNlIG90aGVyIHRoYW4KPiA+ID4gPiA+ID4gPiA+IDB4MDApIGFzIHN5c2NhbGwg
YXJndW1lbnRzLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IG1seDRfZ2V0X3VtZW1f
bXIoKSB1c2VzIHByb3ZpZGVkIHVzZXIgcG9pbnRlcnMgZm9yIHZtYSBsb29rdXBzLCB3aGljaCBj
YW4KPiA+ID4gPiA+ID4gPiA+IG9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgo+
ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IFVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGhp
cyBmdW5jdGlvbi4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gPiA+ID4gPiA+ID4g
PiAgZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYyB8IDcgKysrKy0tLQo+ID4gPiA+ID4g
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBBY2tlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRh
bGluLm1hcmluYXNAYXJtLmNvbT4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRoaXMgcGF0
Y2ggYWxzbyBuZWVkcyBhbiBhY2sgZnJvbSB0aGUgaW5maW5pYmFuZCBtYWludGFpbmVycyAoSmFz
b24pLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBIaSBKYXNvbiwKPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gQ291bGQgeW91IHRha2UgYSBsb29rIGFuZCBnaXZlIHlvdXIgYWNrZWQtYnk/Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gT2gsIEkgdGhpbmsgSSBkaWQgdGhpcyBhIGxvbmcgdGltZSBhZ28uIFN0
aWxsIGxvb2tzIE9LLgo+ID4gPiA+Cj4gPiA+ID4gSG0sIG1heWJlIHRoYXQgd2FzIHdlIHdobyBs
b3N0IGl0LiBUaGFua3MhCj4gPiA+ID4KPiA+ID4gPiA+IFlvdSB3aWxsIHNlbmQgaXQ/Cj4gPiA+
ID4KPiA+ID4gPiBJIHdpbGwgcmVzZW5kIHRoZSBwYXRjaHNldCBvbmNlIHRoZSBtZXJnZSB3aW5k
b3cgaXMgY2xvc2VkLCBpZiB0aGF0J3MKPiA+ID4gPiB3aGF0IHlvdSBtZWFuLgo+ID4gPgo+ID4g
PiBOby4uIEkgbWVhbiB3aG8gc2VuZCBpdCB0byBMaW51cydzIHRyZWU/IGllIGRvIHlvdSB3YW50
IG1lIHRvIHRha2UKPiA+ID4gdGhpcyBwYXRjaCBpbnRvIHJkbWE/Cj4gPgo+ID4gSSB0aGluayB0
aGUgcGxhbiB3YXMgdG8gbWVyZ2UgdGhlIHdob2xlIHNlcmllcyB0aHJvdWdoIHRoZSBtbSB0cmVl
Lgo+ID4gQnV0IEkgZG9uJ3QgbWluZCBpZiB5b3Ugd2FudCB0byB0YWtlIHRoaXMgcGF0Y2ggaW50
byB5b3VyIHRyZWUuIEl0J3MKPiA+IGp1c3QgdGhhdCB0aGlzIHBhdGNoIGRvZXNuJ3QgbWFrZSBt
dWNoIHNlbnNlIHdpdGhvdXQgdGhlIHJlc3Qgb2YgdGhlCj4gPiBzZXJpZXMuCj4KPiBHZW5lcmFs
bHkgSSBwcmVmZXIgaWYgc3Vic3lzdGVtIGNoYW5nZXMgc3RheSBpbiBzdWJzeXN0ZW0gdHJlZXMu
IElmCj4gdGhlIHBhdGNoIGlzIGdvb2Qgc3RhbmRhbG9uZSwgYW5kIHRoZSB1bnRhZyBBUEkgaGFz
IGFscmVhZHkgYmVlbgo+IG1lcmdlZCwgdGhpcyBpcyBhIGJldHRlciBzdHJhdGVneS4KCk9LLCBm
ZWVsIGZyZWUgdG8gdGFrZSB0aGlzIGludG8geW91ciB0cmVlLCB0aGlzIHdvcmtzIGZvciBtZS4K
Cj4KPiBKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
