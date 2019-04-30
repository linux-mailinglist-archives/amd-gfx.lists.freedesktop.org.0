Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5855AFA53
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 15:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB30891DC;
	Tue, 30 Apr 2019 13:29:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x349.google.com (mail-ot1-x349.google.com
 [IPv6:2607:f8b0:4864:20::349])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C1489180
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 13:25:52 +0000 (UTC)
Received: by mail-ot1-x349.google.com with SMTP id o13so7365791otk.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 06:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=+qKylFjMLP53K9qAejYeg4zQoAltlSq0MdIVnvcZCpk=;
 b=PW+adrqoac2flqibn0wxIJP9AxF3v/1H9AYeFn5+JpvIribVhepEHMZvVEloi4whcV
 /1S+AlVQ9ZHNO1Aa6WwbKDaiEGt/Dnh570Sy5Sjv3gugQQILxu/DPMNRI5YHEp4/YL36
 TzvxMLInyawFVHOnR1mb022AfCP160Al4LPHS/SPos0nbdcRsbCaMQanwxisl/1cf9jI
 +inAbhED+UlKzIWWh6w//XJuH5JaJPqi3w/fUmNvvaeHnevQ9WOh0dlo3wYMPCwDOOdN
 daJJNDlGTi00EMRovXIJmeZIC0PRpcQBd/mYY6Wwm8Oov24PibOChh1t8sbWhWsVKeCs
 z2yw==
X-Gm-Message-State: APjAAAWYHdNx9rL7g4ywFbDQQBLjpO/Z6+gpYHAyrMYNHslzj1hi9rTh
 aogZ2zklIMW5xdFKR8Igh0xOJnHPJ7MzPVji
X-Google-Smtp-Source: APXvYqz7KleMfXSb2xWhqBUaqWJTSwZR2ghM1vwfjJsnESBwGEPHMng/yx10KRFE5q5G6LCNFaFlFnciq2Xk09j0
X-Received: by 2002:aca:4e83:: with SMTP id c125mr2833389oib.13.1556630751340; 
 Tue, 30 Apr 2019 06:25:51 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:25:07 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <2e827b5c484be14044933049fec180cd6acb054b.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 11/17] drm/amdgpu, arm64: untag user pointers
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 30 Apr 2019 13:29:06 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=+qKylFjMLP53K9qAejYeg4zQoAltlSq0MdIVnvcZCpk=;
 b=btEcp2nedxD/RSSqWCBp6Rk8cMJhftnRu9ZW20tW9H57Xw0aRxokGUkdPaQcz9rkFo
 41vHcxVyWnumGF2h8AA/tvaQ1eb1WCyLG8jJc1HuBhG3r5Wd1fM3SW30CuGnpg1TRhOv
 wnQvFrUnasvGEjcZv5QbKz23EvdFctZuk2lHQH4EeEAFL4Kx+vSjlXZtQRydk7j1idAx
 /UUAwj84w5Pi95UWsOVe8tS152xj2ZfcEWPp7jNQzN52h4BmJiS1Ku9e/jk70X0Z2EPY
 SDSyNof0IogZBTJr94e5UKMwPIftjzOfnH+SY8xUjb5s8afDb//mLKaZWdWGUI38Snzl
 JsbQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Koenig@google.com,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Chintan Pandya <cpandya@codeaurora.org>,
 Felix <Felix.Kuehling@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Kuehling@google.com, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Deucher@google.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgphbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKCkgdXNlcyBwcm92aWRlZCB1
