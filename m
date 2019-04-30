Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9C7FA64
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 15:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2850E8921A;
	Tue, 30 Apr 2019 13:29:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x24a.google.com (mail-oi1-x24a.google.com
 [IPv6:2607:f8b0:4864:20::24a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C61891DD
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 13:26:01 +0000 (UTC)
Received: by mail-oi1-x24a.google.com with SMTP id w10so5450545oie.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 06:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xNbRPHb0QaxGlTA7s33PjaJCVzzZC2iohEMIfDhjOnw=;
 b=rHB7Eid5c5tB+bgbxCHwZfoqbDtbhNHzvTo3s0JtW5Ziku5maHJOc6ssRQWlVAevfn
 4Y3kkcI+ZDb6RNVJAJUJLcERV3AzrAnPWEIj3HkyhpxIMA9eXQQMe9XuhdZaAfg1nk1h
 H9M+ySyV85rK+2y+mPJOW9Skna6xGO+R+TvZad1x1XcvNKkZQkZ/eu85TaNL2IEJGEmW
 +Ad9ZcT2bR7v2lxr+r5AEbpKsmjOTAQTHdKmpmUPa56c5OkI/whCuTFUvbdba4obhRhH
 yzsjgO9N0IiYLEM5U5SFdHEkMdRrxsYqQRanCHeAYVc7yg0GZOzH55rf+89HQr5xbgqY
 Cb0Q==
X-Gm-Message-State: APjAAAWeLX5vIl4bdoS29g07G6vNkC8Nk/hbQC0irT1U5lXstqbiu9q8
 uyUUpWlGyqBFlcVHbOZ62RLn+0SQ5pT+7O3d
X-Google-Smtp-Source: APXvYqzqz0hM8566mMMykEcEDE15qguKaKv3Gnp85A2T0WJw46tHTZ3v4v+uUTcgMqiUvlhCC6+9Qaw/183DYgvX
X-Received: by 2002:a05:6808:4ca:: with SMTP id
 a10mr3005375oie.35.1556630760913; 
 Tue, 30 Apr 2019 06:26:00 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:25:10 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <66262e91c1768bf61e78456608a8a5190ea4e1d8.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 14/17] media/v4l2-core,
 arm64: untag user pointers in videobuf_dma_contig_user_get
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
 bh=xNbRPHb0QaxGlTA7s33PjaJCVzzZC2iohEMIfDhjOnw=;
 b=G3VBJNj1Efd82TURXBcG2ETfYyZa4nNQbw5XcSPgrFNgGTDcrjKi2K3Iqxh9GCJaVT
 q4ybexiR1zpb+d5J4+ktYX//GzTjjx7hvSHawuAMH2628bR7wRgw71HvGhNfTflHW/zs
 Atp0zpFkZrhjqB1YK2fIhTRq2d162F4gSLgDXmj1SWW0QKaRzutUGTNf9j2DzCy8DQXs
 6qis1IjWlpcydKHrLlqfebzxPQ65WrUm0DNZpeC309u8+WueXbRuj/bbSEKVwswOSRBh
 9Q1k1UxCvXqArWAzlxVP1yBw+FzmFzBJan3FvrRViSuycjCJ8f4ZVoJHTVS0bktu9b7r
 znhA==
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
cmd1bWVudHMuCgp2aWRlb2J1Zl9kbWFfY29udGlnX3VzZXJfZ2V0KCkgdXNlcyBwcm92aWRlZCB1
c2VyIHBvaW50ZXJzIGZvciB2bWEKbG9va3Vwcywgd2hpY2ggY2FuIG9ubHkgYnkgZG9uZSB3aXRo
IHVudGFnZ2VkIHBvaW50ZXJzLgoKVW50YWcgdGhlIHBvaW50ZXJzIGluIHRoaXMgZnVuY3Rpb24u
CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+
Ci0tLQogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jIHwgOSAr
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRp
Zy5jIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCmluZGV4
IGUxYmY1MGRmNGM3MC4uOGExZGRkMTQ2YjE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3Y0
bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNv
cmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCkBAIC0xNjAsNiArMTYwLDcgQEAgc3RhdGljIHZvaWQg
dmlkZW9idWZfZG1hX2NvbnRpZ191c2VyX3B1dChzdHJ1Y3QgdmlkZW9idWZfZG1hX2NvbnRpZ19t
ZW1vcnkgKm1lbSkKIHN0YXRpYyBpbnQgdmlkZW9idWZfZG1hX2NvbnRpZ191c2VyX2dldChzdHJ1
Y3QgdmlkZW9idWZfZG1hX2NvbnRpZ19tZW1vcnkgKm1lbSwKIAkJCQkJc3RydWN0IHZpZGVvYnVm
X2J1ZmZlciAqdmIpCiB7CisJdW5zaWduZWQgbG9uZyB1bnRhZ2dlZF9iYWRkciA9IHVudGFnZ2Vk
X2FkZHIodmItPmJhZGRyKTsKIAlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOwog
CXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwogCXVuc2lnbmVkIGxvbmcgcHJldl9wZm4sIHRo
aXNfcGZuOwpAQCAtMTY3LDIyICsxNjgsMjIgQEAgc3RhdGljIGludCB2aWRlb2J1Zl9kbWFfY29u
dGlnX3VzZXJfZ2V0KHN0cnVjdCB2aWRlb2J1Zl9kbWFfY29udGlnX21lbW9yeSAqbWVtLAogCXVu
c2lnbmVkIGludCBvZmZzZXQ7CiAJaW50IHJldDsKIAotCW9mZnNldCA9IHZiLT5iYWRkciAmIH5Q
QUdFX01BU0s7CisJb2Zmc2V0ID0gdW50YWdnZWRfYmFkZHIgJiB+UEFHRV9NQVNLOwogCW1lbS0+
c2l6ZSA9IFBBR0VfQUxJR04odmItPnNpemUgKyBvZmZzZXQpOwogCXJldCA9IC1FSU5WQUw7CiAK
IAlkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7CiAKLQl2bWEgPSBmaW5kX3ZtYShtbSwgdmItPmJh
ZGRyKTsKKwl2bWEgPSBmaW5kX3ZtYShtbSwgdW50YWdnZWRfYmFkZHIpOwogCWlmICghdm1hKQog
CQlnb3RvIG91dF91cDsKIAotCWlmICgodmItPmJhZGRyICsgbWVtLT5zaXplKSA+IHZtYS0+dm1f
ZW5kKQorCWlmICgodW50YWdnZWRfYmFkZHIgKyBtZW0tPnNpemUpID4gdm1hLT52bV9lbmQpCiAJ
CWdvdG8gb3V0X3VwOwogCiAJcGFnZXNfZG9uZSA9IDA7CiAJcHJldl9wZm4gPSAwOyAvKiBraWxs
IHdhcm5pbmcgKi8KLQl1c2VyX2FkZHJlc3MgPSB2Yi0+YmFkZHI7CisJdXNlcl9hZGRyZXNzID0g
dW50YWdnZWRfYmFkZHI7CiAKIAl3aGlsZSAocGFnZXNfZG9uZSA8IChtZW0tPnNpemUgPj4gUEFH
RV9TSElGVCkpIHsKIAkJcmV0ID0gZm9sbG93X3Bmbih2bWEsIHVzZXJfYWRkcmVzcywgJnRoaXNf
cGZuKTsKLS0gCjIuMjEuMC41OTMuZzUxMWVjMzQ1ZTE4LWdvb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
