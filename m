Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF3B71ECF
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CD46E336;
	Tue, 23 Jul 2019 18:11:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AE289DBA
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:59:46 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id v17so15817267ybq.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=HpinGwuxMTqrT/lGIW6pacs7O2cDdG9/5Ty+RZAfASg=;
 b=qMEKQAn4PB1vM/XIcXVeRI9K6adNo+Nqaq+vqXj6dpJPAUh/INcLnD/fRVxTy6n9li
 O2d7LdCzTCe0jYOsIAv3S3ofczasZ8XMaXW+M59oCNqa7m/ceizlIz9SbwXhp3St6Rpu
 VDrzG2MzYRPEE1xxjso0DCvn0QUBkQgJC7h7Ofk1fwdvwc5gbPia7xJvFF2K9wqe/e0D
 Hi3V7+ux7n7aXukChMhN8/orxfjxMUvgNjhdrWzPIphMHkJ6jf/4aFG2k7u+yH8JlGuD
 UgPHcU0pWCUNGBoXF/iwb1HmVhu6v2GMBdMKJxn+EAeMMmLH4lqp9TiHvUa2Yh0Bd7eJ
 nQGA==
X-Gm-Message-State: APjAAAXcGlNN6LaW25/VvCGgAW/UM6FUcLsDjfkEiVEh26Lxtn5rRHcy
 hsT3ol6Xx83n3UWK3486/opwglqFVDjQB50N
X-Google-Smtp-Source: APXvYqzHKD7+vuBXgJcq/Tk4Un/3kb/bP9xO8IxzyxfANBAOcEtBJXWYvzpx9hfbGP7jrgSdMTzC7LW89o7yIBsc
X-Received: by 2002:a81:7854:: with SMTP id t81mr13003915ywc.2.1563904785456; 
 Tue, 23 Jul 2019 10:59:45 -0700 (PDT)
