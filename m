Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B84A42738
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520A889664;
	Wed, 12 Jun 2019 13:12:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D443489320
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:43:40 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id x10so1660299qti.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 04:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=pF1pY6g9sgHe6SSJdZReBxN/hHHz/1mBqQ4jLohhQOE=;
 b=rbUkldn6oIHiXkDe6ZEorfW09BoDTiQpe07FNjZmIB+XV4PbpZ1l0WauW9dhQdb9XN
 ZT6hpSlY2Y3EEzPGkinsgj0SWoWEPo5dUemgJEpmFufhyEa4p/V3W7W4e2YkvnBM/6YA
 meEKznptYwTB8n4fe56NwCGG4A/cC8StYadYFEFB22rttMzY1cYH4kzyrTRemTHbA49m
 qVMzoiHOO5BiOITYkuW9sCwHwZzQXjOlKMeMcyjnSryGeC6bwAljl6FQNVX+sHwTYbZM
 MbIylUbvgVhrRnlws2R7DdXe8Id6GmE27lrDssUj+jzjWnYVTk0Cjz41vGlMAohpoSoA
 AvbA==
X-Gm-Message-State: APjAAAWoZ8BtAhVRwxOv+MCR2Tp1kgGZl83GRIcnzWGwJsgTNiAmlZGI
 VKepBTq3eBVwZKfbvh0Nz1bKZ/CKqimaZcTz
