Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8531528E
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 19:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EF689A88;
	Mon,  6 May 2019 17:19:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe49.google.com (mail-vs1-xe49.google.com
 [IPv6:2607:f8b0:4864:20::e49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C3389A61
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 16:31:26 +0000 (UTC)
Received: by mail-vs1-xe49.google.com with SMTP id g67so2691362vsd.18
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 09:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ngD1QIqwofb3Y9K5MW1PYIryx3q7PiTEQfc6RhUnaA4=;
 b=EzlJqVspISDpQoMmo2EbkZXykN8EeHKFDDPqoLkMLrrdxgLp08omGSVubC0AqRh+dJ
 HlnVKZexRWGjwPUiPUvasIQ4NRKjV/LUK00jLNKfYd617crgPF3aO9D+/R3PKVO5n9fg
 HOASWK91C7HYYGgcySHusURqkuLbaqwp+uFolzXnxWxMTy5RnUY+vAASVrZ4+ncEvDgi
 th8Em4+wWXe+03Qto2xTSz6siSefX5gJBP+SII2Ma0sjMfceH8QU+cZjbchyP7VNdWqa
 mVGqlTbhFCzHGZXPiqmDAioEcln9Y8Y3gtvZEXL99bzJWmWqc3GofHpecTWEu9tu6lTu
 tLAQ==
X-Gm-Message-State: APjAAAXmLB89L1awsjlspQr2o+c5kt8weunw2tcfM5KG9cObn5wQTOyT
 ZyILbsP9B0xC74zU7UpP6epzO54LwdX7rDM3
X-Google-Smtp-Source: APXvYqwpCSWnm5qxXyuaWGAqRu95+6gB9zDmbHbxq+0Vb45FEs/ziN6+T3PbyTnxcvdIphfk21MnSe6Qp4R1y+WG
X-Received: by 2002:a1f:b45:: with SMTP id 66mr13881567vkl.38.1557160285529;
 Mon, 06 May 2019 09:31:25 -0700 (PDT)
Date: Mon,  6 May 2019 18:30:52 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <474b3c113edae1f2fa679dc7237ec070ff4efb70.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 06/17] mm: untag user pointers in do_pages_move
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Mon, 06 May 2019 17:19:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=ngD1QIqwofb3Y9K5MW1PYIryx3q7PiTEQfc6RhUnaA4=;
 b=MxkQGAhZKcdMVO3IoBudATPab8TcsjZXX55HRiAN6IeYJiwC1j+iSqld+LLo8qyTyU
 J83cHqvwCOHlnCBK8LZqFG9H1aqF9NgW/OCa1+Ffyx8ZPU7n9taYd+4siYtOtJGSGqfL
 2bs1HGMZCs+84KfkjQ03uml4i8KyBdYF3wjbHGyt6HNd/mpMm+1Qp1No+KcUfeHVzCH2
 4161opexQWrAtxUlTCrivmQSMNxZ99d5aHCBZ5OmsHW7nAo6evlOzv9F19PFlipvMxI4
 C4R/T1FLs15dBoQSeJwhzGqmh+Swz0oYJVhSbKReuunpnwRMPL8ZC0ZS5QHAp3xWLkRd
 Hr1w==
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
 Kostya Serebryany <kcc@google.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>, Lee Smith <Lee.Smith@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
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
LjIxLjAuMTAyMC5nZjI4MjBjZjAxYS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
