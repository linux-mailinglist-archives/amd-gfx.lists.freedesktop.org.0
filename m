Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1156771EC8
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B15A6E32A;
	Tue, 23 Jul 2019 18:11:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB1F6E329
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:59:33 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id c1so37026153qkl.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=mo6ZyD7PJiiiTnkBfnFT33xmRSSjLb2erTRpgEGb4jw=;
 b=Ol4xuyRStZ7x0rbSuNDVfAWbRj3yhyWgNs77L1BhY0X1sq5vsz/2NB1Rdo2X/i3c4v
 XZFoI17zwfc41oOdOslA1ydO2bXBLeMClaUhDmxFKFBY3WqSMLhsQaqulgzWNQGOPKkj
 URtwqHqMTuUU4lhz8Q1FOi2nsuQRmtmf4ph2cv4t6S8GE0OnS7Ofc3DoZrrFMKeXmP4U
 cBu2jHV/ycqXGYb4cmy81X7DjFwD/0e/gLAGWa+7BHn8E6cCH2mpbUkEkHNOTzuFhMyh
 8jRhOHVjWybGae7XpteMjDiTGDT9TyacZx7Pwvb2GUUOqi9bCb7karEy9C9DCbcwe4Xr
 MtTg==
X-Gm-Message-State: APjAAAXvAfd67/iOZ1RZ1Nkx4TjJENIsb1U4dlWvxrvTg2AUBSLrL8wx
 1EPwe2ADSh9oDq0J63dnGd2NSe9WcWa8NV51
X-Google-Smtp-Source: APXvYqwqXUnbT9S2ecddRPfsS72rTxoBtLQXpIQx9JM0kIhhjvtv5eSOcsPLQ4y/4499Xb23XuIGaF+KOaOVjXRR
X-Received: by 2002:a37:47d1:: with SMTP id u200mr49170508qka.21.1563904772061; 
 Tue, 23 Jul 2019 10:59:32 -0700 (PDT)
