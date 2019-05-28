Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8A22DE6B
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 15:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07636E10D;
	Wed, 29 May 2019 13:37:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 017326E271;
 Tue, 28 May 2019 17:02:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5FEB341;
 Tue, 28 May 2019 10:02:53 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 C71E83F59C; Tue, 28 May 2019 10:02:47 -0700 (PDT)
Date: Tue, 28 May 2019 18:02:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190528170244.GF32006@arrakis.emea.arm.com>
References: <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <20190522101110.m2stmpaj7seezveq@mbp>
 <CAJgzZoosKBwqXRyA6fb8QQSZXFqfHqe9qO9je5TogHhzuoGXJQ@mail.gmail.com>
 <20190522163527.rnnc6t4tll7tk5zw@mbp>
 <201905221316.865581CF@keescook>
 <20190523144449.waam2mkyzhjpqpur@mbp>
 <201905230917.DEE7A75EF0@keescook>
 <20190523174345.6sv3kcipkvlwfmox@mbp>
 <201905231327.77CA8D0A36@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201905231327.77CA8D0A36@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 29 May 2019 13:37:24 +0000
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

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDI6MzE6MTZQTSAtMDcwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IHN5emthbGxlciBhbHJlYWR5IGF0dGVtcHRzIHRvIHJhbmRvbWx5IGluamVjdCBub24tY2Fu
b25pY2FsIGFuZAo+IDB4RkZGRi4uLi5GRkZGIGFkZHJlc3NlcyBmb3IgdXNlciBwb2ludGVycyBp
biBzeXNjYWxscyBpbiBhbiBlZmZvcnQgdG8KPiBmaW5kIGJ1Z3MgbGlrZSBDVkUtMjAxNy01MTIz
IHdoZXJlIHdhaXRpZCgpIHZpYSB1bmNoZWNrZWQgcHV0X3VzZXIoKSB3YXMKPiBhYmxlIHRvIHdy
aXRlIGRpcmVjdGx5IHRvIGtlcm5lbCBtZW1vcnlbMV0uCj4gCj4gSXQgc2VlbXMgdGhhdCB1c2lu
ZyBUQkkgYnkgZGVmYXVsdCBhbmQgbm90IGFsbG93aW5nIGEgc3dpdGNoIGJhY2sgdG8KPiAibm9y
bWFsIiBBQkkgd2l0aG91dCBhIHJlYm9vdCBhY3R1YWxseSBtZWFucyB0aGF0IHVzZXJzcGFjZSBj
YW5ub3QgaW5qZWN0Cj4ga2VybmVsIHBvaW50ZXJzIGludG8gc3lzY2FsbHMgYW55IG1vcmUsIHNp
bmNlIHRoZXknbGwgZ2V0IHVuaXZlcnNhbGx5Cj4gc3RyaXBwZWQgbm93LiBJcyBteSB1bmRlcnN0
YW5kaW5nIGNvcnJlY3QsIGhlcmU/IGkuZS4gZXhwbG9pdGluZwo+IENWRS0yMDE3LTUxMjMgd291
bGQgYmUgaW1wb3NzaWJsZSB1bmRlciBUQkk/Cj4gCj4gSWYgc28sIHRoZW4gSSB0aGluayB3ZSBz
aG91bGQgY29tbWl0IHRvIHRoZSBUQkkgQUJJIGFuZCBoYXZlIGEgYm9vdAo+IGZsYWcgdG8gZGlz
YWJsZSBpdCwgYnV0IE5PVCBoYXZlIGEgcHJvY2VzcyBmbGFnLCBhcyB0aGF0IHdvdWxkIGFsbG93
Cj4gYXR0YWNrZXJzIHRvIGJ5cGFzcyB0aGUgbWFza2luZy4gVGhlIG9ubHkgZmxhZyBzaG91bGQg
YmUgIlRCSSBvciBNVEUiLgo+IAo+IElmIHNvLCBjYW4gSSBnZXQgdG9wIGJ5dGUgbWFza2luZyBm
b3Igb3RoZXIgYXJjaGl0ZWN0dXJlcyB0b28/IExpa2UsCj4ganVzdCB0byBzdHJpcCBoaWdoIGJp
dHMgb2ZmIHVzZXJzcGFjZSBhZGRyZXNzZXM/IDspCgpKdXN0IGZvciBmdW4sIGhhY2svYXR0ZW1w
dCBhdCB5b3VyIGlkZWEgd2hpY2ggc2hvdWxkIG5vdCBpbnRlcmZlcmUgd2l0aApUQkkuIE9ubHkg
YnJpZWZseSB0ZXN0ZWQgb24gYXJtNjQgKGFuZCB0aGUgczM5MCBfX1RZUEVfSVNfUFRSIG1hY3Jv
IGlzCnByZXR0eSB3ZWlyZCA7KSk6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTg8LS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRpZmYgLS1naXQgYS9hcmNoL3MzOTAvaW5jbHVk
ZS9hc20vY29tcGF0LmggYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vY29tcGF0LmgKaW5kZXggNjNi
NDZlMzBiMmMzLi4zMzg0NTVhNzRlZmYgMTAwNjQ0Ci0tLSBhL2FyY2gvczM5MC9pbmNsdWRlL2Fz
bS9jb21wYXQuaAorKysgYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vY29tcGF0LmgKQEAgLTExLDkg
KzExLDYgQEAKIAogI2luY2x1ZGUgPGFzbS1nZW5lcmljL2NvbXBhdC5oPgogCi0jZGVmaW5lIF9f
VFlQRV9JU19QVFIodCkgKCFfX2J1aWx0aW5fdHlwZXNfY29tcGF0aWJsZV9wKCBcCi0JCQkJdHlw
ZW9mKDA/KF9fZm9yY2UgdCkwOjBVTEwpLCB1NjQpKQotCiAjZGVmaW5lIF9fU0NfREVMT1VTRSh0
LHYpICh7IFwKIAlCVUlMRF9CVUdfT04oc2l6ZW9mKHQpID4gNCAmJiAhX19UWVBFX0lTX1BUUih0
KSk7IFwKIAkoX19mb3JjZSB0KShfX1RZUEVfSVNfUFRSKHQpID8gKCh2KSAmIDB4N2ZmZmZmZmYp
IDogKHYpKTsgXApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zeXNjYWxscy5oIGIvaW5jbHVk
ZS9saW51eC9zeXNjYWxscy5oCmluZGV4IGUyODcwZmUxYmU1Yi4uYjFiOWZlODUwMmRhIDEwMDY0
NAotLS0gYS9pbmNsdWRlL2xpbnV4L3N5c2NhbGxzLmgKKysrIGIvaW5jbHVkZS9saW51eC9zeXNj
YWxscy5oCkBAIC0xMTksOCArMTE5LDE1IEBAIHN0cnVjdCBpb191cmluZ19wYXJhbXM7CiAjZGVm
aW5lIF9fVFlQRV9JU19MKHQpCShfX1RZUEVfQVModCwgMEwpKQogI2RlZmluZSBfX1RZUEVfSVNf
VUwodCkJKF9fVFlQRV9BUyh0LCAwVUwpKQogI2RlZmluZSBfX1RZUEVfSVNfTEwodCkgKF9fVFlQ
RV9BUyh0LCAwTEwpIHx8IF9fVFlQRV9BUyh0LCAwVUxMKSkKKyNkZWZpbmUgX19UWVBFX0lTX1BU
Uih0KSAoIV9fYnVpbHRpbl90eXBlc19jb21wYXRpYmxlX3AodHlwZW9mKDAgPyAoX19mb3JjZSB0
KTAgOiAwVUxMKSwgdTY0KSkKICNkZWZpbmUgX19TQ19MT05HKHQsIGEpIF9fdHlwZW9mKF9fYnVp
bHRpbl9jaG9vc2VfZXhwcihfX1RZUEVfSVNfTEwodCksIDBMTCwgMEwpKSBhCisjaWZkZWYgQ09O
RklHXzY0QklUCisjZGVmaW5lIF9fU0NfQ0FTVCh0LCBhKQkoX19UWVBFX0lTX1BUUih0KSBcCisJ
CQkJPyAoX19mb3JjZSB0KSAoKF9fdTY0KWEgJiB+KDFVTCA8PCA1NSkpIFwKKwkJCQk6IChfX2Zv
cmNlIHQpIGEpCisjZWxzZQogI2RlZmluZSBfX1NDX0NBU1QodCwgYSkJKF9fZm9yY2UgdCkgYQor
I2VuZGlmCiAjZGVmaW5lIF9fU0NfQVJHUyh0LCBhKQlhCiAjZGVmaW5lIF9fU0NfVEVTVCh0LCBh
KSAodm9pZClCVUlMRF9CVUdfT05fWkVSTyghX19UWVBFX0lTX0xMKHQpICYmIHNpemVvZih0KSA+
IHNpemVvZihsb25nKSkKIAoKLS0gCkNhdGFsaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