X-Google-Smtp-Source: APXvYqwDKTUvtDmA6SMmQkKz65W969SZufp61k02G9fCL+2/fp67qf94d2M1YkNH+hXtOrCQMRSpsi3TuTa5t/Fk
X-Received: by 2002:a37:6b42:: with SMTP id g63mr50597391qkc.80.1560339819968; 
 Wed, 12 Jun 2019 04:43:39 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:18 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <9ed583c1a3acf014987e3aef12249506c1c69146.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 01/15] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Wed, 12 Jun 2019 13:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=pF1pY6g9sgHe6SSJdZReBxN/hHHz/1mBqQ4jLohhQOE=;
 b=iMRCrqRsfaLBvoWwOfr75mSJ/VPfvlbAFbDtrOANqSuL+z1aGCJpTI0vsQBJ49zvkV
 9E9fBJ+sa0296EIJ5umEi+BHGLGKU1WldUfLsc5lzjtqovn6xo5wnnj4Lmb0O9PgfLXm
 rcwLyJjNEekU9EtCutlVconxtA95VHk5TlDWuAVOA+JWDgv52TV4yWWRYEX7ZgqRnURM
 Eul1F8JBswSLtsZ6lUMRapd1H2weXhkqX5JahODOopa1MhAlxblNV2Op319cxPCbAAUf
 9L64VhEstL8JTyQhso+M/6lNjrHhHWa2qS+F7je7+fvMkiPQ8oGbPBPAqN2Cie9HgxaI
 uOrg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Khalid Aziz <khalid.aziz@oracle.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
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

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgpjb3B5X2Zyb21fdXNlciAoYW5kIGEgZmV3IG90aGVyIHNpbWlsYXIgZnVuY3Rp
b25zKSBhcmUgdXNlZCB0byBjb3B5IGRhdGEKZnJvbSB1c2VyIG1lbW9yeSBpbnRvIHRoZSBrZXJu
ZWwgbWVtb3J5IG9yIHZpY2UgdmVyc2EuIFNpbmNlIGEgdXNlciBjYW4KcHJvdmlkZWQgYSB0YWdn
ZWQgcG9pbnRlciB0byBvbmUgb2YgdGhlIHN5c2NhbGxzIHRoYXQgdXNlIGNvcHlfZnJvbV91c2Vy
LAp3ZSBuZWVkIHRvIGNvcnJlY3RseSBoYW5kbGUgc3VjaCBwb2ludGVycy4KCkRvIHRoaXMgYnkg
dW50YWdnaW5nIHVzZXIgcG9pbnRlcnMgaW4gYWNjZXNzX29rIGFuZCBpbiBfX3VhY2Nlc3NfbWFz
a19wdHIsCmJlZm9yZSBwZXJmb3JtaW5nIGFjY2VzcyB2YWxpZGl0eSBjaGVja3MuCgpOb3RlLCB0
aGF0IHRoaXMgcGF0Y2ggb25seSB0ZW1wb3JhcmlseSB1bnRhZ3MgdGhlIHBvaW50ZXJzIHRvIHBl
cmZvcm0gdGhlCmNoZWNrcywgYnV0IHRoZW4gcGFzc2VzIHRoZW0gYXMgaXMgaW50byB0aGUga2Vy
bmVsIGludGVybmFscy4KClJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KUmV2aWV3ZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5j
b20+ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNv
bT4KLS0tCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDEwICsrKysrKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmggYi9hcmNoL2FybTY0L2luY2x1
ZGUvYXNtL3VhY2Nlc3MuaAppbmRleCBlNWQ1ZjMxYzZkMzYuLmRmNzI5YWZjYTBiYSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKKysrIGIvYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS91YWNjZXNzLmgKQEAgLTczLDYgKzczLDggQEAgc3RhdGljIGlubGluZSB1bnNp
Z25lZCBsb25nIF9fcmFuZ2Vfb2soY29uc3Qgdm9pZCBfX3VzZXIgKmFkZHIsIHVuc2lnbmVkIGxv
bmcgc2kKIHsKIAl1bnNpZ25lZCBsb25nIHJldCwgbGltaXQgPSBjdXJyZW50X3RocmVhZF9pbmZv
KCktPmFkZHJfbGltaXQ7CiAKKwlhZGRyID0gdW50YWdnZWRfYWRkcihhZGRyKTsKKwogCV9fY2hr
X3VzZXJfcHRyKGFkZHIpOwogCWFzbSB2b2xhdGlsZSgKIAkvLyBBICsgQiA8PSBDICsgMSBmb3Ig
YWxsIEEsQixDLCBpbiBmb3VyIGVhc3kgc3RlcHM6CkBAIC0yMjYsNyArMjI4LDggQEAgc3RhdGlj
IGlubGluZSB2b2lkIHVhY2Nlc3NfZW5hYmxlX25vdF91YW8odm9pZCkKIAogLyoKICAqIFNhbml0
aXNlIGEgdWFjY2VzcyBwb2ludGVyIHN1Y2ggdGhhdCBpdCBiZWNvbWVzIE5VTEwgaWYgYWJvdmUg
dGhlCi0gKiBjdXJyZW50IGFkZHJfbGltaXQuCisgKiBjdXJyZW50IGFkZHJfbGltaXQuIEluIGNh
c2UgdGhlIHBvaW50ZXIgaXMgdGFnZ2VkIChoYXMgdGhlIHRvcCBieXRlIHNldCksCisgKiB1bnRh
ZyB0aGUgcG9pbnRlciBiZWZvcmUgY2hlY2tpbmcuCiAgKi8KICNkZWZpbmUgdWFjY2Vzc19tYXNr
X3B0cihwdHIpIChfX3R5cGVvZl9fKHB0cikpX191YWNjZXNzX21hc2tfcHRyKHB0cikKIHN0YXRp
YyBpbmxpbmUgdm9pZCBfX3VzZXIgKl9fdWFjY2Vzc19tYXNrX3B0cihjb25zdCB2b2lkIF9fdXNl
ciAqcHRyKQpAQCAtMjM0LDEwICsyMzcsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fdXNlciAq
X191YWNjZXNzX21hc2tfcHRyKGNvbnN0IHZvaWQgX191c2VyICpwdHIpCiAJdm9pZCBfX3VzZXIg
KnNhZmVfcHRyOwogCiAJYXNtIHZvbGF0aWxlKAotCSIJYmljcwl4enIsICUxLCAlMlxuIgorCSIJ
Ymljcwl4enIsICUzLCAlMlxuIgogCSIJY3NlbAklMCwgJTEsIHh6ciwgZXFcbiIKIAk6ICI9JnIi
IChzYWZlX3B0cikKLQk6ICJyIiAocHRyKSwgInIiIChjdXJyZW50X3RocmVhZF9pbmZvKCktPmFk
ZHJfbGltaXQpCisJOiAiciIgKHB0ciksICJyIiAoY3VycmVudF90aHJlYWRfaW5mbygpLT5hZGRy
X2xpbWl0KSwKKwkgICJyIiAodW50YWdnZWRfYWRkcihwdHIpKQogCTogImNjIik7CiAKIAljc2Ri
KCk7Ci0tIAoyLjIyLjAucmMyLjM4My5nZjRmYmJmMzBjMi1nb29nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
