Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 819EF71ED1
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253FF6E332;
	Tue, 23 Jul 2019 18:11:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460E08947A
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:59:56 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id 6so26691619pfz.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=jOShWl3tVsknYDB/YoUvrUIV3eQMt6LYV5d/jQUs6fk=;
 b=qArSC6rG3O7+cKnrZ9Np1YfFhXxWiGCk8NVr25c3CU5pK9skK/IpRBOKKwctAvvBq3
 5d0p0Q50AdDhpSqD37cmx19ihUXuDeU+93BGbWllWb4kM8+O7XigU01NpAUQDFzMZ3yQ
 GS411cW9gLE5JJ3UwcH1cIwxchNbcfPferqiYWf8SSqxURhJGr4wTs4Iz01qbDc+juz0
 yOHUDU1/NGrOpML3nIusMIshbLsZMW8BJ6CqW7+8fBNcGqlIAZvIw5WfhsppK/N2q3MB
 KSpsf/rUxn3FFWgKPLcqfH0Sc4Et6mPHxrzGeeFx70i0F4s7jMUEVukbAExmBj5rFlYe
 k3Tg==
X-Gm-Message-State: APjAAAUP8E2cE+YhCiTkauXPhtrc5CzL3iH5hjcLOU/GiT6Z3WY8kglL
 D7BqItUVV/m4RwkQj6xJeJ49nDjjXGsZkZ0M
X-Google-Smtp-Source: APXvYqxAti31RDws7lqydpjpU2QNSIYIBexpp6X7xTgogP1B1IYuH3vnzKrv44nIChFaGEFwrbMkdTHOIZSmLzhz
X-Received: by 2002:a65:5a44:: with SMTP id z4mr77715645pgs.41.1563904795339; 
 Tue, 23 Jul 2019 10:59:55 -0700 (PDT)
