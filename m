Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A4D2C850
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 16:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00B989DEA;
	Tue, 28 May 2019 14:09:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 484AF6E22A;
 Tue, 28 May 2019 13:05:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D01EC80D;
 Tue, 28 May 2019 06:05:26 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 479923F5AF; Tue, 28 May 2019 06:05:21 -0700 (PDT)
Date: Tue, 28 May 2019 14:05:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
Message-ID: <20190528130518.GB32006@arrakis.emea.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 28 May 2019 14:09:32 +0000
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDY6MzA6NTFQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiAgLyoKPiAgICogV3JhcHBlcnMgdG8gcGFzcyB0aGUgcHRfcmVncyBhcmd1bWVu
dC4KPiAgICovCj4gICNkZWZpbmUgc3lzX3BlcnNvbmFsaXR5CQlzeXNfYXJtNjRfcGVyc29uYWxp
dHkKPiArI2RlZmluZSBzeXNfbW1hcF9wZ29mZgkJc3lzX2FybTY0X21tYXBfcGdvZmYKPiArI2Rl
ZmluZSBzeXNfbXJlbWFwCQlzeXNfYXJtNjRfbXJlbWFwCj4gKyNkZWZpbmUgc3lzX211bm1hcAkJ
c3lzX2FybTY0X211bm1hcAo+ICsjZGVmaW5lIHN5c19icmsJCQlzeXNfYXJtNjRfYnJrCj4gKyNk
ZWZpbmUgc3lzX2dldF9tZW1wb2xpY3kJc3lzX2FybTY0X2dldF9tZW1wb2xpY3kKPiArI2RlZmlu
ZSBzeXNfbWFkdmlzZQkJc3lzX2FybTY0X21hZHZpc2UKPiArI2RlZmluZSBzeXNfbWJpbmQJCXN5
c19hcm02NF9tYmluZAo+ICsjZGVmaW5lIHN5c19tbG9jawkJc3lzX2FybTY0X21sb2NrCj4gKyNk
ZWZpbmUgc3lzX21sb2NrMgkJc3lzX2FybTY0X21sb2NrMgo+ICsjZGVmaW5lIHN5c19tdW5sb2Nr
CQlzeXNfYXJtNjRfbXVubG9jawo+ICsjZGVmaW5lIHN5c19tcHJvdGVjdAkJc3lzX2FybTY0X21w
cm90ZWN0Cj4gKyNkZWZpbmUgc3lzX21zeW5jCQlzeXNfYXJtNjRfbXN5bmMKPiArI2RlZmluZSBz
eXNfbWluY29yZQkJc3lzX2FybTY0X21pbmNvcmUKPiArI2RlZmluZSBzeXNfcmVtYXBfZmlsZV9w
YWdlcwlzeXNfYXJtNjRfcmVtYXBfZmlsZV9wYWdlcwo+ICsjZGVmaW5lIHN5c19zaG1hdAkJc3lz
X2FybTY0X3NobWF0Cj4gKyNkZWZpbmUgc3lzX3NobWR0CQlzeXNfYXJtNjRfc2htZHQKClRoaXMg
aHVuayBzaG91bGQgYmUgKEkgc2VudCBhIHNlcGFyYXRlIHBhdGNoIGZvciBzeXNfcGVyc29uYWxp
dHkpOgoKQEAgLTE2MCwyMyArMTYzLDIzIEBAIFNZU0NBTExfREVGSU5FMShhcm02NF9zaG1kdCwg
Y2hhciBfX3VzZXIgKiwgc2htYWRkcikKIC8qCiAgKiBXcmFwcGVycyB0byBwYXNzIHRoZSBwdF9y
ZWdzIGFyZ3VtZW50LgogICovCi0jZGVmaW5lIHN5c19wZXJzb25hbGl0eQkJc3lzX2FybTY0X3Bl
cnNvbmFsaXR5Ci0jZGVmaW5lIHN5c19tbWFwX3Bnb2ZmCQlzeXNfYXJtNjRfbW1hcF9wZ29mZgot
I2RlZmluZSBzeXNfbXJlbWFwCQlzeXNfYXJtNjRfbXJlbWFwCi0jZGVmaW5lIHN5c19tdW5tYXAJ
CXN5c19hcm02NF9tdW5tYXAKLSNkZWZpbmUgc3lzX2JyawkJCXN5c19hcm02NF9icmsKLSNkZWZp
bmUgc3lzX2dldF9tZW1wb2xpY3kJc3lzX2FybTY0X2dldF9tZW1wb2xpY3kKLSNkZWZpbmUgc3lz
X21hZHZpc2UJCXN5c19hcm02NF9tYWR2aXNlCi0jZGVmaW5lIHN5c19tYmluZAkJc3lzX2FybTY0
X21iaW5kCi0jZGVmaW5lIHN5c19tbG9jawkJc3lzX2FybTY0X21sb2NrCi0jZGVmaW5lIHN5c19t
bG9jazIJCXN5c19hcm02NF9tbG9jazIKLSNkZWZpbmUgc3lzX211bmxvY2sJCXN5c19hcm02NF9t
dW5sb2NrCi0jZGVmaW5lIHN5c19tcHJvdGVjdAkJc3lzX2FybTY0X21wcm90ZWN0Ci0jZGVmaW5l
IHN5c19tc3luYwkJc3lzX2FybTY0X21zeW5jCi0jZGVmaW5lIHN5c19taW5jb3JlCQlzeXNfYXJt
NjRfbWluY29yZQotI2RlZmluZSBzeXNfcmVtYXBfZmlsZV9wYWdlcwlzeXNfYXJtNjRfcmVtYXBf
ZmlsZV9wYWdlcwotI2RlZmluZSBzeXNfc2htYXQJCXN5c19hcm02NF9zaG1hdAotI2RlZmluZSBz
eXNfc2htZHQJCXN5c19hcm02NF9zaG1kdAorI2RlZmluZSBfX2FybTY0X3N5c19wZXJzb25hbGl0
eQkJX19hcm02NF9zeXNfYXJtNjRfcGVyc29uYWxpdHkKKyNkZWZpbmUgX19hcm02NF9zeXNfbW1h
cF9wZ29mZgkJX19hcm02NF9zeXNfYXJtNjRfbW1hcF9wZ29mZgorI2RlZmluZSBfX2FybTY0X3N5
c19tcmVtYXAJCV9fYXJtNjRfc3lzX2FybTY0X21yZW1hcAorI2RlZmluZSBfX2FybTY0X3N5c19t
dW5tYXAJCV9fYXJtNjRfc3lzX2FybTY0X211bm1hcAorI2RlZmluZSBfX2FybTY0X3N5c19icmsJ
CQlfX2FybTY0X3N5c19hcm02NF9icmsKKyNkZWZpbmUgX19hcm02NF9zeXNfZ2V0X21lbXBvbGlj
eQlfX2FybTY0X3N5c19hcm02NF9nZXRfbWVtcG9saWN5CisjZGVmaW5lIF9fYXJtNjRfc3lzX21h
ZHZpc2UJCV9fYXJtNjRfc3lzX2FybTY0X21hZHZpc2UKKyNkZWZpbmUgX19hcm02NF9zeXNfbWJp
bmQJCV9fYXJtNjRfc3lzX2FybTY0X21iaW5kCisjZGVmaW5lIF9fYXJtNjRfc3lzX21sb2NrCQlf
X2FybTY0X3N5c19hcm02NF9tbG9jaworI2RlZmluZSBfX2FybTY0X3N5c19tbG9jazIJCV9fYXJt
NjRfc3lzX2FybTY0X21sb2NrMgorI2RlZmluZSBfX2FybTY0X3N5c19tdW5sb2NrCQlfX2FybTY0
X3N5c19hcm02NF9tdW5sb2NrCisjZGVmaW5lIF9fYXJtNjRfc3lzX21wcm90ZWN0CQlfX2FybTY0
X3N5c19hcm02NF9tcHJvdGVjdAorI2RlZmluZSBfX2FybTY0X3N5c19tc3luYwkJX19hcm02NF9z
eXNfYXJtNjRfbXN5bmMKKyNkZWZpbmUgX19hcm02NF9zeXNfbWluY29yZQkJX19hcm02NF9zeXNf
YXJtNjRfbWluY29yZQorI2RlZmluZSBfX2FybTY0X3N5c19yZW1hcF9maWxlX3BhZ2VzCV9fYXJt
NjRfc3lzX2FybTY0X3JlbWFwX2ZpbGVfcGFnZXMKKyNkZWZpbmUgX19hcm02NF9zeXNfc2htYXQJ
CV9fYXJtNjRfc3lzX2FybTY0X3NobWF0CisjZGVmaW5lIF9fYXJtNjRfc3lzX3NobWR0CQlfX2Fy
bTY0X3N5c19hcm02NF9zaG1kdAogCiBhc21saW5rYWdlIGxvbmcgc3lzX25pX3N5c2NhbGwoY29u
c3Qgc3RydWN0IHB0X3JlZ3MgKik7CiAjZGVmaW5lIF9fYXJtNjRfc3lzX25pX3N5c2NhbGwJc3lz
X25pX3N5c2NhbGwKCi0tIApDYXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
