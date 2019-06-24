Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B7E50E81
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 16:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8989B69;
	Mon, 24 Jun 2019 14:36:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD00289B66
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:32 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id l16so16365402qkk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 07:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xV4GbhfwTJs/VHD3XxRc3myky/6/dZivHKwnC5uKFNY=;
 b=RIRj7BpzzKiBFp6u1atKjIIwXZfvpdo7dNatu4BaH5Lm7xkUCSgwur2jmzCPiQ/7wm
 b8AdKlFLlB1k8yz6ECGbzoSwnVdnqrdoomGPDRQ/bZI4ujkNlg953TSkiCNA4t2EEDxm
 ghUTQT4Etf3wsplObKIwGHbWR0+Grqd0nYRvG7bKD9PQ/7jFi5dZgSE9MfqSnb6Q4WTR
 WVMexj2t4+3f6/7vY8z6bD7gjtWPNmOlMAFxSnMMSS2VwOEEsIHJw19yWPmZfhrl3EZ/
 rtBK8K8ggqoMFosVM7ORWyWw2b5sYghvU28Q4kb9rlsgzZ1lnfmVRuQ93o9jiCUNfNvc
 LBQw==
X-Gm-Message-State: APjAAAVNsNdu6oldVtB7dUAPirolzb6lGN6Z3NaVf9ktjO9EORc+j2a/
 t7sFUMFJ5iT4dlXIkUBxwruk4Z8i1fmGOOec
