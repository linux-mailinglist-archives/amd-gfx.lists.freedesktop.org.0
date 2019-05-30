Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F8930193
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 20:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89BE6E3D2;
	Thu, 30 May 2019 18:13:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 370ED6E3C9;
 Thu, 30 May 2019 17:15:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E146341;
 Thu, 30 May 2019 10:15:49 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 32A333F5AF; Thu, 30 May 2019 10:15:43 -0700 (PDT)
Date: Thu, 30 May 2019 18:15:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190530171540.GD35418@arrakis.emea.arm.com>
References: <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
 <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
 <20190524101139.36yre4af22bkvatx@mbp>
 <c6dd53d8-142b-3d8d-6a40-d21c5ee9d272@oracle.com>
 <CAAeHK+yAUsZWhp6xPAbWewX5Nbw+-G3svUyPmhXu5MVeEDKYvA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+yAUsZWhp6xPAbWewX5Nbw+-G3svUyPmhXu5MVeEDKYvA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 30 May 2019 18:13:10 +0000
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
 Andrew Morton <akpm@linux-foundation.org>, Elliott Hughes <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDQ6MTQ6NDVQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGFua3MgZm9yIGEgbG90IG9mIHZhbHVhYmxlIGlucHV0ISBJJ3ZlIHJlYWQg
dGhyb3VnaCBhbGwgdGhlIHJlcGxpZXMKPiBhbmQgZ290IHNvbWV3aGF0IGxvc3QuIFdoYXQgYXJl
IHRoZSBjaGFuZ2VzIEkgbmVlZCB0byBkbyB0byB0aGlzCj4gc2VyaWVzPwo+IAo+IDEuIFNob3Vs
ZCBJIG1vdmUgdW50YWdnaW5nIGZvciBtZW1vcnkgc3lzY2FsbHMgYmFjayB0byB0aGUgZ2VuZXJp
Ywo+IGNvZGUgc28gb3RoZXIgYXJjaGVzIHdvdWxkIG1ha2UgdXNlIG9mIGl0IGFzIHdlbGwsIG9y
IHNob3VsZCBJIGtlZXAKPiB0aGUgYXJtNjQgc3BlY2lmaWMgbWVtb3J5IHN5c2NhbGxzIHdyYXBw
ZXJzIGFuZCBhZGRyZXNzIHRoZSBjb21tZW50cwo+IG9uIHRoYXQgcGF0Y2g/CgpLZWVwIHRoZW0g
Z2VuZXJpYyBhZ2FpbiBidXQgbWFrZSBzdXJlIHdlIGdldCBhZ3JlZW1lbnQgd2l0aCBLaGFsaWQg
b24KdGhlIGFjdHVhbCBBQkkgaW1wbGljYXRpb25zIGZvciBzcGFyYy4KCj4gMi4gU2hvdWxkIEkg
bWFrZSB1bnRhZ2dpbmcgb3B0LWluIGFuZCBjb250cm9sbGVkIGJ5IGEgY29tbWFuZCBsaW5lIGFy
Z3VtZW50PwoKT3B0LWluLCB5ZXMsIGJ1dCBwZXIgdGFzayByYXRoZXIgdGhhbiBrZXJuZWwgY29t
bWFuZCBsaW5lIG9wdGlvbi4KcHJjdGwoKSBpcyBhIHBvc3NpYmlsaXR5IG9mIG9wdGluZyBpbi4K
Cj4gMy4gU2hvdWxkIEkgImFkZCBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL3VzZXItYWRkcmVzc2Vz
LnJzdCB0byBkZXNjcmliZQo+IHByb3BlciBjYXJlIGFuZCBoYW5kbGluZyBvZiB1c2VyIHNwYWNl
IHBvaW50ZXJzIHdpdGggdW50YWdnZWRfYWRkcigpLAo+IHdpdGggZXhhbXBsZXMgYmFzZWQgb24g
YWxsIHRoZSBjYXNlcyBzZWVuIHNvIGZhciBpbiB0aGlzIHNlcmllcyI/Cj4gV2hpY2ggZXhhbXBs
ZXMgc3BlY2lmaWNhbGx5IHNob3VsZCBpdCBjb3Zlcj8KCkkgdGhpbmsgd2UgY2FuIGxlYXZlIDMg
Zm9yIG5vdyBhcyBub3QgdG9vIHVyZ2VudC4gV2hhdCBJJ2QgbGlrZSBpcyBmb3IKVmluY2Vuem8n
cyBUQkkgdXNlciBBQkkgZG9jdW1lbnQgdG8gZ28gaW50byBhIG1vcmUgY29tbW9uIHBsYWNlIHNp
bmNlIHdlCmNhbiBleHBhbmQgaXQgdG8gY292ZXIgYm90aCBzcGFyYyBhbmQgYXJtNjQuIFdlJ2Qg
bmVlZCBhbiBhcm02NC1zcGVjaWZpYwpkb2MgYXMgd2VsbCBmb3IgdGhpbmdzIGxpa2UgcHJjdGwo
KSBhbmQgbGF0ZXIgTVRFIHRoYXQgc3BhcmMgbWF5IHN1cHBvcnQKZGlmZmVyZW50bHkuCgotLSAK
Q2F0YWxpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
