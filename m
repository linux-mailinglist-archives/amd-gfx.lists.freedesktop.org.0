Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EBB71EC5
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF6A89F71;
	Tue, 23 Jul 2019 18:11:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02356E32A
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:59:52 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id v4so37046667qkj.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=bykoKqk+RfxIttYDE7/GdnEkPwV+NEF/LkGgW6aheBM=;
 b=BnlEQknXiUykedEBA60BqmocpPsyPs1U9yPZoYG4y1jo/VgbphUVqCjYkMsH81Ia+I
 kry0I3EjPD4NsEf//q9nSKzoe3JQbuPW3gcC2eprNHCPZ8qbHNkDchMqiIWKfipYWOH0
 uwtL6U1rbSSl+TH794Z41RiX1QiFmzIM1Uf3RnBmD3PIGJSZrwlFHlxX0hZKuGi7jDdA
 JH5BFhoi+4o3BPrw9M7glcQ0rYKRnTm83xBooFXfL51Eqhxte9ErAl5OrEtGJTegw46S
 D+XPhzqGG99wsOaLb1xrMCc0sgLik6OOBeUfitXPTTDA9Z4CCaoJLQS3gvImsvizrBii
 TPFw==
X-Gm-Message-State: APjAAAUIrgcGLlz9CW7y3nThKFXWQ3JGIe4qLdnGxdbKvxOXHHwDe86V
 3NhwwA9AV+OVNVEpNyacBAgCFOpknvFAo95D
X-Google-Smtp-Source: APXvYqzy6KvMjkfI7Gkvl5k12zd++ICAyNUe8J8soJHrycJkzCW148ZA79khH20QvBebUrjeGJ/TSw9Gqxxo1fEA
X-Received: by 2002:ac8:7251:: with SMTP id l17mr54199388qtp.277.1563904791730; 
 Tue, 23 Jul 2019 10:59:51 -0700 (PDT)
Date: Tue, 23 Jul 2019 19:58:51 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <87422b4d72116a975896f2b19b00f38acbd28f33.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 14/15] vfio/type1: untag user pointers in vaddr_get_pfn
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
 bh=bykoKqk+RfxIttYDE7/GdnEkPwV+NEF/LkGgW6aheBM=;
 b=t2L6A3co0IUcO5jJEupAYqmfSwA1Pmfl3+ZcIn/5Q85mp2WLmhw1iqLCswQ9as3aOF
 a0D+pYMEhkdmm+KSqXmSiU/lD0Pz3h6uvkPAeVEHs1IFoAwnv5BA1YbF3d7nwG6M8iRR
 Z5NEOhmfG5y3nopQ695DATYQQfXAIYJG7yd7F+lB9VoEza1F669VXhs6jrCa2pvOvN6l
 r1p+w7pUdDXihW/3CqVYzRnheU9A6fqtUiCr4NASapwor3nhJC+/jeMNYPGIPNIFjoFu
 E4g9GrA8tUOQtGrCF4JaEQ7hr5aZJYBDV43aYbaG/BPoNEA3mTX8DLrogiBkcDNJOYJ5
 rrBA==
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
 Eric Auger <eric.auger@redhat.com>,
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
dHMuCgp2YWRkcl9nZXRfcGZuKCkgdXNlcyBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2bWEg
bG9va3Vwcywgd2hpY2ggY2FuCm9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgoK
VW50YWcgdXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgoKUmV2aWV3ZWQtYnk6IEVyaWMg
QXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFZpbmNlbnpvIEZyYXNj
aW5vIDx2aW5jZW56by5mcmFzY2lub0Bhcm0uY29tPgpSZXZpZXdlZC1ieTogQ2F0YWxpbiBNYXJp
bmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vl
c2Nvb2tAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRy
ZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyB8
IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlw
ZTEuYwppbmRleCAwNTQzOTFmMzBmYTguLjY3YTI0YjRkMGZhNCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYworKysgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90
eXBlMS5jCkBAIC0zNjgsNiArMzY4LDggQEAgc3RhdGljIGludCB2YWRkcl9nZXRfcGZuKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZhZGRyLAogCiAJZG93bl9yZWFkKCZtbS0+
bW1hcF9zZW0pOwogCisJdmFkZHIgPSB1bnRhZ2dlZF9hZGRyKHZhZGRyKTsKKwogCXZtYSA9IGZp
bmRfdm1hX2ludGVyc2VjdGlvbihtbSwgdmFkZHIsIHZhZGRyICsgMSk7CiAKIAlpZiAodm1hICYm
IHZtYS0+dm1fZmxhZ3MgJiBWTV9QRk5NQVApIHsKLS0gCjIuMjIuMC43MDkuZzEwMjMwMjE0N2It
Z29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
