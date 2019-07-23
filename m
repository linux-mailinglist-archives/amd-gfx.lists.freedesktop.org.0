Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1051B71ECB
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E53C6E331;
	Tue, 23 Jul 2019 18:11:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88446E329
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:59:29 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id n190so37138158qkd.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=SnCe+Mtnf/4IPVX5vctz2kNHbLvxo+cXn+T1BQBMjSY=;
 b=OWjgug3j6nxa7StcBEiHR9GlIhGTNf0Tf6asONdMSb4mHf7UFPR5E3NofadKNq5HGL
 HNswp5jzy09mq6Pe4u5I4HvLY6VDyMM66e1fCgQ8ycYSZf+Gq7X8Fcp5ejuWqTPHxpzH
 cK3nbrrrGVXZEc0oubMkWz9U+QkK8JzH01hKwPFew+xLb0DjyNKnnBcM4gltUOvFYClc
 E234sglln635+56YhHHxmj7RqRrMupH/BZUjd0pg75cJEYHJ69K4szbdZ+f//Y8vbRVd
 EkaGJxM68qeqCVvbnVbC8EiTJqvqu/yJoemNUHLig29r8FrnZpWZFwyIgckN0c4kpayW
 Rbhw==
X-Gm-Message-State: APjAAAUl+uPTnuL/e53I08Klj69aQmZ6eGj3g+VYu1xed0wFc/J6fbCM
 q03beSydOxI/wMDoCYtEI4OAITT4DTgHHURU
X-Google-Smtp-Source: APXvYqysiVBCmSbfWLll2amFKEEXBGqGWfbcKcVshytrTMG9pLoartROQI2FKjRVOxEkpepSHwC8IxHzKKAn6one
X-Received: by 2002:ac8:66ce:: with SMTP id m14mr12433817qtp.206.1563904768802; 
 Tue, 23 Jul 2019 10:59:28 -0700 (PDT)
Date: Tue, 23 Jul 2019 19:58:44 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <1de225e4a54204bfd7f25dac2635e31aa4aa1d90.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 07/15] fs/namespace: untag user pointers in
 copy_mount_options
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
 bh=SnCe+Mtnf/4IPVX5vctz2kNHbLvxo+cXn+T1BQBMjSY=;
 b=H4TiQUgRdi4EHpYB8nTtg37yn9l3JyAu6VKcW2CQCTgny+vzJbtQEYhMy5VYJWq/CI
 KrIVgxdlW5aj4Az2DGaszv74HRn6o+lrlFDsTrBfmff9rY/9V5Ds2Mgw7VHb0yVnzniX
 zHDvZt7zGQFLcaS9bQ85+7iz8VxXg9au1eNOrVwptdD22wpczsG2wyPaMM6iHM1fn6oB
 qEapo2f+2AfPvvpteYPs6gKu7O45lNfI0gMeElG1uz04IPRB0pwyBE+bIPD+sqfvkwBv
 pd2Qci5+NW7JO2WHQGIVKZzYhqd9oRhn7n0TTqLXoH+DCmlggKEuaPlzaJC7NBCKpdOt
 X82Q==
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
dHMuCgpJbiBjb3B5X21vdW50X29wdGlvbnMgYSB1c2VyIGFkZHJlc3MgaXMgYmVpbmcgc3VidHJh
Y3RlZCBmcm9tIFRBU0tfU0laRS4KSWYgdGhlIGFkZHJlc3MgaXMgbG93ZXIgdGhhbiBUQVNLX1NJ
WkUsIHRoZSBzaXplIGlzIGNhbGN1bGF0ZWQgdG8gbm90CmFsbG93IHRoZSBleGFjdF9jb3B5X2Zy
b21fdXNlcigpIGNhbGwgdG8gY3Jvc3MgVEFTS19TSVpFIGJvdW5kYXJ5LgpIb3dldmVyIGlmIHRo
ZSBhZGRyZXNzIGlzIHRhZ2dlZCwgdGhlbiB0aGUgc2l6ZSB3aWxsIGJlIGNhbGN1bGF0ZWQKaW5j
b3JyZWN0bHkuCgpVbnRhZyB0aGUgYWRkcmVzcyBiZWZvcmUgc3VidHJhY3RpbmcuCgpSZXZpZXdl
ZC1ieTogS2hhbGlkIEF6aXogPGtoYWxpZC5heml6QG9yYWNsZS5jb20+ClJldmlld2VkLWJ5OiBW
aW5jZW56byBGcmFzY2lubyA8dmluY2Vuem8uZnJhc2Npbm9AYXJtLmNvbT4KUmV2aWV3ZWQtYnk6
IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpSZXZpZXdlZC1ieTogQ2F0YWxpbiBN
YXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtv
bm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGZzL25hbWVzcGFjZS5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZnMvbmFtZXNwYWNlLmMgYi9mcy9uYW1lc3BhY2UuYwppbmRleCA2NDY0ZWE0YWNiYTku
LmIzMmViMjZhZjhiZiAxMDA2NDQKLS0tIGEvZnMvbmFtZXNwYWNlLmMKKysrIGIvZnMvbmFtZXNw
YWNlLmMKQEAgLTI5OTQsNyArMjk5NCw3IEBAIHZvaWQgKmNvcHlfbW91bnRfb3B0aW9ucyhjb25z
dCB2b2lkIF9fdXNlciAqIGRhdGEpCiAJICogdGhlIHJlbWFpbmRlciBvZiB0aGUgcGFnZS4KIAkg
Ki8KIAkvKiBjb3B5X2Zyb21fdXNlciBjYW5ub3QgY3Jvc3MgVEFTS19TSVpFICEgKi8KLQlzaXpl
ID0gVEFTS19TSVpFIC0gKHVuc2lnbmVkIGxvbmcpZGF0YTsKKwlzaXplID0gVEFTS19TSVpFIC0g
KHVuc2lnbmVkIGxvbmcpdW50YWdnZWRfYWRkcihkYXRhKTsKIAlpZiAoc2l6ZSA+IFBBR0VfU0la
RSkKIAkJc2l6ZSA9IFBBR0VfU0laRTsKIAotLSAKMi4yMi4wLjcwOS5nMTAyMzAyMTQ3Yi1nb29n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
