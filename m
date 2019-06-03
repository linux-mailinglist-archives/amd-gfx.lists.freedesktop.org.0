Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C70ED33E5F
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 07:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C14A895B2;
	Tue,  4 Jun 2019 05:23:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BF78929D
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 16:56:17 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id v80so973906qkb.19
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Jun 2019 09:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=v9MzlIb7HY1yKtXIqdaDnLUOCgnoLYityVGh+V+FCFI=;
 b=BcTH8NkqInla0lmxlYVruXd/ygxNnU0WpJ0VN1k2O/tHN+ksH/zDyj6fHl0ufyqQNt
 hwJOWyi3mUr8b2zObozb+V4DQJLP+ki1BFBj0opaO1f3Hf9YErugsKJ8tpSR3tNjVoua
 B1/WsK/ioYU6kjzoGRVxUrorrTGYjWnXWaDhuLsCST4GY5IALNa09S+X/mBzBlM3OQ5F
 0c0IsCxYASesWomuRa9IhiYYJEZfICaUfN26HE9Fjv1rAOGs/hOLnhtU1luTdTafNbLl
 zsMfyNc9yIx2mBuMocaUZwpGnntTBdbPfQ7VZP2aWYt56OHsDgOMzqdnDlqLkST1ZA+W
 d4tg==
X-Gm-Message-State: APjAAAWosSF3d/xW8SA+etAT3JdOZWv4QKlcoEazPhZjaTjvbqEsYvqx
 JSrB99easusSMSZMVzjJzjsqBbLlzy1tA/Q9
