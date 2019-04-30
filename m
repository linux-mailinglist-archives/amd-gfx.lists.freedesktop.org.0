Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34452FA57
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 15:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C097891DD;
	Tue, 30 Apr 2019 13:29:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe4a.google.com (mail-vs1-xe4a.google.com
 [IPv6:2607:f8b0:4864:20::e4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098E9891D9
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 13:25:37 +0000 (UTC)
Received: by mail-vs1-xe4a.google.com with SMTP id v6so2351087vsl.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 06:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=CVV6psz/Vns5azsm7jZt0BKocrzPfr2CsD5f51mITmQ=;
 b=UlRu8ACZfcTCLWYMjyB2JQHo5yayOSfMFpR+3WJdalbo7raYeaWxQ+4Ju/ABvA0DhM
 yWhCGEPD/Me9Z92PE/cAHjkiDQ6M2AtHd7Ya1EsUs8gvNUDDz8nGnaOcBuI6Z/YJQS6T
 OVYeX2OAnTACXSdnyrm+AYZd+z/Tj5UDXFUEy0dwF++28SuFlOWvmFSS1/ircjjd/8NP
 Zd9o32ogyMADRfdsq6gX6Hyz0pRhgHkYKxzPfIOGSelyW+woxyN/OquniIgz/LV8v8td
 1FRwBptZj00yY0AAOAVsJhQ8lpSQwmmUy0AOQth63t3yb4zPyE9Dz2y7jtYqQ5oFWqj9
 PJgQ==
X-Gm-Message-State: APjAAAXjdKiUSAoLCQUjE/BcX1WU+ZMfOFIbX/03tuHDgWJMFXJx1s2M
 2/59PMlAmtOyzsDlDfDamcvveWCBnaW/CkQU
X-Google-Smtp-Source: APXvYqxbH0hW8IUGPJRsH+MKg4I9yJOI2DrUXBayHbDSUEVQsqLwVaAkxsd+/0KcP5RvItcIqz2adgVjyHXkB8kF
X-Received: by 2002:a67:dd01:: with SMTP id y1mr18718014vsj.39.1556630736057; 
 Tue, 30 Apr 2019 06:25:36 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:25:02 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <80f7d6a2f68adb1c41ef5baf8973537380c681b0.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 06/17] mm: untag user pointers in do_pages_move
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 30 Apr 2019 13:29:06 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=CVV6psz/Vns5azsm7jZt0BKocrzPfr2CsD5f51mITmQ=;
 b=pHAUFUPIK00HUvs8fYzbfMDhOtYuRZOYj18jl6SUOemiz8hMuVoEwpyBcBFZsdPfRy
 CP69mD/DWkxSBrhRr7+Ao/OQBLtynTBk0B9gn31tW8yWHjU69Q7PB4ZDpgvtdnhUTEzK
 8CbwpHg2uux/P91ru8mr0G2/NpJ+DVwloVARu7ft7n27vA6hkWJDGMY1mugB3YmYuyhT
 OwmXeDxT9woV4yHQlsAA+KWTEq0dG80iCwsoH+0J1dhKu1C33LiknxZR75he7h2J78XE
 ZKdvpYjQpomJrWqZzF9raVXk6z/lSdaqbAYdD0YzglrS0vRmztdJidedrkfiqCqRVd3N
 hnSw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Koenig@google.com,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Chintan Pandya <cpandya@codeaurora.org>,
 Felix <Felix.Kuehling@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Kuehling@google.com, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Deucher@google.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgpkb19wYWdlc19tb3ZlKCkgaXMgdXNlZCBpbiB0aGUgaW1wbGVtZW50YXRpb24g
b2YgdGhlIG1vdmVfcGFnZXMgc3lzY2FsbC4KClVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGhpcyBm
dW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29v
Z2xlLmNvbT4KLS0tCiBtbS9taWdyYXRlLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL21tL21pZ3JhdGUuYyBiL21tL21pZ3JhdGUuYwppbmRleCA2
NjNhNTQ0OTM2N2EuLmMwMTRhMDcxMzVmMCAxMDA2NDQKLS0tIGEvbW0vbWlncmF0ZS5jCisrKyBi
L21tL21pZ3JhdGUuYwpAQCAtMTYxNyw2ICsxNjE3LDcgQEAgc3RhdGljIGludCBkb19wYWdlc19t
b3ZlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBub2RlbWFza190IHRhc2tfbm9kZXMsCiAJCWlmIChn
ZXRfdXNlcihub2RlLCBub2RlcyArIGkpKQogCQkJZ290byBvdXRfZmx1c2g7CiAJCWFkZHIgPSAo
dW5zaWduZWQgbG9uZylwOworCQlhZGRyID0gdW50YWdnZWRfYWRkcihhZGRyKTsKIAogCQllcnIg
PSAtRU5PREVWOwogCQlpZiAobm9kZSA8IDAgfHwgbm9kZSA+PSBNQVhfTlVNTk9ERVMpCi0tIAoy
LjIxLjAuNTkzLmc1MTFlYzM0NWUxOC1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
