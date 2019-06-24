Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AF550E86
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 16:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4309B89BD5;
	Mon, 24 Jun 2019 14:36:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD22389B66
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:20 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id q13so6498621vke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 07:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=WdcdmcPYcZL0TsO1VpqXvB5XTsCD4Aa27drvhQYmelM=;
 b=jTEuQ3riETPHFK/o6shuRgqIS+cw6PiieDgINEmH+DOeDYtl4lPFBTXvekc7CryYWE
 a/3f+j7RdwcjNQ6NPXIslJr6smi6wv3wOxxHp2w99tNJcM4Lvb5actC7CLMAhBC8usWv
 fXcnflqAPJB3g0SugVE1zXqTCc3TI/kd8b0xva8ZTKWjJYVgisezL4uDDA9FYJJxegip
 Zx22ZWX77ZAF4SNCArhcJXC8NyuUzFqG3f9Res1dM68N4/OgTVPdOPuJGkKCZZBUDJ1J
 XErU81YJPnb107f94YeXYPTQF2Fmn/QPohTl5IWhlmijEvp4ii+bs8cXGxFuhyeTFWd9
 UOCw==
X-Gm-Message-State: APjAAAWwo2rGRhAJywQEakAd3hAdf7hCj/bcGilERgwX9ZQ0ias6ukQ0
 HW9tENXI7qy0itdBIz+RrBxpRvcNsALW9J/T
X-Google-Smtp-Source: APXvYqyeP684NrNNIM3KhbFTQXwcDTrmwl6IHcjELxzf0coSdSlRrTjZ+0PmPJg+BCNxcMTgBBiBdQWJwdq50pfN
X-Received: by 2002:a1f:ccc4:: with SMTP id c187mr4784377vkg.56.1561386799794; 
 Mon, 24 Jun 2019 07:33:19 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:32:50 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <3f5c63a871c652369d3cf7741499d1d65413641c.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 05/15] mm: untag user pointers in mm/gup.c
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Mon, 24 Jun 2019 14:36:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=WdcdmcPYcZL0TsO1VpqXvB5XTsCD4Aa27drvhQYmelM=;
 b=icIOyvO3zCCmb1V8FS7xfJSkpaqM0fPXCTMb8P53l/4sddyw376GFk7VntBpgH40Jb
 dlVT0eEdK1fq5jmQgL2mnnKbFXpBzrZuKvOPspNemignJXsBOcwCLAzIsieht3b/IonX
 6zR53XzWDMowl976raMoG4ND2r1RJIjiKAB3ytw9JQwx/injyU+afKGG9i0hRkWS9CDw
 EATvoJg1LGBCFewFDqj3C9titqpFuwNcjn3ZH++ykTRmRXVgWgXvHOfj+CupsqyAB/Yo
 cDDXvnZegW7qBTu946VpVm0cbCpkrGmZnjcy3KK2CuBZhA9rQZ6St5/hoz/kt5af2Epi
 DXZw==
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

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGtlcm5lbCBBQkkg
dG8gYWxsb3cgdG8gcGFzcwp0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUg
c2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyIHRoYW4KMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVu
dHMuCgptbS9ndXAuYyBwcm92aWRlcyBhIGtlcm5lbCBpbnRlcmZhY2UgdGhhdCBhY2NlcHRzIHVz
ZXIgYWRkcmVzc2VzIGFuZAptYW5pcHVsYXRlcyB1c2VyIHBhZ2VzIGRpcmVjdGx5IChmb3IgZXhh
bXBsZSBnZXRfdXNlcl9wYWdlcywgdGhhdCBpcyB1c2VkCmJ5IHRoZSBmdXRleCBzeXNjYWxsKS4g
U2luY2UgYSB1c2VyIGNhbiBwcm92aWRlZCB0YWdnZWQgYWRkcmVzc2VzLCB3ZSBuZWVkCnRvIGhh
bmRsZSB0aGlzIGNhc2UuCgpBZGQgdW50YWdnaW5nIHRvIGd1cC5jIGZ1bmN0aW9ucyB0aGF0IHVz
ZSB1c2VyIGFkZHJlc3NlcyBmb3Igdm1hIGxvb2t1cHMuCgpSZXZpZXdlZC1ieTogS2hhbGlkIEF6
aXogPGtoYWxpZC5heml6QG9yYWNsZS5jb20+ClJldmlld2VkLWJ5OiBWaW5jZW56byBGcmFzY2lu
byA8dmluY2Vuem8uZnJhc2Npbm9AYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vl
c2Nvb2tAY2hyb21pdW0ub3JnPgpSZXZpZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGlu
Lm1hcmluYXNAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5
a252bEBnb29nbGUuY29tPgotLS0KIG1tL2d1cC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwppbmRleCBk
ZGRlMDk3Y2Y5ZTQuLmMzN2RmM2Q0NTVhMiAxMDA2NDQKLS0tIGEvbW0vZ3VwLmMKKysrIGIvbW0v
Z3VwLmMKQEAgLTgwMiw2ICs4MDIsOCBAQCBzdGF0aWMgbG9uZyBfX2dldF91c2VyX3BhZ2VzKHN0
cnVjdCB0YXNrX3N0cnVjdCAqdHNrLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAlpZiAoIW5yX3Bh
Z2VzKQogCQlyZXR1cm4gMDsKIAorCXN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7CisKIAlW
TV9CVUdfT04oISFwYWdlcyAhPSAhIShndXBfZmxhZ3MgJiBGT0xMX0dFVCkpOwogCiAJLyoKQEAg
LTk2NCw2ICs5NjYsOCBAQCBpbnQgZml4dXBfdXNlcl9mYXVsdChzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnRzaywgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7
CiAJdm1fZmF1bHRfdCByZXQsIG1ham9yID0gMDsKIAorCWFkZHJlc3MgPSB1bnRhZ2dlZF9hZGRy
KGFkZHJlc3MpOworCiAJaWYgKHVubG9ja2VkKQogCQlmYXVsdF9mbGFncyB8PSBGQVVMVF9GTEFH
X0FMTE9XX1JFVFJZOwogCi0tIAoyLjIyLjAuNDEwLmdkOGZkYmUyMWI1LWdvb2cKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