X-Google-Smtp-Source: APXvYqwe8X+4yuXQ7UlZtRYriaSj9tE/sKjuV5CxgHmn3yQIPlD9lif2nlCyzd6rbdataPXUKZA07t9k3oZM6sHi
X-Received: by 2002:a37:640f:: with SMTP id y15mr50777872qkb.79.1561386811824; 
 Mon, 24 Jun 2019 07:33:31 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:32:53 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <d8e3b9a819e98d6527e506027b173b128a148d3c.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 08/15] userfaultfd: untag user pointers
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
 bh=xV4GbhfwTJs/VHD3XxRc3myky/6/dZivHKwnC5uKFNY=;
 b=VLugRRxW8NzEgheS31MNVa1Sf0NPG55w1n45MRa1PCRLK9hq7S2jBGoYLnFMFiHI5i
 hpX0xoMfsikUNRg8wsT/s7FiLojNQJbMZrLaUF3hUbhIT0quzLCgUnw+iuzryEs61l+O
 Ve0OmRPuLrSa3geOriI62VfPQqKbergnVirL4Oq9bZbq3yOHL4EORN4ukQhnIooC4ZN9
 PZ1lLy0eIBkrTz3zU6usqrjjK7ENTukF79xqMm8AaDpm29IyoVXUdy6JraPyjXn+72vp
 F+QX4V4XVS+gqXq9OgmVKgBE0AfC5B+46IUnSBLokKMZbLpJOxTVnXtB640hiGZTFThT
 nCTg==
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
dHMuCgp1c2VyZmF1bHRmZCBjb2RlIHVzZSBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2bWEg
bG9va3Vwcywgd2hpY2ggY2FuCm9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgoK
VW50YWcgdXNlciBwb2ludGVycyBpbiB2YWxpZGF0ZV9yYW5nZSgpLgoKUmV2aWV3ZWQtYnk6IFZp
bmNlbnpvIEZyYXNjaW5vIDx2aW5jZW56by5mcmFzY2lub0Bhcm0uY29tPgpSZXZpZXdlZC1ieTog
Q2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEtl
ZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29u
b3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogZnMvdXNlcmZhdWx0ZmQuYyB8IDIy
ICsrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy91c2VyZmF1bHRmZC5jIGIvZnMvdXNl
cmZhdWx0ZmQuYwppbmRleCBhZTBiOGI1ZjY5ZTYuLmMyYmUzNmExNjhjYSAxMDA2NDQKLS0tIGEv
ZnMvdXNlcmZhdWx0ZmQuYworKysgYi9mcy91c2VyZmF1bHRmZC5jCkBAIC0xMjYxLDIxICsxMjYx
LDIzIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB3YWtlX3VzZXJmYXVsdChzdHJ1Y3Qg
dXNlcmZhdWx0ZmRfY3R4ICpjdHgsCiB9CiAKIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IHZh
bGlkYXRlX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAotCQkJCQkgIF9fdTY0IHN0YXJ0LCBf
X3U2NCBsZW4pCisJCQkJCSAgX191NjQgKnN0YXJ0LCBfX3U2NCBsZW4pCiB7CiAJX191NjQgdGFz
a19zaXplID0gbW0tPnRhc2tfc2l6ZTsKIAotCWlmIChzdGFydCAmIH5QQUdFX01BU0spCisJKnN0
YXJ0ID0gdW50YWdnZWRfYWRkcigqc3RhcnQpOworCisJaWYgKCpzdGFydCAmIH5QQUdFX01BU0sp
CiAJCXJldHVybiAtRUlOVkFMOwogCWlmIChsZW4gJiB+UEFHRV9NQVNLKQogCQlyZXR1cm4gLUVJ
TlZBTDsKIAlpZiAoIWxlbikKIAkJcmV0dXJuIC1FSU5WQUw7Ci0JaWYgKHN0YXJ0IDwgbW1hcF9t
aW5fYWRkcikKKwlpZiAoKnN0YXJ0IDwgbW1hcF9taW5fYWRkcikKIAkJcmV0dXJuIC1FSU5WQUw7
Ci0JaWYgKHN0YXJ0ID49IHRhc2tfc2l6ZSkKKwlpZiAoKnN0YXJ0ID49IHRhc2tfc2l6ZSkKIAkJ
cmV0dXJuIC1FSU5WQUw7Ci0JaWYgKGxlbiA+IHRhc2tfc2l6ZSAtIHN0YXJ0KQorCWlmIChsZW4g
PiB0YXNrX3NpemUgLSAqc3RhcnQpCiAJCXJldHVybiAtRUlOVkFMOwogCXJldHVybiAwOwogfQpA
QCAtMTMyNSw3ICsxMzI3LDcgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF9yZWdpc3RlcihzdHJ1
Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgsCiAJCWdvdG8gb3V0OwogCX0KIAotCXJldCA9IHZhbGlk
YXRlX3JhbmdlKG1tLCB1ZmZkaW9fcmVnaXN0ZXIucmFuZ2Uuc3RhcnQsCisJcmV0ID0gdmFsaWRh
dGVfcmFuZ2UobW0sICZ1ZmZkaW9fcmVnaXN0ZXIucmFuZ2Uuc3RhcnQsCiAJCQkgICAgIHVmZmRp
b19yZWdpc3Rlci5yYW5nZS5sZW4pOwogCWlmIChyZXQpCiAJCWdvdG8gb3V0OwpAQCAtMTUxNCw3
ICsxNTE2LDcgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF91bnJlZ2lzdGVyKHN0cnVjdCB1c2Vy
ZmF1bHRmZF9jdHggKmN0eCwKIAlpZiAoY29weV9mcm9tX3VzZXIoJnVmZmRpb191bnJlZ2lzdGVy
LCBidWYsIHNpemVvZih1ZmZkaW9fdW5yZWdpc3RlcikpKQogCQlnb3RvIG91dDsKIAotCXJldCA9
IHZhbGlkYXRlX3JhbmdlKG1tLCB1ZmZkaW9fdW5yZWdpc3Rlci5zdGFydCwKKwlyZXQgPSB2YWxp
ZGF0ZV9yYW5nZShtbSwgJnVmZmRpb191bnJlZ2lzdGVyLnN0YXJ0LAogCQkJICAgICB1ZmZkaW9f
dW5yZWdpc3Rlci5sZW4pOwogCWlmIChyZXQpCiAJCWdvdG8gb3V0OwpAQCAtMTY2NSw3ICsxNjY3
LDcgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF93YWtlKHN0cnVjdCB1c2VyZmF1bHRmZF9jdHgg
KmN0eCwKIAlpZiAoY29weV9mcm9tX3VzZXIoJnVmZmRpb193YWtlLCBidWYsIHNpemVvZih1ZmZk
aW9fd2FrZSkpKQogCQlnb3RvIG91dDsKIAotCXJldCA9IHZhbGlkYXRlX3JhbmdlKGN0eC0+bW0s
IHVmZmRpb193YWtlLnN0YXJ0LCB1ZmZkaW9fd2FrZS5sZW4pOworCXJldCA9IHZhbGlkYXRlX3Jh
bmdlKGN0eC0+bW0sICZ1ZmZkaW9fd2FrZS5zdGFydCwgdWZmZGlvX3dha2UubGVuKTsKIAlpZiAo
cmV0KQogCQlnb3RvIG91dDsKIApAQCAtMTcwNSw3ICsxNzA3LDcgQEAgc3RhdGljIGludCB1c2Vy
ZmF1bHRmZF9jb3B5KHN0cnVjdCB1c2VyZmF1bHRmZF9jdHggKmN0eCwKIAkJCSAgIHNpemVvZih1
ZmZkaW9fY29weSktc2l6ZW9mKF9fczY0KSkpCiAJCWdvdG8gb3V0OwogCi0JcmV0ID0gdmFsaWRh
dGVfcmFuZ2UoY3R4LT5tbSwgdWZmZGlvX2NvcHkuZHN0LCB1ZmZkaW9fY29weS5sZW4pOworCXJl
dCA9IHZhbGlkYXRlX3JhbmdlKGN0eC0+bW0sICZ1ZmZkaW9fY29weS5kc3QsIHVmZmRpb19jb3B5
Lmxlbik7CiAJaWYgKHJldCkKIAkJZ290byBvdXQ7CiAJLyoKQEAgLTE3NjEsNyArMTc2Myw3IEBA
IHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfemVyb3BhZ2Uoc3RydWN0IHVzZXJmYXVsdGZkX2N0eCAq
Y3R4LAogCQkJICAgc2l6ZW9mKHVmZmRpb196ZXJvcGFnZSktc2l6ZW9mKF9fczY0KSkpCiAJCWdv
dG8gb3V0OwogCi0JcmV0ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5tbSwgdWZmZGlvX3plcm9wYWdl
LnJhbmdlLnN0YXJ0LAorCXJldCA9IHZhbGlkYXRlX3JhbmdlKGN0eC0+bW0sICZ1ZmZkaW9femVy
b3BhZ2UucmFuZ2Uuc3RhcnQsCiAJCQkgICAgIHVmZmRpb196ZXJvcGFnZS5yYW5nZS5sZW4pOwog
CWlmIChyZXQpCiAJCWdvdG8gb3V0OwotLSAKMi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
