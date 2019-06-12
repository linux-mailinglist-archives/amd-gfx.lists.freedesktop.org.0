Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D524272C
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723548957D;
	Wed, 12 Jun 2019 13:12:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x24a.google.com (mail-oi1-x24a.google.com
 [IPv6:2607:f8b0:4864:20::24a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40EA8933C
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:43:43 +0000 (UTC)
Received: by mail-oi1-x24a.google.com with SMTP id a198so5313589oii.15
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 04:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=UjHW3gvZNVNgT5aLmmsHnPxo+B7J7BC6tuQvc/RhPNk=;
 b=lUYcUhSz/VJb4V8+I16Usoy1Qe7Z9egnJStMH51Gf9rFDcjL844VoIRaebWg1aW02E
 6zCJ9ftUKtpfUJmU9otACYuF6Mn+Yej4jQfEr4qA5b2D6addDHGwiUkczmFdI7VxGEvi
 rpuA1tatxzugFkLZEv+txk04yDAJ5QjygkVdJO+dHwvO5BKff+AV7Y3fOs1o9dcZodZu
 hsKc+c3ciGwRKEL3R7jcA7pM4uLRPIp3s218sbd+ZD58nz5WV5T17lgWs/PyVOaZ7pNo
 ZhgoxnTqpwEEE9/avBTjFzkS1W60+qlw3xPRLwBz4u5S7K6tdC+P378Xd0SC79maAs9P
 E0aQ==
X-Gm-Message-State: APjAAAXMM6KfylbULJG0skicjkcvjfaf7/l9BIrRjqrl2foq1FqZO/og
 e+EXZ3PFo2lcIetrqbFxa6UmFtUiO6ZZdj0R
X-Google-Smtp-Source: APXvYqwN3f56c3YdzV4vuBZtnTaXMq2rkbV7EZJhl+9vuDir+VdtrZMmSzDSSPuiOLJaxWwDb81r7VAwTgFT1eUN
X-Received: by 2002:a9d:764d:: with SMTP id o13mr6499138otl.298.1560339823090; 
 Wed, 12 Jun 2019 04:43:43 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:19 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <a76c014f9b12a082d31ef1459907cabdab78491e.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 02/15] lib, arm64: untag user pointers in strn*_user
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
 bh=UjHW3gvZNVNgT5aLmmsHnPxo+B7J7BC6tuQvc/RhPNk=;
 b=wWQdCeaEB2u6K2FokoVH57TiuY9+YM+iloWJZ9olfqp0zjmIdmC5f6DPCzUKmsxGdy
 S65EVOJIDT5V4zwCQfqNTJzphOcFWfUmY+gXBOeFncv77kXLYdKYGCkdMxc+OyweaWX0
 0fKTo4iZRRAvEu0L5K9N5O0E1jscX+Pk92PzQ1PknQ2YOc6xMrIj1RN7n/IEUROoLRHK
 DSyTNlm/Sr+vicrs5WJhiUx/1nLhQ5Q4ACjS55YPvH7eOOqFTP/CfYXsftMzptdGowR3
 ikQ6jhRMQBxQ3FPli1xBTZa23yNKdUvKN2sR5HTTLiPeqs1dY61XYlyLOGrjNBMaj6hd
 3iow==
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
cmd1bWVudHMuCgpzdHJuY3B5X2Zyb21fdXNlciBhbmQgc3Rybmxlbl91c2VyIGFjY2VwdCB1c2Vy
IGFkZHJlc3NlcyBhcyBhcmd1bWVudHMsIGFuZApkbyBub3QgZ28gdGhyb3VnaCB0aGUgc2FtZSBw
YXRoIGFzIGNvcHlfZnJvbV91c2VyIGFuZCBvdGhlcnMsIHNvIGhlcmUgd2UKbmVlZCB0byBoYW5k
bGUgdGhlIGNhc2Ugb2YgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIHNlcGFyYXRlbHkuCgpVbnRhZyB1
c2VyIHBvaW50ZXJzIHBhc3NlZCB0byB0aGVzZSBmdW5jdGlvbnMuCgpOb3RlLCB0aGF0IHRoaXMg
cGF0Y2ggb25seSB0ZW1wb3JhcmlseSB1bnRhZ3MgdGhlIHBvaW50ZXJzIHRvIHBlcmZvcm0KdmFs
aWRpdHkgY2hlY2tzLCBidXQgdGhlbiB1c2VzIHRoZW0gYXMgaXMgdG8gcGVyZm9ybSB1c2VyIG1l
bW9yeSBhY2Nlc3Nlcy4KClJldmlld2VkLWJ5OiBLaGFsaWQgQXppeiA8a2hhbGlkLmF6aXpAb3Jh
Y2xlLmNvbT4KQWNrZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpSZXZp
ZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KU2lnbmVk
LW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGxp
Yi9zdHJuY3B5X2Zyb21fdXNlci5jIHwgMyArKy0KIGxpYi9zdHJubGVuX3VzZXIuYyAgICAgIHwg
MyArKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2xpYi9zdHJuY3B5X2Zyb21fdXNlci5jIGIvbGliL3N0cm5jcHlfZnJvbV91
c2VyLmMKaW5kZXggMDIzYmE5ZjNiOTlmLi5kY2NiOTVhZjYwMDMgMTAwNjQ0Ci0tLSBhL2xpYi9z
dHJuY3B5X2Zyb21fdXNlci5jCisrKyBiL2xpYi9zdHJuY3B5X2Zyb21fdXNlci5jCkBAIC02LDYg
KzYsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KICNpbmNsdWRlIDxsaW51eC9rZXJu
ZWwuaD4KICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgorI2luY2x1ZGUgPGxpbnV4L21tLmg+CiAK
ICNpbmNsdWRlIDxhc20vYnl0ZW9yZGVyLmg+CiAjaW5jbHVkZSA8YXNtL3dvcmQtYXQtYS10aW1l
Lmg+CkBAIC0xMDgsNyArMTA5LDcgQEAgbG9uZyBzdHJuY3B5X2Zyb21fdXNlcihjaGFyICpkc3Qs
IGNvbnN0IGNoYXIgX191c2VyICpzcmMsIGxvbmcgY291bnQpCiAJCXJldHVybiAwOwogCiAJbWF4
X2FkZHIgPSB1c2VyX2FkZHJfbWF4KCk7Ci0Jc3JjX2FkZHIgPSAodW5zaWduZWQgbG9uZylzcmM7
CisJc3JjX2FkZHIgPSAodW5zaWduZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKHNyYyk7CiAJaWYgKGxp
a2VseShzcmNfYWRkciA8IG1heF9hZGRyKSkgewogCQl1bnNpZ25lZCBsb25nIG1heCA9IG1heF9h
ZGRyIC0gc3JjX2FkZHI7CiAJCWxvbmcgcmV0dmFsOwpkaWZmIC0tZ2l0IGEvbGliL3N0cm5sZW5f
dXNlci5jIGIvbGliL3N0cm5sZW5fdXNlci5jCmluZGV4IDdmMmRiM2ZlMzExZi4uMjhmZjU1NGEx
YmU4IDEwMDY0NAotLS0gYS9saWIvc3Rybmxlbl91c2VyLmMKKysrIGIvbGliL3N0cm5sZW5fdXNl
ci5jCkBAIC0yLDYgKzIsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUg
PGxpbnV4L2V4cG9ydC5oPgogI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KKyNpbmNsdWRlIDxs
aW51eC9tbS5oPgogCiAjaW5jbHVkZSA8YXNtL3dvcmQtYXQtYS10aW1lLmg+CiAKQEAgLTEwOSw3
ICsxMTAsNyBAQCBsb25nIHN0cm5sZW5fdXNlcihjb25zdCBjaGFyIF9fdXNlciAqc3RyLCBsb25n
IGNvdW50KQogCQlyZXR1cm4gMDsKIAogCW1heF9hZGRyID0gdXNlcl9hZGRyX21heCgpOwotCXNy
Y19hZGRyID0gKHVuc2lnbmVkIGxvbmcpc3RyOworCXNyY19hZGRyID0gKHVuc2lnbmVkIGxvbmcp
dW50YWdnZWRfYWRkcihzdHIpOwogCWlmIChsaWtlbHkoc3JjX2FkZHIgPCBtYXhfYWRkcikpIHsK
IAkJdW5zaWduZWQgbG9uZyBtYXggPSBtYXhfYWRkciAtIHNyY19hZGRyOwogCQlsb25nIHJldHZh
bDsKLS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