X-Google-Smtp-Source: APXvYqyupRnjjQO94efnTljbt6p9DxywyyDuZaQUfwBf3Y405Fl40dWCznelJThhDpEIkj52c6mVbKSb6DjD/rvF
X-Received: by 2002:a37:de06:: with SMTP id h6mr3881914qkj.322.1559580976267; 
 Mon, 03 Jun 2019 09:56:16 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:18 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <9e1b5998a28f82b16076fc85ab4f88af5381cf74.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 16/16] selftests, arm64: add a selftest for passing tagged
 pointers to kernel
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
 bh=v9MzlIb7HY1yKtXIqdaDnLUOCgnoLYityVGh+V+FCFI=;
 b=E8Ist5LC6WVHrU8hj11VtWQb5rjU7iBORWjaptcqcX3l9oPWYIMo05KmXzzCVgt3cu
 lYJ4Yvl8mbNlJpJWSEYMIryL5scHXmPmVUqUSjI9X7Fuxa39wo8rzDRZFWMAkoj3uwjY
 mqiCqrBWPtOVkiL+4ZV5H/HhzxJmpTR97uHC/IdXM4tljhuvgYTiLw3741mzKX8NYLUt
 uc6Aqh8uuXDuaxHP4yeJ0XLPpMovyAE85DGwVCzioR0Gt6moVfBUOYshZAWVCnGUBbU4
 06NzOvSR4tkaeqT9+eniQMZF90V1u65K6kkbFscWsH7pqN+ptT1wb5JpdkKVZRneJwoH
 CGYw==
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

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgpUaGlzIHBhdGNoIGFkZHMgYSBzaW1wbGUgdGVzdCwgdGhhdCBjYWxscyB0aGUg
dW5hbWUgc3lzY2FsbCB3aXRoIGEKdGFnZ2VkIHVzZXIgcG9pbnRlciBhcyBhbiBhcmd1bWVudC4g
V2l0aG91dCB0aGUga2VybmVsIGFjY2VwdGluZyB0YWdnZWQKdXNlciBwb2ludGVycyB0aGUgdGVz
dCBmYWlscyB3aXRoIEVGQVVMVC4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFu
ZHJleWtudmxAZ29vZ2xlLmNvbT4KLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC8u
Z2l0aWdub3JlICAgICAgfCAgMSArCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9NYWtl
ZmlsZSAgICAgICAgfCAyMiArKysrKysrKysrCiAuLi4vdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQv
cnVuX3RhZ3NfdGVzdC5zaCAgfCAxMiArKysrKysKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Fy
bTY0L3RhZ3NfbGliLmMgICAgICB8IDQyICsrKysrKysrKysrKysrKysrKysKIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jICAgICB8IDE4ICsrKysrKysrCiA1IGZpbGVz
IGNoYW5nZWQsIDk1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9hcm02NC8uZ2l0aWdub3JlCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDc1NSB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9ydW5fdGFnc190ZXN0LnNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc19saWIuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jCgpkaWZm
IC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvLmdpdGlnbm9yZSBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0Ly5naXRpZ25vcmUKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwLi5lOGZhZThkNjFlZDYKLS0tIC9kZXYvbnVsbAorKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC8uZ2l0aWdub3JlCkBAIC0wLDAgKzEgQEAKK3RhZ3Nf
dGVzdApkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvTWFrZWZpbGUg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9NYWtlZmlsZQpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjlkZWUxODcyNzkyMwotLS0gL2Rldi9udWxsCisrKyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01ha2VmaWxlCkBAIC0wLDAgKzEsMjIgQEAK
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKworaW5jbHVkZSAuLi9saWIubWsK
KworIyBBUkNIIGNhbiBiZSBvdmVycmlkZGVuIGJ5IHRoZSB1c2VyIGZvciBjcm9zcyBjb21waWxp
bmcKK0FSQ0ggPz0gJChzaGVsbCB1bmFtZSAtbSAyPi9kZXYvbnVsbCB8fCBlY2hvIG5vdCkKKwor
aWZuZXEgKCwkKGZpbHRlciAkKEFSQ0gpLGFhcmNoNjQgYXJtNjQpKQorCitURVNUX0NVU1RPTV9Q
Uk9HUyA6PSAkKE9VVFBVVCkvdGFnc190ZXN0CisKKyQoT1VUUFVUKS90YWdzX3Rlc3Q6IHRhZ3Nf
dGVzdC5jICQoT1VUUFVUKS90YWdzX2xpYi5zbworCSQoQ0MpIC1vICRAICQoQ0ZMQUdTKSAkKExE
RkxBR1MpICQ8CisKKyQoT1VUUFVUKS90YWdzX2xpYi5zbzogdGFnc19saWIuYworCSQoQ0MpIC1v
ICRAIC1zaGFyZWQgJChDRkxBR1MpICQoTERGTEFHUykgJF4KKworVEVTVF9QUk9HUyA6PSBydW5f
dGFnc190ZXN0LnNoCisKK2FsbDogJChURVNUX0NVU1RPTV9QUk9HUykKKworZW5kaWYKZGlmZiAt
LWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3J1bl90YWdzX3Rlc3Quc2ggYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9ydW5fdGFnc190ZXN0LnNoCm5ldyBmaWxlIG1v
ZGUgMTAwNzU1CmluZGV4IDAwMDAwMDAwMDAwMC4uMmJiZTBjZDQyMjBiCi0tLSAvZGV2L251bGwK
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvcnVuX3RhZ3NfdGVzdC5zaApAQCAt
MCwwICsxLDEyIEBACisjIS9iaW4vc2gKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAKKworZWNobyAiLS0tLS0tLS0tLS0tLS0tLS0tLS0iCitlY2hvICJydW5uaW5nIHRhZ3MgdGVz
dCIKK2VjaG8gIi0tLS0tLS0tLS0tLS0tLS0tLS0tIgorTERfUFJFTE9BRD0uL3RhZ3NfbGliLnNv
IC4vdGFnc190ZXN0CitpZiBbICQ/IC1uZSAwIF07IHRoZW4KKwllY2hvICJbRkFJTF0iCitlbHNl
CisJZWNobyAiW1BBU1NdIgorZmkKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2FybTY0L3RhZ3NfbGliLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC90YWdzX2xp
Yi5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uOGE2NzQ1MDkyMTZl
Ci0tLSAvZGV2L251bGwKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc19s
aWIuYwpAQCAtMCwwICsxLDQyIEBACisjaW5jbHVkZSA8c3RkbGliLmg+CisKKyNkZWZpbmUgVEFH
X1NISUZUCSg1NikKKyNkZWZpbmUgVEFHX01BU0sJKDB4ZmZVTCA8PCBUQUdfU0hJRlQpCisKK3Zv
aWQgKl9fbGliY19tYWxsb2Moc2l6ZV90IHNpemUpOwordm9pZCBfX2xpYmNfZnJlZSh2b2lkICpw
dHIpOwordm9pZCAqX19saWJjX3JlYWxsb2Modm9pZCAqcHRyLCBzaXplX3Qgc2l6ZSk7Cit2b2lk
ICpfX2xpYmNfY2FsbG9jKHNpemVfdCBubWVtYiwgc2l6ZV90IHNpemUpOworCitzdGF0aWMgdm9p
ZCAqdGFnX3B0cih2b2lkICpwdHIpCit7CisJdW5zaWduZWQgbG9uZyB0YWcgPSByYW5kKCkgJiAw
eGZmOworCWlmICghcHRyKQorCQlyZXR1cm4gcHRyOworCXJldHVybiAodm9pZCAqKSgodW5zaWdu
ZWQgbG9uZylwdHIgfCAodGFnIDw8IFRBR19TSElGVCkpOworfQorCitzdGF0aWMgdm9pZCAqdW50
YWdfcHRyKHZvaWQgKnB0cikKK3sKKwlyZXR1cm4gKHZvaWQgKikoKHVuc2lnbmVkIGxvbmcpcHRy
ICYgflRBR19NQVNLKTsKK30KKwordm9pZCAqbWFsbG9jKHNpemVfdCBzaXplKQoreworCXJldHVy
biB0YWdfcHRyKF9fbGliY19tYWxsb2Moc2l6ZSkpOworfQorCit2b2lkIGZyZWUodm9pZCAqcHRy
KQoreworCV9fbGliY19mcmVlKHVudGFnX3B0cihwdHIpKTsKK30KKwordm9pZCAqcmVhbGxvYyh2
b2lkICpwdHIsIHNpemVfdCBzaXplKQoreworCXJldHVybiB0YWdfcHRyKF9fbGliY19yZWFsbG9j
KHVudGFnX3B0cihwdHIpLCBzaXplKSk7Cit9CisKK3ZvaWQgKmNhbGxvYyhzaXplX3Qgbm1lbWIs
IHNpemVfdCBzaXplKQoreworCXJldHVybiB0YWdfcHRyKF9fbGliY19jYWxsb2Mobm1lbWIsIHNp
emUpKTsKK30KZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3Nf
dGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4yNjNiMzAyODc0ZWQKLS0tIC9kZXYv
bnVsbAorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC90YWdzX3Rlc3QuYwpAQCAt
MCwwICsxLDE4IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorCisjaW5j
bHVkZSA8c3RkaW8uaD4KKyNpbmNsdWRlIDxzdGRsaWIuaD4KKyNpbmNsdWRlIDx1bmlzdGQuaD4K
KyNpbmNsdWRlIDxzdGRpbnQuaD4KKyNpbmNsdWRlIDxzeXMvdXRzbmFtZS5oPgorCitpbnQgbWFp
bih2b2lkKQoreworCXN0cnVjdCB1dHNuYW1lICpwdHI7CisJaW50IGVycjsKKworCXB0ciA9IChz
dHJ1Y3QgdXRzbmFtZSAqKW1hbGxvYyhzaXplb2YoKnB0cikpOworCWVyciA9IHVuYW1lKHB0cik7
CisJZnJlZShwdHIpOworCXJldHVybiBlcnI7Cit9Ci0tIAoyLjIyLjAucmMxLjMxMS5nNWQ3NTcz
YTE1MS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