Date: Tue, 23 Jul 2019 19:58:45 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <cdc59ddd7011012ca2e689bc88c3b65b1ea7e413.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 08/15] userfaultfd: untag user pointers
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:11:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=mo6ZyD7PJiiiTnkBfnFT33xmRSSjLb2erTRpgEGb4jw=;
 b=cRcOEH0iv2407FEeEXiGtfbNaRtJQIzg5XbYICzGVGc43sPOA3+CZIMWAHKgebQ1Fd
 NhXvQ2XcNcF8R9x/znx8/B+ZWBuFc0pppCQj6IxF/91ZQehMjq/FUgtTO1kgaD+sdo+u
 g0fX97ge7Kl52ZUaa6b+4pEh6IxUyFSuMDNJlzhUpxY5RLeNi8LIb5QOqygzH5YcXwTw
 u/vwHZkzfH96V/r4aumfuyQXlNmESoQtl9/gLW/U3oOdnKUbG/Ywu4Xo6BgLwOzrtBVU
 Gf76BaPylfmhv0ijCpRq3ZN2WZ9BE8VMsOdxcjRzxf/93AljoTsAfpUOJtPXkeNJ+1FY
 hU+A==
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
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
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

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGtlcm5lbCBBQkkg
dG8gYWxsb3cgdG8gcGFzcwp0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUg
c2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyIHRoYW4KMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVu
dHMuCgp1c2VyZmF1bHRmZCBjb2RlIHVzZSBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2bWEg
bG9va3Vwcywgd2hpY2ggY2FuCm9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgoK
VW50YWcgdXNlciBwb2ludGVycyBpbiB2YWxpZGF0ZV9yYW5nZSgpLgoKUmV2aWV3ZWQtYnk6IE1p
a2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KUmV2aWV3ZWQtYnk6IFZpbmNlbnpvIEZy
YXNjaW5vIDx2aW5jZW56by5mcmFzY2lub0Bhcm0uY29tPgpSZXZpZXdlZC1ieTogQ2F0YWxpbiBN
YXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8
a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxh
bmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogZnMvdXNlcmZhdWx0ZmQuYyB8IDIyICsrKysrKysr
KysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy91c2VyZmF1bHRmZC5jIGIvZnMvdXNlcmZhdWx0ZmQu
YwppbmRleCBjY2JkYmQ2MmYwZDguLjYyODRhNGU3MTljYiAxMDA2NDQKLS0tIGEvZnMvdXNlcmZh
dWx0ZmQuYworKysgYi9mcy91c2VyZmF1bHRmZC5jCkBAIC0xMjcxLDIxICsxMjcxLDIzIEBAIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB3YWtlX3VzZXJmYXVsdChzdHJ1Y3QgdXNlcmZhdWx0
ZmRfY3R4ICpjdHgsCiB9CiAKIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IHZhbGlkYXRlX3Jh
bmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAotCQkJCQkgIF9fdTY0IHN0YXJ0LCBfX3U2NCBsZW4p
CisJCQkJCSAgX191NjQgKnN0YXJ0LCBfX3U2NCBsZW4pCiB7CiAJX191NjQgdGFza19zaXplID0g
bW0tPnRhc2tfc2l6ZTsKIAotCWlmIChzdGFydCAmIH5QQUdFX01BU0spCisJKnN0YXJ0ID0gdW50
YWdnZWRfYWRkcigqc3RhcnQpOworCisJaWYgKCpzdGFydCAmIH5QQUdFX01BU0spCiAJCXJldHVy
biAtRUlOVkFMOwogCWlmIChsZW4gJiB+UEFHRV9NQVNLKQogCQlyZXR1cm4gLUVJTlZBTDsKIAlp
ZiAoIWxlbikKIAkJcmV0dXJuIC1FSU5WQUw7Ci0JaWYgKHN0YXJ0IDwgbW1hcF9taW5fYWRkcikK
KwlpZiAoKnN0YXJ0IDwgbW1hcF9taW5fYWRkcikKIAkJcmV0dXJuIC1FSU5WQUw7Ci0JaWYgKHN0
YXJ0ID49IHRhc2tfc2l6ZSkKKwlpZiAoKnN0YXJ0ID49IHRhc2tfc2l6ZSkKIAkJcmV0dXJuIC1F
SU5WQUw7Ci0JaWYgKGxlbiA+IHRhc2tfc2l6ZSAtIHN0YXJ0KQorCWlmIChsZW4gPiB0YXNrX3Np
emUgLSAqc3RhcnQpCiAJCXJldHVybiAtRUlOVkFMOwogCXJldHVybiAwOwogfQpAQCAtMTMzNSw3
ICsxMzM3LDcgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF9yZWdpc3RlcihzdHJ1Y3QgdXNlcmZh
dWx0ZmRfY3R4ICpjdHgsCiAJCWdvdG8gb3V0OwogCX0KIAotCXJldCA9IHZhbGlkYXRlX3Jhbmdl
KG1tLCB1ZmZkaW9fcmVnaXN0ZXIucmFuZ2Uuc3RhcnQsCisJcmV0ID0gdmFsaWRhdGVfcmFuZ2Uo
bW0sICZ1ZmZkaW9fcmVnaXN0ZXIucmFuZ2Uuc3RhcnQsCiAJCQkgICAgIHVmZmRpb19yZWdpc3Rl
ci5yYW5nZS5sZW4pOwogCWlmIChyZXQpCiAJCWdvdG8gb3V0OwpAQCAtMTUyNCw3ICsxNTI2LDcg
QEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF91bnJlZ2lzdGVyKHN0cnVjdCB1c2VyZmF1bHRmZF9j
dHggKmN0eCwKIAlpZiAoY29weV9mcm9tX3VzZXIoJnVmZmRpb191bnJlZ2lzdGVyLCBidWYsIHNp
emVvZih1ZmZkaW9fdW5yZWdpc3RlcikpKQogCQlnb3RvIG91dDsKIAotCXJldCA9IHZhbGlkYXRl
X3JhbmdlKG1tLCB1ZmZkaW9fdW5yZWdpc3Rlci5zdGFydCwKKwlyZXQgPSB2YWxpZGF0ZV9yYW5n
ZShtbSwgJnVmZmRpb191bnJlZ2lzdGVyLnN0YXJ0LAogCQkJICAgICB1ZmZkaW9fdW5yZWdpc3Rl
ci5sZW4pOwogCWlmIChyZXQpCiAJCWdvdG8gb3V0OwpAQCAtMTY3NSw3ICsxNjc3LDcgQEAgc3Rh
dGljIGludCB1c2VyZmF1bHRmZF93YWtlKHN0cnVjdCB1c2VyZmF1bHRmZF9jdHggKmN0eCwKIAlp
ZiAoY29weV9mcm9tX3VzZXIoJnVmZmRpb193YWtlLCBidWYsIHNpemVvZih1ZmZkaW9fd2FrZSkp
KQogCQlnb3RvIG91dDsKIAotCXJldCA9IHZhbGlkYXRlX3JhbmdlKGN0eC0+bW0sIHVmZmRpb193
YWtlLnN0YXJ0LCB1ZmZkaW9fd2FrZS5sZW4pOworCXJldCA9IHZhbGlkYXRlX3JhbmdlKGN0eC0+
bW0sICZ1ZmZkaW9fd2FrZS5zdGFydCwgdWZmZGlvX3dha2UubGVuKTsKIAlpZiAocmV0KQogCQln
b3RvIG91dDsKIApAQCAtMTcxNSw3ICsxNzE3LDcgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF9j
b3B5KHN0cnVjdCB1c2VyZmF1bHRmZF9jdHggKmN0eCwKIAkJCSAgIHNpemVvZih1ZmZkaW9fY29w
eSktc2l6ZW9mKF9fczY0KSkpCiAJCWdvdG8gb3V0OwogCi0JcmV0ID0gdmFsaWRhdGVfcmFuZ2Uo
Y3R4LT5tbSwgdWZmZGlvX2NvcHkuZHN0LCB1ZmZkaW9fY29weS5sZW4pOworCXJldCA9IHZhbGlk
YXRlX3JhbmdlKGN0eC0+bW0sICZ1ZmZkaW9fY29weS5kc3QsIHVmZmRpb19jb3B5Lmxlbik7CiAJ
aWYgKHJldCkKIAkJZ290byBvdXQ7CiAJLyoKQEAgLTE3NzEsNyArMTc3Myw3IEBAIHN0YXRpYyBp
bnQgdXNlcmZhdWx0ZmRfemVyb3BhZ2Uoc3RydWN0IHVzZXJmYXVsdGZkX2N0eCAqY3R4LAogCQkJ
ICAgc2l6ZW9mKHVmZmRpb196ZXJvcGFnZSktc2l6ZW9mKF9fczY0KSkpCiAJCWdvdG8gb3V0Owog
Ci0JcmV0ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5tbSwgdWZmZGlvX3plcm9wYWdlLnJhbmdlLnN0
YXJ0LAorCXJldCA9IHZhbGlkYXRlX3JhbmdlKGN0eC0+bW0sICZ1ZmZkaW9femVyb3BhZ2UucmFu
Z2Uuc3RhcnQsCiAJCQkgICAgIHVmZmRpb196ZXJvcGFnZS5yYW5nZS5sZW4pOwogCWlmIChyZXQp
CiAJCWdvdG8gb3V0OwotLSAKMi4yMi4wLjcwOS5nMTAyMzAyMTQ3Yi1nb29nCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
