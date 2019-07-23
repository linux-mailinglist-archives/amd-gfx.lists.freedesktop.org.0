Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0179671ED4
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D025D6E32D;
	Tue, 23 Jul 2019 18:11:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe49.google.com (mail-vs1-xe49.google.com
 [IPv6:2607:f8b0:4864:20::e49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF636E32A
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:59:26 +0000 (UTC)
Received: by mail-vs1-xe49.google.com with SMTP id 66so6345287vsp.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/huzVrn6iDinNK3gESNF6fMWuVj1J0a8E8YliY+JUMI=;
 b=nuazvn+eoxBz6w3p2SOjb3QLCB0xlph7uHTbqeyHVWJMaj7ThzrogmqnwM1lbFfADp
 7jtew+++qHcbWqL/pLFQipQ7dpLQGZrE8pJU2Dx6bsYrj3Pr6NHgrhJboWIz0eYUBH7J
 8vXMDtsqgIctFRr+1FN8ZLoLUuADefYGQbZZ1GHhoOH+OxR3I4IFFiFCIr3mswZkmA8d
 UAI1RpLPChAvpmdOzYrihXhSLemfMP67iFquaqTCRv77hZqHZql25PYf1LmGRZO6a55n
 P8GSfM+BwkFqpRANgr7L25ZIWmCjFpgdlNFnshRcHut3JeKmhCME4eArgA9KgfrKLo4v
 eW6g==
X-Gm-Message-State: APjAAAUB0N1sb9Ih/GylCM8mSZguJRHomaSM9SF2r38+1IN9evFpkJiS
 6mIgJXSorCz8dyjYYZT/70Ze9qIF0jCXnCEf
X-Google-Smtp-Source: APXvYqza4RkKEiX9RSMJ4O0WeYRSe7jZPKwJC2E9aqA1oTke3kgtphbjO4en0GBzP/IdlZCHDhS+pYVnwN9x8xEl
X-Received: by 2002:ab0:1c2:: with SMTP id 60mr34283049ual.78.1563904765450;
 Tue, 23 Jul 2019 10:59:25 -0700 (PDT)
Date: Tue, 23 Jul 2019 19:58:43 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <28f05e49c92b2a69c4703323d6c12208f3d881fe.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 06/15] mm: untag user pointers in get_vaddr_frames
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
 bh=/huzVrn6iDinNK3gESNF6fMWuVj1J0a8E8YliY+JUMI=;
 b=Y7zAf+EqSsPzgFlPRtHiU2eaf3uvF3mBfxNqtK2dkyuo3VTBYXjjpviaGnsQe0yYUQ
 RZjdFooS3ZC7uUt58aVI/4cdpsAs60vswb3AsNKQ+PFZtVBvzHw5kY0TqkqeCmyj7riF
 mtQh5FnaNVG9iaAtW+G98/NdplTTfZ9IkSgAzb8usp7NHgKVNq41drkIZNhCHbFrZwbP
 oh8Z0GVIBTZb34XQapQJ/Cc8NMSc6thxgEsgQUYNQcR1lgRqwCY4KcosdJFpWo+DlmgQ
 eRBAMO05IGodFWFysR4D+7FGT50746wIbh4QySN2wsOGOenRi1KIej0OqRFaxZbG5kzF
 UnOg==
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
dHMuCgpnZXRfdmFkZHJfZnJhbWVzIHVzZXMgcHJvdmlkZWQgdXNlciBwb2ludGVycyBmb3Igdm1h
IGxvb2t1cHMsIHdoaWNoIGNhbgpvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4g
SW5zdGVhZCBvZiBsb2NhdGluZyBhbmQgY2hhbmdpbmcKYWxsIGNhbGxlcnMgb2YgdGhpcyBmdW5j
dGlvbiwgcGVyZm9ybSB1bnRhZ2dpbmcgaW4gaXQuCgpSZXZpZXdlZC1ieTogS2hhbGlkIEF6aXog
PGtoYWxpZC5heml6QG9yYWNsZS5jb20+ClJldmlld2VkLWJ5OiBWaW5jZW56byBGcmFzY2lubyA8
dmluY2Vuem8uZnJhc2Npbm9AYXJtLmNvbT4KQWNrZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0
YWxpbi5tYXJpbmFzQGFybS5jb20+ClJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNo
cm9taXVtLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBn
b29nbGUuY29tPgotLS0KIG1tL2ZyYW1lX3ZlY3Rvci5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21tL2ZyYW1lX3ZlY3Rvci5jIGIvbW0vZnJh
bWVfdmVjdG9yLmMKaW5kZXggYzY0ZGNhNmUyN2MyLi5jNDMxY2E4MWRhZDUgMTAwNjQ0Ci0tLSBh
L21tL2ZyYW1lX3ZlY3Rvci5jCisrKyBiL21tL2ZyYW1lX3ZlY3Rvci5jCkBAIC00Niw2ICs0Niw4
IEBAIGludCBnZXRfdmFkZHJfZnJhbWVzKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGlu
dCBucl9mcmFtZXMsCiAJaWYgKFdBUk5fT05fT05DRShucl9mcmFtZXMgPiB2ZWMtPm5yX2FsbG9j
YXRlZCkpCiAJCW5yX2ZyYW1lcyA9IHZlYy0+bnJfYWxsb2NhdGVkOwogCisJc3RhcnQgPSB1bnRh
Z2dlZF9hZGRyKHN0YXJ0KTsKKwogCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsKIAlsb2NrZWQg
PSAxOwogCXZtYSA9IGZpbmRfdm1hX2ludGVyc2VjdGlvbihtbSwgc3RhcnQsIHN0YXJ0ICsgMSk7
Ci0tIAoyLjIyLjAuNzA5LmcxMDIzMDIxNDdiLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
