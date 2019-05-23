Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB73E284C1
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 19:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA246E04A;
	Thu, 23 May 2019 17:19:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7158D6E038;
 Thu, 23 May 2019 17:00:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B21C374;
 Thu, 23 May 2019 10:00:36 -0700 (PDT)
Received: from mbp (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF1633F5AF;
 Thu, 23 May 2019 10:00:29 -0700 (PDT)
Date: Thu, 23 May 2019 18:00:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: enh <enh@google.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190523170026.nso2me5qnrrjbrdr@mbp>
References: <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <20190522101110.m2stmpaj7seezveq@mbp>
 <CAJgzZoosKBwqXRyA6fb8QQSZXFqfHqe9qO9je5TogHhzuoGXJQ@mail.gmail.com>
 <20190522163527.rnnc6t4tll7tk5zw@mbp>
 <201905221316.865581CF@keescook>
 <20190523144449.waam2mkyzhjpqpur@mbp>
 <CAJgzZoqX--Kd9=Kjpnfz-5cjVJ=TdsXM5dJM_EjLFKniVbny2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJgzZoqX--Kd9=Kjpnfz-5cjVJ=TdsXM5dJM_EjLFKniVbny2w@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Thu, 23 May 2019 17:19:01 +0000
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgenii Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDg6NDQ6MTJBTSAtMDcwMCwgZW5oIHdyb3RlOgo+IE9u
IFRodSwgTWF5IDIzLCAyMDE5IGF0IDc6NDUgQU0gQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1h
cmluYXNAYXJtLmNvbT4gd3JvdGU6Cj4gPiBPbiBXZWQsIE1heSAyMiwgMjAxOSBhdCAwMTo0Nzoz
NlBNIC0wNzAwLCBLZWVzIENvb2sgd3JvdGU6Cj4gPiA+IEZvciB1c2Vyc3BhY2UsIGhvdyB3b3Vs
ZCBhIGZ1dHVyZSBiaW5hcnkgY2hvb3NlIFRCSSBvdmVyIE1URT8gSWYgaXQncwo+ID4gPiBhIGxp
YnJhcnkgaXNzdWUsIHdlIGNhbid0IHVzZSBhbiBFTEYgYml0LCBzaW5jZSB0aGUgY2hvaWNlIG1h
eSBiZQo+ID4gPiAibGF0ZSIgYWZ0ZXIgRUxGIGxvYWQgKHRoaXMgaW1wbGllcyB0aGUgbmVlZCBm
b3IgYSBwcmN0bCgpLikgSWYgaXQncwo+ID4gPiBiaW5hcnktb25seSAoImJ1aWx0IHdpdGggSFdL
QVNhbiIpIHRoZW4gYW4gRUxGIGJpdCBzZWVtcyBzdWZmaWNpZW50Lgo+ID4gPiBBbmQgd2l0aG91
dCB0aGUgbWFya2luZywgSSdkIGV4cGVjdCB0aGUga2VybmVsIHRvIGVuZm9yY2UgTVRFIHdoZW4K
PiA+ID4gdGhlcmUgYXJlIGhpZ2ggYml0cy4KPiA+Cj4gPiBUaGUgY3VycmVudCBwbGFuIGlzIHRo
YXQgYSBmdXR1cmUgYmluYXJ5IGlzc3VlcyBhIHByY3RsKCksIGFmdGVyCj4gPiBjaGVja2luZyB0
aGUgSFdDQVBfTVRFIGJpdCAoYXMgSSByZXBsaWVkIHRvIEVsbGlvdCwgdGhlIE1URSBpbnN0cnVj
dGlvbnMKPiA+IGFyZSBub3QgaW4gdGhlIGN1cnJlbnQgTk9QIHNwYWNlKS4gSSdkIGV4cGVjdCB0
aGlzIHRvIGJlIGRvbmUgYnkgdGhlCj4gPiBsaWJjIG9yIGR5bmFtaWMgbG9hZGVyIHVuZGVyIHRo
ZSBhc3N1bXB0aW9uIHRoYXQgdGhlIGJpbmFyaWVzIGl0IGxvYWRzCj4gPiBkbyBfbm90XyB1c2Ug
dGhlIHRvcCBwb2ludGVyIGJ5dGUgZm9yIGFueXRoaW5nIGVsc2UuCj4gCj4geWVhaCwgaXQgc291
bmRzIGxpa2UgdG8gc3VwcG9ydCBod2FzYW4gYW5kIE1URSwgdGhlIGR5bmFtaWMgbGlua2VyCj4g
d2lsbCBuZWVkIHRvIG5vdCB1c2UgZWl0aGVyIGl0c2VsZi4KPiAKPiA+IFdpdGggaHdhc2FuIGNv
bXBpbGVkIG9iamVjdHMgdGhpcyBnZXRzIG1vcmUgY29uZnVzaW5nIChhbnkgRUxGIG5vdGUKPiA+
IHRvIGlkZW50aWZ5IHRoZW0/KS4KPiAKPiBubywgYXQgdGhlIG1vbWVudCBjb2RlIHRoYXQgd2Fu
dHMgdG8ga25vdyBjaGVja3MgZm9yIHRoZSBwcmVzZW5jZSBvZgo+IF9faHdhc2FuX2luaXQuIChh
bmQgYmlvbmljIGRvZXNuJ3QgYWN0dWFsbHkgbG9vayBhdCBhbnkgRUxGIG5vdGVzCj4gcmlnaHQg
bm93LikgYnV0IHdlIGNhbiBhbHdheXMgYWRkIHNvbWV0aGluZyBpZiB3ZSBuZWVkIHRvLgoKSXQn
cyBhIHVzZXJzcGFjZSBkZWNpc2lvbiB0byBtYWtlLiBJbiB0aGUga2VybmVsLCB3ZSBhcmUgcHJv
cG9zaW5nIHRoYXQKYmlvbmljIGNhbGxzIGEgcHJjdGwoKSB0byBlbmFibGUgTVRFIGV4cGxpY2l0
bHkuIEl0IGNvdWxkIGZpcnN0IGNoZWNrCmZvciB0aGUgcHJlc2VuY2Ugb2YgX19od2FzYW5faW5p
dC4KCi0tIApDYXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
