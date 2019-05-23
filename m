Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E64281EF
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 17:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AF46E02C;
	Thu, 23 May 2019 15:56:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C25689E7B;
 Thu, 23 May 2019 15:08:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7E5C80D;
 Thu, 23 May 2019 08:08:26 -0700 (PDT)
Received: from mbp (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B63863F690;
 Thu, 23 May 2019 08:08:20 -0700 (PDT)
Date: Thu, 23 May 2019 16:08:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190523150813.x4btg5zxa4gl5o4q@mbp>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <20190522101110.m2stmpaj7seezveq@mbp>
 <CAJgzZoosKBwqXRyA6fb8QQSZXFqfHqe9qO9je5TogHhzuoGXJQ@mail.gmail.com>
 <201905221157.A9BAB1F296@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201905221157.A9BAB1F296@keescook>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Thu, 23 May 2019 15:56:46 +0000
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
 Kevin Brodsky <kevin.brodsky@arm.com>,
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
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMTI6MjE6MjdQTSAtMDcwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IElmIGEgcHJvY2VzcyB3YW50cyB0byBub3QgdGFnLCB0aGF0J3MgYWxzbyB1cCB0byB0aGUg
YWxsb2NhdG9yIHdoZXJlCj4gaXQgY2FuIGRlY2lkZSBub3QgdG8gYXNrIHRoZSBrZXJuZWwsIGFu
ZCBqdXN0IG5vdCB0YWcuIE5vdGhpbmcgYnJlYWtzIGluCj4gdXNlcnNwYWNlIGlmIGEgcHJvY2Vz
cyBpcyBOT1QgdGFnZ2luZyBhbmQgdW50YWdnZWRfYWRkcigpIGV4aXN0cyBvciBpcwo+IG1pc3Np
bmcuIFRoaXMsIEkgdGhpbmssIGlzIHRoZSBjb3JlIHdheSB0aGlzIGRvZXNuJ3QgdHJpcCBvdmVy
IHRoZQo+IGdvbGRlbiBydWxlOiBhbiBvbGQgc3lzdGVtIGltYWdlIHdpbGwgcnVuIGZpbmUgKGJl
Y2F1c2UgaXQncyBub3QKPiB0YWdnaW5nKS4gQSAqbmV3KiBzeXN0ZW0gbWF5IGVuY291bnRlciBi
dWdzIHdpdGggdGFnZ2luZyBiZWNhdXNlIGl0J3MgYQo+IG5ldyBmZWF0dXJlOiB0aGlzIGlzIFRo
ZSBXYXkgT2YgVGhpbmdzLiBCdXQgd2UgZG9uJ3QgYnJlYWsgb2xkIHVzZXJzcGFjZQo+IGJlY2F1
c2Ugb2xkIHVzZXJzcGFjZSBpc24ndCB1c2luZyB0YWdzLgoKV2l0aCB0aGlzIHNlcmllcyBhbmQg
aHdhc2FuIGJpbmFyaWVzLCBhdCBzb21lIHBvaW50IGluIHRoZSBmdXR1cmUgdGhleQp3aWxsIGJl
IGNvbnNpZGVyZWQgIm9sZCB1c2Vyc3BhY2UiIGFuZCB0aGV5IGRvIHVzZSBwb2ludGVyIHRhZ3Mg
d2hpY2gKZXhwZWN0IHRvIGJlIGlnbm9yZWQgYnkgYm90aCB0aGUgaGFyZHdhcmUgYW5kIHRoZSBr
ZXJuZWwuIE1URSBicmVha3MKdGhpcyBhc3N1bXB0aW9uLgoKLS0gCkNhdGFsaW4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
