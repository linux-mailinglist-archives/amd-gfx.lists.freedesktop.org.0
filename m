Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5317933E50
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 07:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5204894C0;
	Tue,  4 Jun 2019 05:23:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D6389057
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 16:55:57 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id q17so959265qkc.23
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Jun 2019 09:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=QTQ4ZZ+1ONHvx3iNcSe/c62gqBzIbuX20WtdiRnopfw=;
 b=iSXiQTf7s/HJw8zfZ5I/IfR9CEivNoqAdXdWTHYsas5EN4enxuB4kqF+AcWVAJedlD
 2k2OfmLoE6xndOEmMBCnCmccmBTBh/BnSJEpeeHlQN8i1D/IJg8VtWaO4jdggdiiki/4
 bLKcFuJosSmF1mMLJXgsPZCvE4Xahx0OuI38i3EsKsvZDe98oCl5PQ1JmqTWma+9CqUv
 7Y39hLHx0C/DArgBXmtKs2TElh5I5mH9/ycdL5ndqNcD1YDoXxlYxyeTEgm/x+SeGJJ9
 dcwxfc2WkSHo7bEsVwhi261IsJL68GJpAOpGI/B+gFvW7q/jk/3i6i/tpXcz6fMmn9U9
 CgBg==
X-Gm-Message-State: APjAAAWci5Rtqa6J8mS2eJRm/hGppwajMe6gcIfiHMF3Dxe8O1fspqAR
 BLVjImt9YEkoEa/rsOVJqlmp75XUPyj804qC
X-Google-Smtp-Source: APXvYqynCi8uC9mwY5hf72ttWfEiYBsQ+6wl0nvKi3Uj+AQb+Ufw5GSOsuV9qYkE0ai47XUYEZWA+IZ0Az+FoQAg
X-Received: by 2002:a37:8002:: with SMTP id b2mr23304828qkd.289.1559580956267; 
 Mon, 03 Jun 2019 09:55:56 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:12 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <47d4e95b61013933ffe4f0be8832d03179d94b27.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 10/16] drm/amdgpu, arm64: untag user pointers
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
 bh=QTQ4ZZ+1ONHvx3iNcSe/c62gqBzIbuX20WtdiRnopfw=;
 b=Iulw2LDXuMXrguiNT2nc8pImmlAd9SEaHxzy+PIXZoC7Ry1861+IgSJT7msXK0lxjW
 Stlg9JACJI0q7DDqW7dFD1lXLlRa2BWigOxwo5Vw8cFe6qNirKkII0FhPNgtUk9+cp1T
 aHJGoLoDr4Q8979Fk7TFLPwhp9/TzWuYwglUurKj3rFU9GpRJ5xL6D7/jxXgMSu4llum
 hXs/FNVkTTazIDAfHhBMirRaAiVUM4CzdwvnR1yvQzgHmFdNai1A63k4wvi7etXyFGuo
 QDD/dhSJypo/bxB/7BkdNMWk1BD1fsQcPpD2mwu3O8zxH9SkplM6OKzkYqDvbWZfOgAq
 9GzA==
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
 Kuehling@google.com, Dave Martin <Dave.Martin@arm.com>,
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

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgpJbiBhbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwoKSBhbmQgYW1kZ3B1X2FtZGtm
ZF9ncHV2bS5jL2luaXRfdXNlcl9wYWdlcygpCmFuIE1NVSBub3RpZmllciBpcyBzZXQgdXAgd2l0
aCBhICh0YWdnZWQpIHVzZXJzcGFjZSBwb2ludGVyLiBUaGUgdW50YWdnZWQKYWRkcmVzcyBzaG91
bGQgYmUgdXNlZCBzbyB0aGF0IE1NVSBub3RpZmllcnMgZm9yIHRoZSB1bnRhZ2dlZCBhZGRyZXNz
IGdldApjb3JyZWN0bHkgbWF0Y2hlZCB1cCB3aXRoIHRoZSByaWdodCBCTy4gVGhpcyBwYXRjaCB1
bnRhZyB1c2VyIHBvaW50ZXJzIGluCmFtZGdwdV9nZW1fdXNlcnB0cl9pb2N0bCgpIGZvciB0aGUg
R0VNIGNhc2UgYW5kIGluIGFtZGdwdV9hbWRrZmRfZ3B1dm1fCmFsbG9jX21lbW9yeV9vZl9ncHUo
KSBmb3IgdGhlIEtGRCBjYXNlLiBUaGlzIGFsc28gbWFrZXMgc3VyZSB0aGF0IGFuCnVudGFnZ2Vk
IHBvaW50ZXIgaXMgcGFzc2VkIHRvIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoKSwgd2hp
Y2ggdXNlcwppdCBmb3Igdm1hIGxvb2t1cHMuCgpTdWdnZXN0ZWQtYnk6IEt1ZWhsaW5nLCBGZWxp
eCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxp
eC5LdWVobGluZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRy
ZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FtZGtmZF9ncHV2bS5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dlbS5jICAgICAgICAgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YW1ka2ZkX2dwdXZtLmMKaW5kZXggYTZlNTE4NGQ0MzZjLi41ZDQ3NmU5YmJjNDMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKQEAgLTEx
MDgsNyArMTEwOCw3IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9n
cHUoCiAJCWFsbG9jX2ZsYWdzID0gMDsKIAkJaWYgKCFvZmZzZXQgfHwgISpvZmZzZXQpCiAJCQly
ZXR1cm4gLUVJTlZBTDsKLQkJdXNlcl9hZGRyID0gKm9mZnNldDsKKwkJdXNlcl9hZGRyID0gdW50
YWdnZWRfYWRkcigqb2Zmc2V0KTsKIAl9IGVsc2UgaWYgKGZsYWdzICYgQUxMT0NfTUVNX0ZMQUdT
X0RPT1JCRUxMKSB7CiAJCWRvbWFpbiA9IEFNREdQVV9HRU1fRE9NQUlOX0dUVDsKIAkJYWxsb2Nf
ZG9tYWluID0gQU1ER1BVX0dFTV9ET01BSU5fQ1BVOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dlbS5jCmluZGV4IGQ0ZmNmNTQ3NTQ2NC4uZTkxZGYxNDA3NjE4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCkBAIC0yODcsNiArMjg3LDggQEAgaW50IGFt
ZGdwdV9nZW1fdXNlcnB0cl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRh
LAogCXVpbnQzMl90IGhhbmRsZTsKIAlpbnQgcjsKIAorCWFyZ3MtPmFkZHIgPSB1bnRhZ2dlZF9h
ZGRyKGFyZ3MtPmFkZHIpOworCiAJaWYgKG9mZnNldF9pbl9wYWdlKGFyZ3MtPmFkZHIgfCBhcmdz
LT5zaXplKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLS0gCjIuMjIuMC5yYzEuMzExLmc1ZDc1NzNh
MTUxLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