c2VyIHBvaW50ZXJzIGZvciB2bWEKbG9va3Vwcywgd2hpY2ggY2FuIG9ubHkgYnkgZG9uZSB3aXRo
IHVudGFnZ2VkIHBvaW50ZXJzLiBUaGlzIHBhdGNoCnVudGFnIHVzZXIgcG9pbnRlcnMgd2hlbiB0
aGV5IGFyZSBiZWluZyBzZXQgaW4KYW1kZ3B1X3R0bV90dF9zZXRfdXNlcnB0cigpLgoKSW4gYW1k
Z3B1X2dlbV91c2VycHRyX2lvY3RsKCkgYW5kIGFtZGdwdV9hbWRrZmRfZ3B1dm0uYy9pbml0X3Vz
ZXJfcGFnZXMoKQphbiBNTVUgbm90aWZpZXIgaXMgc2V0IHVwIHdpdGggYSAodGFnZ2VkKSB1c2Vy
c3BhY2UgcG9pbnRlci4gVGhlIHVudGFnZ2VkCmFkZHJlc3Mgc2hvdWxkIGJlIHVzZWQgc28gdGhh
dCBNTVUgbm90aWZpZXJzIGZvciB0aGUgdW50YWdnZWQgYWRkcmVzcyBnZXQKY29ycmVjdGx5IG1h
dGNoZWQgdXAgd2l0aCB0aGUgcmlnaHQgQk8uIFRoaXMgcGF0Y2ggdW50YWcgdXNlciBwb2ludGVy
cyBpbgphbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwoKSBmb3IgdGhlIEdFTSBjYXNlIGFuZCBpbgph
bWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9ncHUoKSBmb3IgdGhlIEtGRCBjYXNl
LgoKU3VnZ2VzdGVkLWJ5OiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgfCAy
ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgICAgICAgICAgfCAy
ICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgICAgICAgfCAy
ICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKaW5k
ZXggMTkyMWRlYzNkZjdhLi4yMGNhYzQ0ZWQ0NDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKQEAgLTExMjEsNyArMTEyMSw3IEBAIGlu
dCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9ncHUoCiAJCWFsbG9jX2ZsYWdz
ID0gMDsKIAkJaWYgKCFvZmZzZXQgfHwgISpvZmZzZXQpCiAJCQlyZXR1cm4gLUVJTlZBTDsKLQkJ
dXNlcl9hZGRyID0gKm9mZnNldDsKKwkJdXNlcl9hZGRyID0gdW50YWdnZWRfYWRkcigqb2Zmc2V0
KTsKIAl9IGVsc2UgaWYgKGZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX0RPT1JCRUxMKSB7CiAJCWRv
bWFpbiA9IEFNREdQVV9HRU1fRE9NQUlOX0dUVDsKIAkJYWxsb2NfZG9tYWluID0gQU1ER1BVX0dF
TV9ET01BSU5fQ1BVOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCmluZGV4
IGQyMWRkMmYzNjlkYS4uOTg1Y2I4MmIyYWE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dlbS5jCkBAIC0yODYsNiArMjg2LDggQEAgaW50IGFtZGdwdV9nZW1fdXNlcnB0cl9p
b2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCXVpbnQzMl90IGhhbmRs
ZTsKIAlpbnQgcjsKIAorCWFyZ3MtPmFkZHIgPSB1bnRhZ2dlZF9hZGRyKGFyZ3MtPmFkZHIpOwor
CiAJaWYgKG9mZnNldF9pbl9wYWdlKGFyZ3MtPmFkZHIgfCBhcmdzLT5zaXplKSkKIAkJcmV0dXJu
IC1FSU5WQUw7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRleCA3
M2U3MWU2MWRjOTkuLjFkMzBlOTdhYzJjNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYwpAQCAtMTI0OCw3ICsxMjQ4LDcgQEAgaW50IGFtZGdwdV90dG1fdHRfc2V0X3Vz
ZXJwdHIoc3RydWN0IHR0bV90dCAqdHRtLCB1aW50NjRfdCBhZGRyLAogCWlmIChndHQgPT0gTlVM
TCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQlndHQtPnVzZXJwdHIgPSBhZGRyOworCWd0dC0+dXNl
cnB0ciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7CiAJZ3R0LT51c2VyZmxhZ3MgPSBmbGFnczsKIAog
CWlmIChndHQtPnVzZXJ0YXNrKQotLSAKMi4yMS4wLjU5My5nNTExZWMzNDVlMTgtZ29vZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
