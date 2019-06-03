Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8BB33E54
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 07:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D43894B7;
	Tue,  4 Jun 2019 05:23:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD7589258
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 16:56:13 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id l185so980236qkd.14
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Jun 2019 09:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=i5cRHHCicMsppSSBbFWeJPgqhQ8FMrYjuCKfr4hxLgs=;
 b=IQCBbng5yyHzPG/Az1LjYyGkjVH0MP82wuTiSuvOfy+gU9lnqaanA7EtCVvDip2D10
 YzSVwzIhnW+BJ/zlOoAHeIaaQ+8NIQEFVNzJibAv9l0ubou3OBC2uhMduVy4wuQ5YCNr
 MbQwBxFKUlsAN17Yn02OV+nyIQbws238F5TjY+HhGFF+2cC80C5bJMrzipAtA06fdx+W
 wmMFWa32espvzCUFlkmHniBclCoD4E5Hg3gSp9t2hR1Oz+nOU+EsMPRklZt4u/1Zslkt
 vGRVgd5klknHe3e8z66YxmCPLkuKEnBP8J6oUi2cF6/ESOKrIm4+JAaYjQLH+zaLjxVo
 vFvw==
X-Gm-Message-State: APjAAAWkjE8EX0mamJHgKptWfrRbet14gGTvFwfd2OvtSLM1aO1F20lF
 jazBG2/8YGAZXmuuatR172H0Uw5Men1gmJB8
X-Google-Smtp-Source: APXvYqxlndJ8+4ezg3WqxZgwPuj7croHV+8pOSI6UJilulRqZobP0HRc/RuNHVT76apRYIt7gunvINxeeY21hcHq
X-Received: by 2002:ac8:2817:: with SMTP id 23mr23534732qtq.174.1559580972876; 
 Mon, 03 Jun 2019 09:56:12 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:17 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <c529e1eeea7700beff197c4456da6a882ce2efb7.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 15/16] vfio/type1,
 arm64: untag user pointers in vaddr_get_pfn
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 04 Jun 2019 05:23:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=i5cRHHCicMsppSSBbFWeJPgqhQ8FMrYjuCKfr4hxLgs=;
 b=sT3L0ZTGkrRVM9BsAKw3Is1YEd5yvotnvZZfNxBe7skB1Imy3yNX3RzPcWZ3L4hBJj
 Ir4PWq35E8DDBUgoDYzLkuASMa2VdGiH7s1U8yAi9EYUyTsOvvYIL5k/dOIxx+s0hJjp
 ivARA7eJCU7WpCZIyl+ggUCauMPneV4kiO9mITdC3bmCRoqBY9+znI9pjppaD8UIqueE
 q8SkWjwj6UsZy3S43cNZjsMLUMGx3YCtYO4jYJeCvlUuA0j/KAAmJ8e05Wl5fyvRzmAY
 H4Wc9GjlHrhbudDD44rVO5eJTf6U73Fu89LC7maXdjap9rfTt5/4PxbL/ZJXa8oMOVpN
 Mbbw==
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
cmd1bWVudHMuCgp2YWRkcl9nZXRfcGZuKCkgdXNlcyBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZv
ciB2bWEgbG9va3Vwcywgd2hpY2ggY2FuCm9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50
ZXJzLgoKVW50YWcgdXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1i
eTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGRyaXZlcnMv
dmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyBiL2Ry
aXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKaW5kZXggM2RkYzM3NWU3MDYzLi41MjhlMzlh
MWMyZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKKysrIGIv
ZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwpAQCAtMzg0LDYgKzM4NCw4IEBAIHN0YXRp
YyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2
YWRkciwKIAogCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsKIAorCXZhZGRyID0gdW50YWdnZWRf
YWRkcih2YWRkcik7CisKIAl2bWEgPSBmaW5kX3ZtYV9pbnRlcnNlY3Rpb24obW0sIHZhZGRyLCB2
YWRkciArIDEpOwogCiAJaWYgKHZtYSAmJiB2bWEtPnZtX2ZsYWdzICYgVk1fUEZOTUFQKSB7Ci0t
IAoyLjIyLjAucmMxLjMxMS5nNWQ3NTczYTE1MS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