Date: Tue, 23 Jul 2019 19:58:49 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <100436d5f8e4349a78f27b0bbb27e4801fcb946b.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 12/15] media/v4l2-core: untag user pointers in
 videobuf_dma_contig_user_get
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
 bh=HpinGwuxMTqrT/lGIW6pacs7O2cDdG9/5Ty+RZAfASg=;
 b=ce/6WmN6TyK+cE8ZhsNWx985tcmb8TsBUG67QVHPvfluZ/ESLePB0+Iu2kpzcDEd4Q
 YbgyS6kgeVvVFCMr/LAOnm0UHsRKQhmlp8Muf9Haj3921fIO1R3W8RTR8Ay/3UNeJg77
 3oj3IZF7aFzplHspAYys2RygkkcmZ5oyq8CPcTBqzS7rp1MfCHQ9R/Uyt21zik3yW2ex
 viSYi5ZHeqKSa6InOONOnbkuTpjEw9pZIBEPGTBapLOkb92OQ042RHOMLo5PTXbS7p7j
 huNarTmfeFDbiHSfiNnedUTa6Tx9rh0fc8dZU+mkH0hxVq24fx81n5unKjL7cIn91yBU
 G6/Q==
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
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
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
dHMuCgp2aWRlb2J1Zl9kbWFfY29udGlnX3VzZXJfZ2V0KCkgdXNlcyBwcm92aWRlZCB1c2VyIHBv
aW50ZXJzIGZvciB2bWEKbG9va3Vwcywgd2hpY2ggY2FuIG9ubHkgYnkgZG9uZSB3aXRoIHVudGFn
Z2VkIHBvaW50ZXJzLgoKVW50YWcgdGhlIHBvaW50ZXJzIGluIHRoaXMgZnVuY3Rpb24uCgpSZXZp
ZXdlZC1ieTogS2hhbGlkIEF6aXogPGtoYWxpZC5heml6QG9yYWNsZS5jb20+ClJldmlld2VkLWJ5
OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KQWNrZWQtYnk6IE1hdXJvIENhcnZh
bGhvIENoZWhhYiA8bWNoZWhhYitzYW1zdW5nQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEFu
ZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KLS0tCiBkcml2ZXJzL21lZGlh
L3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMgfCA5ICsrKysrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMgYi9kcml2ZXJzL21lZGlh
L3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKaW5kZXggNzZiNGFjN2IxNjc4Li5hZWIy
ZjQ5N2M2ODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRt
YS1jb250aWcuYworKysgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29u
dGlnLmMKQEAgLTE1Nyw2ICsxNTcsNyBAQCBzdGF0aWMgdm9pZCB2aWRlb2J1Zl9kbWFfY29udGln
X3VzZXJfcHV0KHN0cnVjdCB2aWRlb2J1Zl9kbWFfY29udGlnX21lbW9yeSAqbWVtKQogc3RhdGlj
IGludCB2aWRlb2J1Zl9kbWFfY29udGlnX3VzZXJfZ2V0KHN0cnVjdCB2aWRlb2J1Zl9kbWFfY29u
dGlnX21lbW9yeSAqbWVtLAogCQkJCQlzdHJ1Y3QgdmlkZW9idWZfYnVmZmVyICp2YikKIHsKKwl1
bnNpZ25lZCBsb25nIHVudGFnZ2VkX2JhZGRyID0gdW50YWdnZWRfYWRkcih2Yi0+YmFkZHIpOwog
CXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07CiAJc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWE7CiAJdW5zaWduZWQgbG9uZyBwcmV2X3BmbiwgdGhpc19wZm47CkBAIC0xNjQsMjIg
KzE2NSwyMiBAQCBzdGF0aWMgaW50IHZpZGVvYnVmX2RtYV9jb250aWdfdXNlcl9nZXQoc3RydWN0
IHZpZGVvYnVmX2RtYV9jb250aWdfbWVtb3J5ICptZW0sCiAJdW5zaWduZWQgaW50IG9mZnNldDsK
IAlpbnQgcmV0OwogCi0Jb2Zmc2V0ID0gdmItPmJhZGRyICYgflBBR0VfTUFTSzsKKwlvZmZzZXQg
PSB1bnRhZ2dlZF9iYWRkciAmIH5QQUdFX01BU0s7CiAJbWVtLT5zaXplID0gUEFHRV9BTElHTih2
Yi0+c2l6ZSArIG9mZnNldCk7CiAJcmV0ID0gLUVJTlZBTDsKIAogCWRvd25fcmVhZCgmbW0tPm1t
YXBfc2VtKTsKIAotCXZtYSA9IGZpbmRfdm1hKG1tLCB2Yi0+YmFkZHIpOworCXZtYSA9IGZpbmRf
dm1hKG1tLCB1bnRhZ2dlZF9iYWRkcik7CiAJaWYgKCF2bWEpCiAJCWdvdG8gb3V0X3VwOwogCi0J
aWYgKCh2Yi0+YmFkZHIgKyBtZW0tPnNpemUpID4gdm1hLT52bV9lbmQpCisJaWYgKCh1bnRhZ2dl
ZF9iYWRkciArIG1lbS0+c2l6ZSkgPiB2bWEtPnZtX2VuZCkKIAkJZ290byBvdXRfdXA7CiAKIAlw
YWdlc19kb25lID0gMDsKIAlwcmV2X3BmbiA9IDA7IC8qIGtpbGwgd2FybmluZyAqLwotCXVzZXJf
YWRkcmVzcyA9IHZiLT5iYWRkcjsKKwl1c2VyX2FkZHJlc3MgPSB1bnRhZ2dlZF9iYWRkcjsKIAog
CXdoaWxlIChwYWdlc19kb25lIDwgKG1lbS0+c2l6ZSA+PiBQQUdFX1NISUZUKSkgewogCQlyZXQg
PSBmb2xsb3dfcGZuKHZtYSwgdXNlcl9hZGRyZXNzLCAmdGhpc19wZm4pOwotLSAKMi4yMi4wLjcw
OS5nMTAyMzAyMTQ3Yi1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
