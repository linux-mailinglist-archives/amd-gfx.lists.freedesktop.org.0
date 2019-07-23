Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC6E71EC4
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDDE89F43;
	Tue, 23 Jul 2019 18:11:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4474D6E32A
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:59:23 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id m198so37004938qke.22
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4Wn1GFyfxt3NCYf4PGNTFvqYM1MN1tNvgEFxNqktnk8=;
 b=mEypre//1oGXW9SkHSWN1+4rloXXgPTGbcCEmdpAkUugHwOu3b9lN+8TH6Wdgt21Nq
 bqHR08znkopVK/zfc5/wDyvyOxYHhfRv89DZv1qjS8xLVt0v1nmjuznbzR3LsMMhNT9T
 5pFqg4mx+sSF60UJu60nCi1v0JPdFkbJgQzBGTGoZmG/UYBk7yJYna83fdVC+Sq8e56/
 DiXycd4gAcnPRBtRXFgT5r9jeETkLE/j7QIMc/HuB335+4mfQL3L4i/9j7992+WtZq1s
 nJqy8PAWfi4EKZPXzJKZBS/HRm/kb3IvwUu8vodrSlaGSSA8pzVtslEXh3qfR8YV3GDU
 bpRg==
X-Gm-Message-State: APjAAAVPb4e88AGn1iXORPh7iqBHGdLMdhp0jYzaEJsm/IZR4kATNvIx
 nW0+BtbrwGTqPIp1iDn1KD0JmmvXxEn09xDa
X-Google-Smtp-Source: APXvYqy0Hkccu8SUSwSAcf0RwepBseg9rSnBcrNaRpXVNhE8d6jRb6uSi4vWmbN3MkxTqVVfEdk8tSl4b+EbX0xe
X-Received: by 2002:a37:4f47:: with SMTP id d68mr50765232qkb.104.1563904762211; 
 Tue, 23 Jul 2019 10:59:22 -0700 (PDT)
Date: Tue, 23 Jul 2019 19:58:42 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <4731bddba3c938658c10ff4ed55cc01c60f4c8f8.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 05/15] mm: untag user pointers in mm/gup.c
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
 bh=4Wn1GFyfxt3NCYf4PGNTFvqYM1MN1tNvgEFxNqktnk8=;
 b=XwZfpnbXFN1ibF12kJh4UX27GKqgHpAYVMgncvRg2XMsGuyHBAM2BbcbV2FMLG6KI2
 Eail8AtVvVEkdWyRNAKDAPdYJBEXOQRcSGAF4Z+pO2ORJP6spfMGKAIf7M0K0GlZ5J+x
 8yVEMOwDv+oyp2b+30vvjnV2SNVEvVcKU1T+4yjg+W1ok7J01teWzQ68jS7jmU8ro/kC
 Oxn9FlCYKBVtK3Jwi5MWr/zhUNuljezL1OPreJbqbiZZtnxrZ1CQ3LvL2shMV2iJ2vVT
 olnzEJp2mTvJs0fngbdCdc/sbDwJUI9/28M468SMn/xpTOjrRZ2LIWF7gDkmDS+GMcl9
 Q1sg==
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
NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwppbmRleCA5
OGYxM2FiMzdiYWMuLjFjMWM5N2VjNjNkZiAxMDA2NDQKLS0tIGEvbW0vZ3VwLmMKKysrIGIvbW0v
Z3VwLmMKQEAgLTc5OSw2ICs3OTksOCBAQCBzdGF0aWMgbG9uZyBfX2dldF91c2VyX3BhZ2VzKHN0
cnVjdCB0YXNrX3N0cnVjdCAqdHNrLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAlpZiAoIW5yX3Bh
Z2VzKQogCQlyZXR1cm4gMDsKIAorCXN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7CisKIAlW
TV9CVUdfT04oISFwYWdlcyAhPSAhIShndXBfZmxhZ3MgJiBGT0xMX0dFVCkpOwogCiAJLyoKQEAg
LTk2MSw2ICs5NjMsOCBAQCBpbnQgZml4dXBfdXNlcl9mYXVsdChzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnRzaywgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7
CiAJdm1fZmF1bHRfdCByZXQsIG1ham9yID0gMDsKIAorCWFkZHJlc3MgPSB1bnRhZ2dlZF9hZGRy
KGFkZHJlc3MpOworCiAJaWYgKHVubG9ja2VkKQogCQlmYXVsdF9mbGFncyB8PSBGQVVMVF9GTEFH
X0FMTE9XX1JFVFJZOwogCi0tIAoyLjIyLjAuNzA5LmcxMDIzMDIxNDdiLWdvb2cKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