Date: Tue, 23 Jul 2019 19:58:52 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <c1e6aad230658bc175b42d92daeff2e30050302a.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 15/15] selftests, arm64: add a selftest for passing tagged
 pointers to kernel
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
 bh=jOShWl3tVsknYDB/YoUvrUIV3eQMt6LYV5d/jQUs6fk=;
 b=h3Kq7We2lcnT64/ZTs7I4tdBthajlqrQq0s3uG0rcdUUGUvc4KeWtl8Lap+IaEU0xC
 yYJQXzHFT7D2Jqscee4HDCwPCbx8Wu4vGwr8iHjoxORK9KGqLusafVkNZ/vi+rdiyHeG
 jdIKwPH4OSoAMEvF/wL6dPzkou8jWXYcRntfsmvla/c6SEeJlZfF2ghZPEbGkeY9ptz1
 cvZXKirYuxY3KSRTfpbbshoiYk3G2vA59VITNzPxXSGn8hhh7sloFpM7Eqe6wa8z0eYK
 HPQ0vNQ1FWKABTpWUeLw9Zvt3IMDsn825fB13HkZ/3l6+zJgRTNpYSRvvg1VGXgpvW9L
 /8xQ==
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
dHMuCgpUaGlzIHBhdGNoIGFkZHMgYSBzaW1wbGUgdGVzdCwgdGhhdCBjYWxscyB0aGUgdW5hbWUg
c3lzY2FsbCB3aXRoIGEKdGFnZ2VkIHVzZXIgcG9pbnRlciBhcyBhbiBhcmd1bWVudC4gV2l0aG91
dCB0aGUga2VybmVsIGFjY2VwdGluZyB0YWdnZWQKdXNlciBwb2ludGVycyB0aGUgdGVzdCBmYWls
cyB3aXRoIEVGQVVMVC4KClJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFy
aW5hc0Bhcm0uY29tPgpBY2tlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+
ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4K
LS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC8uZ2l0aWdub3JlICAgICAgfCAgMSAr
CiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9NYWtlZmlsZSAgICAgICAgfCAxMSArKysr
KysrCiAuLi4vdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvcnVuX3RhZ3NfdGVzdC5zaCAgfCAxMiAr
KysrKysrKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMgICAgIHwg
MjkgKysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvLmdpdGln
bm9yZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01h
a2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA3NTUgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQv
cnVuX3RhZ3NfdGVzdC5zaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2FybTY0L3RhZ3NfdGVzdC5jCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvYXJtNjQvLmdpdGlnbm9yZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0Ly5naXRp
Z25vcmUKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5lOGZhZThkNjFl
ZDYKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC8uZ2l0
aWdub3JlCkBAIC0wLDAgKzEgQEAKK3RhZ3NfdGVzdApkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvYXJtNjQvTWFrZWZpbGUgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02
NC9NYWtlZmlsZQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmE2MWIy
ZTc0M2U5OQotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0
L01ha2VmaWxlCkBAIC0wLDAgKzEsMTEgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAKKworIyBBUkNIIGNhbiBiZSBvdmVycmlkZGVuIGJ5IHRoZSB1c2VyIGZvciBjcm9zcyBj
b21waWxpbmcKK0FSQ0ggPz0gJChzaGVsbCB1bmFtZSAtbSAyPi9kZXYvbnVsbCB8fCBlY2hvIG5v
dCkKKworaWZuZXEgKCwkKGZpbHRlciAkKEFSQ0gpLGFhcmNoNjQgYXJtNjQpKQorVEVTVF9HRU5f
UFJPR1MgOj0gdGFnc190ZXN0CitURVNUX1BST0dTIDo9IHJ1bl90YWdzX3Rlc3Quc2gKK2VuZGlm
CisKK2luY2x1ZGUgLi4vbGliLm1rCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9hcm02NC9ydW5fdGFnc190ZXN0LnNoIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQv
cnVuX3RhZ3NfdGVzdC5zaApuZXcgZmlsZSBtb2RlIDEwMDc1NQppbmRleCAwMDAwMDAwMDAwMDAu
Ljc0NWYxMTM3OTkzMAotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2FybTY0L3J1bl90YWdzX3Rlc3Quc2gKQEAgLTAsMCArMSwxMiBAQAorIyEvYmluL3NoCisjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisKK2VjaG8gIi0tLS0tLS0tLS0tLS0tLS0t
LS0tIgorZWNobyAicnVubmluZyB0YWdzIHRlc3QiCitlY2hvICItLS0tLS0tLS0tLS0tLS0tLS0t
LSIKKy4vdGFnc190ZXN0CitpZiBbICQ/IC1uZSAwIF07IHRoZW4KKwllY2hvICJbRkFJTF0iCitl
bHNlCisJZWNobyAiW1BBU1NdIgorZmkKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2FybTY0L3RhZ3NfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFn
c190ZXN0LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4yMmExYjI2
NmUzNzMKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC90
YWdzX3Rlc3QuYwpAQCAtMCwwICsxLDI5IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMAorCisjaW5jbHVkZSA8c3RkaW8uaD4KKyNpbmNsdWRlIDxzdGRsaWIuaD4KKyNpbmNs
dWRlIDx1bmlzdGQuaD4KKyNpbmNsdWRlIDxzdGRpbnQuaD4KKyNpbmNsdWRlIDxzeXMvcHJjdGwu
aD4KKyNpbmNsdWRlIDxzeXMvdXRzbmFtZS5oPgorCisjZGVmaW5lIFNISUZUX1RBRyh0YWcpCQko
KHVpbnQ2NF90KSh0YWcpIDw8IDU2KQorI2RlZmluZSBTRVRfVEFHKHB0ciwgdGFnKQkoKCh1aW50
NjRfdCkocHRyKSAmIH5TSElGVF9UQUcoMHhmZikpIHwgXAorCQkJCQlTSElGVF9UQUcodGFnKSkK
KworaW50IG1haW4odm9pZCkKK3sKKwlzdGF0aWMgaW50IHRiaV9lbmFibGVkID0gMDsKKwlzdHJ1
Y3QgdXRzbmFtZSAqcHRyLCAqdGFnZ2VkX3B0cjsKKwlpbnQgZXJyOworCisJaWYgKHByY3RsKFBS
X1NFVF9UQUdHRURfQUREUl9DVFJMLCBQUl9UQUdHRURfQUREUl9FTkFCTEUsIDAsIDAsIDApID09
IDApCisJCXRiaV9lbmFibGVkID0gMTsKKwlwdHIgPSAoc3RydWN0IHV0c25hbWUgKiltYWxsb2Mo
c2l6ZW9mKCpwdHIpKTsKKwlpZiAodGJpX2VuYWJsZWQpCisJCXRhZ2dlZF9wdHIgPSAoc3RydWN0
IHV0c25hbWUgKilTRVRfVEFHKHB0ciwgMHg0Mik7CisJZXJyID0gdW5hbWUodGFnZ2VkX3B0cik7
CisJZnJlZShwdHIpOworCisJcmV0dXJuIGVycjsKK30KLS0gCjIuMjIuMC43MDkuZzEwMjMwMjE0
N2ItZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
